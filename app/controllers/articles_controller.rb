class ArticlesController < ApplicationController
    def index
    end
    def new
        @article = Article.new
    end
    def create
        # render plain: params[:article].inspect
        @article = Article.new(articles_params)
        if @article.save
            flash[:notice] = "Article was successfully created"
            redirect_to root_path
        else
            render 'new'
        end
    end
    def show
        @article = Article.find(params[:id])
    end
    def edit
        @article = Article.find(params[:id])
    end


private
   def articles_params
       params.require(:article).permit(:title, :description)
   end
end