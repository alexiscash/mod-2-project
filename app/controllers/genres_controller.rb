class GenresController < ApplicationController
    before_action :current, only: [:edit, :update, :show, :destroy]

   def search
     @genre = Genre.find_by(name: params[:q])
     @titles = @genre.titles
   end

   def index
     @genres = Genre.all
   end
   
   def new 
     @genre = Genre.new
   end
   
   def create
     @genre = Genre.new(prams)

     if @genre.valid?
          @genre.save
          redirect_to @genre
     else
          flash[:errors] = @genre.errors.full_messages
          redirect_to new_genre_path
     end
   end
   
   def edit
   
   end
   
   def update
     @genre.update(prams)
     @genre.save
     redirect_to @genre
   end
   
   def show
   
   end
   
   def destroy
     @genre.destroy
     redirect_to genres_path
   end

   private

   def current
     @genre = Genre.find(params[:id])
   end

   def prams 
     params.require(:genre).permit(:name)
   end
   
end
