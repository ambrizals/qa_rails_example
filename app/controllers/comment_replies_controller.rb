class CommentRepliesController < ApplicationController
  before_action :set_comment_reply, only: [:show, :edit, :update, :destroy]

  # GET /comment_replies
  # GET /comment_replies.json
  def index
    @comment_replies = CommentReply.all
  end

  # GET /comment_replies/1
  # GET /comment_replies/1.json
  def show
  end

  # GET /comment_replies/new
  def new
    @comment_reply = CommentReply.new
  end

  # GET /comment_replies/1/edit
  def edit
  end

  # POST /comment_replies
  # POST /comment_replies.json
  def create
    @comment_reply = CommentReply.new(comment_reply_params)

    respond_to do |format|
      if @comment_reply.save
        format.html { redirect_to @comment_reply, notice: 'Comment reply was successfully created.' }
        format.json { render :show, status: :created, location: @comment_reply }
      else
        format.html { render :new }
        format.json { render json: @comment_reply.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comment_replies/1
  # PATCH/PUT /comment_replies/1.json
  def update
    respond_to do |format|
      if @comment_reply.update(comment_reply_params)
        format.html { redirect_to @comment_reply, notice: 'Comment reply was successfully updated.' }
        format.json { render :show, status: :ok, location: @comment_reply }
      else
        format.html { render :edit }
        format.json { render json: @comment_reply.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comment_replies/1
  # DELETE /comment_replies/1.json
  def destroy
    @comment_reply.destroy
    respond_to do |format|
      format.html { redirect_to comment_replies_url, notice: 'Comment reply was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment_reply
      @comment_reply = CommentReply.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_reply_params
      params.require(:comment_reply).permit(:reply_id, :content, :user_id, :flag_delete)
    end
end
