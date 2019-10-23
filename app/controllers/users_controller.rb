class UsersController < ApplicationController
    def index
        @users = User.all
    end
    
    def new
        @user = User.new
    end
    
    def create
        @user = User.new(prams)

        if @user.valid?
            @user.save
            redirect_to @user
        else
            flash[:error] = @user.errors.full_messages
            redirect_to new_user_path
        end
    end
    
    def edit
    
    end
    
    def update
        @user.update(prams)
        redirect_to @user
    end
    
    def show
    
    end
    
    def destroy
        @user.destroy 
        redirect_to users_path
    end

    private

    def current 
        @user = User.find(params[:id])
    end

    def prams 
        params.require(:user).permit(:user_name, :password)
    end
end
