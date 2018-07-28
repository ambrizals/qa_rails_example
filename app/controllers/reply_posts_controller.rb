class ReplyPostsController < ApplicationController
  before_action :set_reply_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]

  # GET /reply_posts
  # GET /reply_posts.json
  def index
    @reply_posts = ReplyPost.all
  end

  # GET /reply_posts/1
  # GET /reply_posts/1.json
  def show
  end

  # GET /reply_posts/new
  def new
    @reply_post = ReplyPost.new
  end

  # GET /reply_posts/1/edit
  def edit
  end

  # POST /reply_posts
  # POST /reply_posts.json
  def create
    @reply_post = ReplyPost.new(reply_post_params)

    respond_to do |format|
      if @reply_post.save
        format.html { redirect_to @reply_post, notice: 'Reply post was successfully created.' }
        format.json { render :show, status: :created, location: @reply_post }
      else
        format.html { render :new }
        format.json { render json: @reply_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reply_posts/1
  # PATCH/PUT /reply_posts/1.json
  def update
    respond_to do |format|
      if @reply_post.update(reply_post_params)
        format.html { redirect_to @reply_post, notice: 'Reply post was successfully updated.' }
        format.json { render :show, status: :ok, location: @reply_post }
      else
        format.html { render :edit }
        format.json { render json: @reply_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reply_posts/1
  # DELETE /reply_posts/1.json
  def destroy
    @reply_post.destroy
    respond_to do |format|
      format.html { redirect_to reply_posts_url, notice: 'Reply post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reply_post
      @reply_post = ReplyPost.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reply_post_params
      params.require(:reply_post).permit(:post, :content, :user)
    end
end
