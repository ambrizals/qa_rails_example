class PostRepliesController < ApplicationController
  before_action :set_post_reply, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]

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
    if (current_user.id == @post_reply.user_id) or (current_user.is_admin)

    else
      flash[:notice] = 'Access Denied'
      redirect_to post_path(@post_reply.post_id)
    end
  end

  # POST /post_replies
  # POST /post_replies.json
  def create
    @post_reply = PostReply.new
    @post_reply.post_id = params[:id]
    @post_reply.content = params[:content]
    @post_reply.user_id = current_user.id
    if @post_reply.save
      flash[:notice] = "Reply was succefully created"
      redirect_to post_path(params[:id])
    else
      flash[:alert] = "Error : Content can't be blank"
      redirect_to post_path(params[:id])
    end
  end

  # PATCH/PUT /post_replies/1
  # PATCH/PUT /post_replies/1.json
  def update
    if (current_user.id == @post_reply.user_id) or (current_user.is_admin)
      if @post_reply.update(post_reply_params)
        flash[:notice] = "Reply was succefully updated"
        redirect_to post_path(@post_reply.post_id)
      else
        flash[:alert] = "Error : Content can't be blank"
        redirect_to post_path(@post_reply.post_id)
      end
    else
      flash[:notice] = 'Access Denied'
      redirect_to post_path(@post_reply.post_id)
    end
  end

  # DELETE /post_replies/1
  # DELETE /post_replies/1.json
  def destroy
    if (current_user.id == @post_reply.user_id) or (current_user.is_admin)
      @post_reply.flag_delete = true
      @post_reply.save
      if @post_reply.save
        flash[:notice] = "Reply was succefully deleted"
        redirect_to post_path(@post_reply.post_id)
      else
        flash[:alert] = "Uppss...."
        redirect_to post_path(@post_reply.post_id)
      end
    else
      flash[:notice] = 'Access Denied'
      redirect_to post_path(@post_reply.post_id)
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
