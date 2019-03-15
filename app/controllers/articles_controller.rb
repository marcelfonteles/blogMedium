class ArticlesController < ApplicationController
    def index
    end
    def new
        @article = Article.new
    end
    def create
        # render plain: params[:article].inspect
        @article = Article.new(articles_params)
        @article.save
        redirect_to root_path
    end


private
   def articles_params
       params.require(:article).permit(:title, :description)
   end
end