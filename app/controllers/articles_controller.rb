class ArticlesController < ApplicationController
    before_action :set_article, only: [:show, :update, :destroy, :edit]
    def index
        @articles = Article.all
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
    def update
        @article = Article.find(params[:id])
        if @article.update(articles_params)
            flash[:notice] = "Article was updated"
            redirect_to root_path
        else
            flash[:notice] = "Article was not updated"
            render 'edit'
        end
    end
    def destroy
        @article = Article.find(params[:id])
        @article.destroy
        flash[:notice] = "Article was deleted"
        redirect_to articles_path
    end


private
   def articles_params
       params.require(:article).permit(:title, :description)
   end
   
   def set_article
       @article = Article.find(params[:id])
   end
end