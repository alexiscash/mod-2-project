class ReviewsController < ApplicationController
    def create
        Review.create(prams)
    end

    private

    def prams 
        params.require(:review).permit(:content, :user_id, :rating, :title_id)
    end
end
