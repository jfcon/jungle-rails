class ReviewsController < ApplicationController
    
    def new
    end

    def create
        product = Product.find params[:product_id] 
        @review = Review.new(review_params)
        @review.product_id = product.id
        @review.user_id = current_user.id
        if @review.save
            redirect_to product, notice: 'Review posted!'
        else
            redirect_to product
        end
    end

    def destroy
        Review.find(params[:id]).destroy
        redirect_to "/products/#{params[:product_id]}"
    end

    private
    def review_params
        params.require(:review).permit(
            :description, 
            :rating
            )
        end
end
