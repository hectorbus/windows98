class PicturesController < ApplicationController

  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.new(picture_params)
    @picture.title = comment_params[:title]
    
    if @picture.save
      redirect_to root_path
    end
  end

  def destroy
    # code
  end

  private

  def picture_params
    params.require(:picture).permit(:photo, :title)
  end
end
