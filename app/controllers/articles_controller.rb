class ArticlesController < ApplicationController
before_action :search_art, only: [:show, :edit, :update, :destroy]
    def show

end

def index 
@art = Article.all
end

def new
@art = Article.new()
end

def edit 

    end

def create
@art = Article.new(set_para)
 if @art.save
flash[:notice] = "article successfully created!"
redirect_to @art
 else
    render :new, status: :unprocessable_entity
end
end

 

def update
    if @art.update(set_para)
        flash[:notice] = "article updated!!"
        redirect_to @art
        else
            render :edit, status: :unprocessable_entity
        end
end

def destroy
@art.destroy
redirect_to articles_path
end
end

private
 def search_art
    @art = Article.find(params[:id])
 end

 def set_para
    params.require(:article).permit(:title, :description)
 end