class ArticlesController < ApplicationController
	#http_basic_authenticate_with name: "a", password: "a", except: [:index, :show]
  	def new
  		@article = Article.new
  	end

  	def index
    	@count = Article.all.count
      #@articles = Article.order(:id).page params[:page]
      @articles = Article.order(:id).eager_load(:comments).page params[:page]
    	flash.now[:notice] = "We have total #{@count} articles available."
  	end

	def create
		@article = Article.new(article_params)
		if @article.save
		    redirect_to articles_path, mess: "Successfully Saved"
		else
		    render 'new'
		end
	end

	def edit
  		@article = Article.find(params[:id])
	end

	def show
      @article = Article.find(params[:id])
      #@thumb_id = @article.thumbs.where(user: current_user)
  	end

  	def update
      @article = Article.find(params[:id])

      if @article.update(article_params)
        redirect_to @article
      else
      	render 'edit'
      end
    end

	def destroy
	  @article = Article.find(params[:id])
	  @article.destroy
	  redirect_to articles_path
	end

	private
  	def article_params
    	params.require(:article).permit(:title, :text, :user_id, picture_attributes: [:name, :imageable_id, :imageable_type])
  	end

end
