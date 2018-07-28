class PostRepliesController < ApplicationController
  before_action :set_post_reply, only: [:show, :edit, :update, :destroy]

  # GET /post_replies
  # GET /post_replies.json
  def index
    @post_replies = PostReply.all
  end

  # GET /post_replies/1
  # GET /post_replies/1.json
  def show
  end

  # GET /post_replies/new
  def new
    @post_reply = PostReply.new
  end

  # GET /post_replies/1/edit
  def edit
  end

  # POST /post_replies
  # POST /post_replies.json
  def create
    @post_reply = PostReply.new(post_reply_params)

    respond_to do |format|
      if @post_reply.save
        format.html { redirect_to @post_reply, notice: 'Post reply was successfully created.' }
        format.json { render :show, status: :created, location: @post_reply }
      else
        format.html { render :new }
        format.json { render json: @post_reply.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /post_replies/1
  # PATCH/PUT /post_replies/1.json
  def update
    respond_to do |format|
      if @post_reply.update(post_reply_params)
        format.html { redirect_to @post_reply, notice: 'Post reply was successfully updated.' }
        format.json { render :show, status: :ok, location: @post_reply }
      else
        format.html { render :edit }
        format.json { render json: @post_reply.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /post_replies/1
  # DELETE /post_replies/1.json
  def destroy
    @post_reply.destroy
    respond_to do |format|
      format.html { redirect_to post_replies_url, notice: 'Post reply was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post_reply
      @post_reply = PostReply.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_reply_params
      params.require(:post_reply).permit(:post_id, :content, :user_id, :flag_delete)
    end
end
