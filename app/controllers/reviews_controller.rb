class ReviewsController < ApplicationController
  before_action :set_review, only: %i[ show edit update destroy ]

  # GET /reviews
  def index
    @reviews = Drink.find(params[:drink_id]).reviews
  end

  # GET /reviews/1
  def show
  end

  # GET /reviews/new
  def new
    drink = Drink.find(params[:drink_id])
    @review = drink.reviews.build
  end

  # GET /reviews/1/edit
  def edit
  end

  # POST /reviews
  def create
    @review = Review.new(review_params)
    @review.drink = Drink.find(params[:drink_id])
    @review.author = Current.user

    if @review.save
      redirect_to @review.drink
    else
      render :new, status: :unprocessable_content
    end
  end

  # PATCH/PUT /reviews/1
  def update
    if @review.update(review_params)
      redirect_to @review, notice: "Review was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_content
    end
  end

  # DELETE /reviews/1
  def destroy
    @review.destroy!
    redirect_to reviews_path, notice: "Review was successfully destroyed.", status: :see_other
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def review_params
      params.expect(review: [ :rating, :comment, :drink_id, :author_id ])
    end
end
