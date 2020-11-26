class ReviewsController < ApplicationController
    
    before_action :set_review, only: [:destroy]

    def new
        @computer = Computer.find(params[:computer_id])
        @review = Review.new
        authorize(@review)
    end

    def create
        @review = Review.new(review_params)
        authorize(@review)
        @computer = Computer.find(params[:computer_id])
        @review.computer = @computer
        @review.save
        if @review.save
            redirect_to computer_path(@computer)
        else
            render :new
        end
    end

    def destroy
        @review.destroy
        authorize(@review)
    end

    private
    def set_review
        @review = Review.find(params[:id])
        authorize(@review)
    end

    def review_params
        params.require(:review).permit(:title, :content)
    end
end
