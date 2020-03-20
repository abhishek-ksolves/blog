class ThumbsController < ApplicationController
  before_action :find_article
  before_action :find_thumb, only: [:destroy]
  def create
    if already_thumbd?
      flash[:notice] = "You can't like more than once"
    else
      @article.thumbs.create(user_id: current_user.id)
    end
      #redirect_to article_path(@article)
      @thumb_count = @article.thumbs.count
      render json: {count: @thumb_count}
  end

  def destroy

    if !(already_thumbd?)
      flash[:notice] = "Cannot unlike"
    else
      @thumb.destroy
    end
    @thumb_count = @article.thumbs.count
    render json: {count: @thumb_count}
  end



  private

  def find_thumb
     @thumb = @article.thumbs.where(user: current_user).last
  end

  def already_thumbd?
    Thumb.where(user_id: current_user.id, article_id: params[:article_id]).exists?
  end

  def find_article
    @article = Article.find(params[:article_id])
  end
end
