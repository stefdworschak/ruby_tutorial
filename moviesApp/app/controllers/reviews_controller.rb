class ReviewsController < ApplicationController

  # GET /movies/1/reviews
  def index
    # For URL like /movies/1/reviews
    # Get the movie with id=1
    @movie = Movie.find(params[:movie_id])
    # Get all reviews for the movie
    @reviews = @movie.reviews
  end

  # GET /movies/1/reviews/2
  def show
    @movie = Movie.find(params[:movie_id])
    # Find the specified review for the movie
    @review = @movie.reviews.find(params[:id])
  end

  # This is the page to display the Add Review Form
  # GET /movies/1/reviews/new
  def new
    @movie = Movie.find(params[:movie_id].to_i)
    # Associate a review object to the specified movie
    @review = @movie.reviews.build
  end

  # This is the function to catch and handle to post from
  # the form at /movies/1/reviews/new
  # POST /movies/1/reviews
  def create
    @movie = Movie.find(params[:movie_id])
    # Create new review in the specified movie
    # Using the form details
    @review = @movie.reviews.build(params.require(:review).permit(:details))

    if @review.save
      # Save the review successfully
      redirect_to movie_review_url(@movie, @review)
    else
      # Otherwise redirect to new page
      ender :action => "new"
    end

  end
  
  # GET /movies/1/reviews/1/edit
  def edit
    @movie = Movie.find(params[:movie_id])
    @review = @movie.reviews.find(params[:id])
  end

  # Function to catch and handle the data
  # from the form at /movies/1/reviews/1/edit
  # PUT /movies/1/reviews/1
  def update
    @movie = Movie.find(params[:movie_id])
    @review = @movie.reviews.find(params[:id])

    if @review.update_attributes(params.require(:review).permit(:details))
      redirect_to movie_review_url(@movie, @review)
    else
      render :action => "edit"
    end

  end

  def destroy
    @movie = @movie = Movie.find(params[:movie_id])
    @review = @movie.reviews.find(params[:id])
    @review.destroy
    respond_to do |format|
      format.html { redirect_to movie_reviews_path(@movie) }
      format.xml { head :ok }
    end
  end
end


