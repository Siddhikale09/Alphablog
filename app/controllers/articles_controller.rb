class ArticlesController < ApplicationController
def show
@art = Article.find(params[:id])
end

def index 
@art = Article.all
end

def new
@art = Article.new()
end

def edit 
    @art = Article.find(params[:id])
    end

def create
@art = Article.new(params.require(:article).permit(:title, :description))
 if @art.save
flash[:notice] = "article successfully created!"
redirect_to @art
 else
    render :new, status: :unprocessable_entity
end
end

 

def update
    @art = Article.find(params[:id])
    if @art.update(params.require(:article).permit(:title, :description))
        flash[:notice] = "article updated!!"
        redirect_to @art
        else
            render :edit, status: :unprocessable_entity
        end
end

def delete
@art = Article.find(params[:id])
if @art.destroy
flash[:notice] = 'Article deleted sucessfully!'
redirect_to articles_path
else 
    flash[:notice] = 'Article could not be deleted!'
    redirect_to articles_path
end
end

end