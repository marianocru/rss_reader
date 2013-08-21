class ArticlesController < ApplicationController
  # GET /articles
  # GET /articles.json
  def index
    @articles = Article.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @articles }
    end
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
    @article = Article.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @article }
    end
  end

  # GET /articles/new
  # GET /articles/new.json
  def new
    @article = Article.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @article }
    end
  end

  # GET /articles/1/edit
  def edit
    @article = Article.find(params[:id])
  end

  # POST /articles
  # POST /articles.json
  def create
    @article = Article.new(params[:article])

    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: 'Article was successfully created.' }
        format.json { render json: @article, status: :created, location: @article }
      else
        format.html { render action: "new" }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /articles/1
  # PUT /articles/1.json
  def update
    @article = Article.find(params[:id])

    respond_to do |format|
      if @article.update_attributes(params[:article])
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    respond_to do |format|
      format.html { redirect_to articles_url }
      format.json { head :no_content }
    end
  end

  def add_remove_favorite
    @article = Article.find(params[:id])
    @article.mark = !@article.mark
    @article.save
        respond_to do |format|
      format.js
    end
  end

  def add_comment
    @article = Article.find(params[:id])
    @comment = @article.comments.new
    respond_to do |format|
      format.js
    end
  end

  def show_comments
    @article = Article.find(params[:id])
    respond_to do |format|
      format.js
    end
  end

  def hide_comments
    @article = Article.find(params[:id])
    respond_to do |format|
      format.js
    end
  end

  def search
    @articles = Article.search(params[:channel_id], params[:tittle], params[:summary], current_user.id)
    (@channel = Channel.find(params[:channel_id])) unless  params[:channel_id].blank?
    @search = true
    respond_to do |format|
      format.js
    end
  end

  def show_favorites
    @articles = Article.where(["mark = 'true' and channel_id in (select id from channels where user_id = ? )", current_user])
    @channel = ''
    @search = true
    respond_to do |format|
      format.js
    end
  end
end
