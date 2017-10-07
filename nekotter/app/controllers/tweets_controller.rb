class TweetsController < ApplicationController
  def index
    @tweets = Tweet.order(:created_at).page(params[:page]).per(5)
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    @tweet.save
  end

  private
  def tweet_params
    params.require(:tweet).permit(:text)
  end
end
