class TitlesController < ApplicationController
    before_action :current, only: [:edit, :update, :show, :destroy, :add_review]

    def add_review
        @add = true
        redirect_to @title
    end

    def search
        @title = Title.find_by(name: params[:q])

        if @title 
            redirect_to @title
        else 
            api_key = '6e28a3f2'
            url = "http://www.omdbapi.com/?apikey=#{api_key}&t=#{params[:q]}"
            response = JSON.parse(RestClient.get(url, header={}))
            # byebug

            @genre = Genre.find_by(name: response["Genre"].split(', ').first.downcase)

            if !@genre 
                @genre = Genre.create(name: response["Genre"].split(', ').first.downcase)
            end

            @writer = Writer.find_by(name: response["Writer"])

            if !@writer 
                @writer = Writer.create(name: response["Writer"], genre_id: @genre.id)
            end

            if response["Response"] == "True"
                @title = Title.create(
                name: response["Title"],
                writer_id: @writer.id,
                description: response["Plot"],
                img: response["Poster"]
            )

                redirect_to @title

            else
                flash[:errors] = response["Error"]
                redirect_to titles_path
            end

            
        end
        
    end

    def index
        @titles = Title.all.sort_by{ |i| i.name }
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
        @review = Review.new
        @user = User.find_by(user_name: 'swag boi')
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