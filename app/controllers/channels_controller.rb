class ChannelsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :set_channels, :only=>[:change_channel, :index]
  before_filter :set_channel, :only=>[:change_channel, :edit, :destroy, :show, :update]
  before_filter :set_articles, :only=>[:change_channel]
  # GET /channels
  # GET /channels.json
  def index

    @channel = @channels[0]
    @articles = @channel.articles.order('pubdate desc')  unless @channel.blank?
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @channels }
    end
  end

  # GET /channels/1
  # GET /channels/1.json
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @channel }
    end
  end

  # GET /channels/new
  # GET /channels/new.json
  def new
    @channel = current_user.channels.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @channel }
    end
  end

  # GET /channels/1/edit
  def edit

  end

  # POST /channels
  # POST /channels.json
  def create
    @channel = current_user.channels.new(params[:channel])

    respond_to do |format|
      if @channel.save
        format.html { redirect_to @channel, notice: 'Channel was successfully created.' }
        format.json { render json: @channel, status: :created, location: @channel }
      else
        format.html { render action: "new" }
        format.json { render json: @channel.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /channels/1
  # PUT /channels/1.json
  def update
    respond_to do |format|
      if @channel.update_attributes(params[:channel])
        format.html { redirect_to @channel, notice: 'Channel was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @channel.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /channels/1
  # DELETE /channels/1.json
  def destroy
    @channel.destroy

    respond_to do |format|
      format.html { redirect_to channels_url }
      format.json { head :no_content }
    end
  end


  def take_title
    @doc = Pismo::Document.new(params[:url])
  end

  def change_channel
    respond_to do |format|
      format.js
    end
  end

  protected

  def set_channels
    @channels = current_user.channels.order('name').all
  end

  def set_channel
    @channel = current_user.channels.find(params[:id])
  end

  def set_articles
    @articles = @channel.articles.order('pubdate desc')
  end
end
