class ImagesController < ApplicationController
  before_action :set_image, only: [:show, :edit, :update, :destroy]
  def update
    respond_to do |format|
      if @image.update(image_params)
        format.html { redirect_to edit_post_url(id: @image.post),
                                  notice: 'Post attachment was successfully updated.' }
      end
    end
  end
  def destroy
    @image.destroy
    respond_to do |format|
      format.html { redirect_to edit_post_url(id: @image.post), notice: 'Post
 attachment was
successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  private
    def set_image
      @image = Image.find(params[:id])
    end
    def image_params
      params.require(:image).permit(:post_id, :image, :user_id)
    end
end
