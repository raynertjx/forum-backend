class ForumCommentsController < ApplicationController
  before_action :set_forum_comment, only: %i[ show update destroy ]
  before_action :logged_in_user, except: %i[index_thread index]
  before_action :owner?, only: %i[edit destroy]

  # GET /forum_comments
  def index
    @forum_comments = ForumComment.all
    render json: @forum_comments
  end

  # GET comments from a specific forum thread
  def index_thread
    @comments = ForumComment.all.select { |comment| comment.forum_thread_id == Integer(params[:forum_thread_id])}
    render json: @comments
  end

  # GET /forum_comments/1
  def show
    render json: @forum_comment
  end

  # POST /forum_comments
  def create
    @forum_comment = ForumComment.new(forum_comment_params)
    @forum_comment.user_id = @user.id
    @forum_comment.author = @user.username
    if @forum_comment.save
      render json: @forum_comment, status: :created, location: @forum_comment
    else
      render json: @forum_comment.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /forum_comments/1
  def update
    if @forum_comment.update(forum_comment_params)
      render json: @forum_comment
    else
      render json: @forum_comment.errors, status: :unprocessable_entity
    end
  end

  # DELETE /forum_comments/1
  def destroy
    @forum_comment.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_forum_comment
      @forum_comment = ForumComment.find(params[:id])
    end

    # Get comments for a particular thread.
    # def set_thread_comments
    #   @thread_comments = ForumComment.all.select { |comment| comment.forum_thread_id == Integer(params[:forum_thread_id])}
    # end

    def owner?
      unless @user.id == @forum_comment.user_id
        redirect_back fallback_location: logout_path, notice: 'User is not owner'
      end
    end

    # Only allow a list of trusted parameters through.
    def forum_comment_params
      params.require(:forum_comment).permit(:content, :forum_thread_id).except(:author, :user_id)
    end
end
