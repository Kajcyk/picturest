class PhotosController < ApplicationController
  before_action :set_photo, only: [:show, :edit, :update, :destroy]
  def index
    @photos = Photo.all
  end

  def show
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(photo_params)

    if @photo.save
      flash[:success] = 'Utworzono nowe zdjęcie.'
      redirect_to @photo
    else
      flash.now[:danger] = 'Nie można utworzyć zdjęcia.'
      render :new
    end
  end

  def edit
  end

  def update

    if @photo.update(photo_params)
      flash[:success] = 'Aktualizacja przebiegła pomyślnie.'
      redirect_to @photo
    else
      flash.now[:danger] = 'Nie udało się zaktualizować.'
      render :edit
    end
  end

  def destroy
    @photo.destroy
    flash[:success] = 'Zdjęcie zostało usunięte.'
    redirect_to photos_url
  end

private
  def set_photo
    @photo = Photo.find(params[:id])
  end
  
  def photo_params
    params.require(:photo).permit(:title, :description, :image)
  end
end
