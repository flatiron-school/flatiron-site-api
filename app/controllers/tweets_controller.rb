class TweetsController < ApplicationController
  http_basic_authenticate_with name: "flatiron", password: "flat1ron", except: :index

  # GET /tweets
  # GET /tweets.json
  def index

    first_tweet = Tweet.first
    if first_tweet.nil?
      first_tweet = Tweet.new
    end

    @@count = first_tweet.id

    Twitter.user_timeline("FlatironSchool").first(3).each do |status|
      t = Tweet.find_by_id(@@count)
      if t.nil?
        t = Tweet.new
      end
      t.screen_name = status.user.screen_name
      t.content = status.text
      t.tweet_date_time = status.created_at
      t.save

      @@count += 1
    end

    @tweets = Tweet.order("id ASC")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tweets.to_json, callback: params[:callback] }
    end
  end

  # GET /tweets/1
  # GET /tweets/1.json
  def show
    @tweet = Tweet.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tweet }
    end
  end

  # GET /tweets/new
  # GET /tweets/new.json
  def new
    @tweet = Tweet.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tweet }
    end
  end

  # GET /tweets/1/edit
  def edit
    @tweet = Tweet.find(params[:id])
  end

  # POST /tweets
  # POST /tweets.json
  def create
    @tweet = Tweet.new(params[:tweet])

    respond_to do |format|
      if @tweet.save
        format.html { redirect_to @tweet, notice: 'Tweet was successfully created.' }
        format.json { render json: @tweet, status: :created, location: @tweet }
      else
        format.html { render action: "new" }
        format.json { render json: @tweet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tweets/1
  # PUT /tweets/1.json
  def update
    @tweet = Tweet.find(params[:id])

    respond_to do |format|
      if @tweet.update_attributes(params[:tweet])
        format.html { redirect_to @tweet, notice: 'Tweet was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @tweet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tweets/1
  # DELETE /tweets/1.json
  def destroy
    @tweet = Tweet.find(params[:id])
    @tweet.destroy

    respond_to do |format|
      format.html { redirect_to tweets_url }
      format.json { head :no_content }
    end
  end
end
