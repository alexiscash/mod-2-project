class TitlesController < ApplicationController
    before_action :current, only: [:edit, :update, :show, :destroy]

    def index
        @titles = Title.all
    end
    
    def new
        @title = Title.new
        @writers = Writer.all
    end
    
    def create
        @title = Title.new(prams)

        if @title.valid?
            @title.save
            redirect_to @title
        else
            flash[:errors] = @title.errors.full_messages
            redirect_to new_title_path
        end
    end
    
    def edit
        @writers = Writer.all
    end
    
    def update
        @title.update(prams)
        redirect_to @title
    end
    
    def show
    
    end
    
    def destroy
        @title.destroy 
        redirect_to titles_path
    end

    private

    def current
        @title = Title.find(params[:id])
    end

    def prams 
        params.require(:title).permit(:name, :description, :character, :quote, :writer_id)
    end
end