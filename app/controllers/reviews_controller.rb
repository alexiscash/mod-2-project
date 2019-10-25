class ReviewsController < ApplicationController
    def create
        Review.create(prams)
        @title = Title.find(params[:review][:title_id])
        redirect_to @title
    end

    private

    def prams 
        params.require(:review).permit(:content, :user_id, :rating, :title_id)
    end
end
