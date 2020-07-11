class TweetsController < ApplicationController
  before_action :set_tweet, only: [:edit, :show]
  before_action :move_to_index, except: [:index, :tweet, :show, :search]

  def index
    
  end

  def tweet
    if params[:option] == "A" || params[:option] == nil
          @tweets = Tweet.includes(:user).order("created_at DESC")
    elsif params[:option] == "B"
      @tweets = Tweet.includes(:user).order("area DESC")
    end
    
  end

  def new
    @tweet = Tweet.new
  end

  def create
    Tweet.create(tweet_params)
  end

  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy
  end

  def edit
  end

  def update
    tweet = Tweet.find(params[:id])
    tweet.update(tweet_params)
  end 

  def show
  end

  def search
    @tweets = Tweet.search(params[:keyword])
  end

  def import
    Tweet.import(params[:file])
    redirect_to tweet_tweets_path
  end
  
  private
  def tweet_params
    params.require(:tweet).permit(:name, :image, :text, :adress, :area).merge(user_id: current_user.id)
  end

  def set_tweet
    @tweet = Tweet.find(params[:id]) 
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

  def about
  end

  def portfolio
  end

  def contact
  end

  def photograph
  end

  def video
  end



end
