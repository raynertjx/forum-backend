class ForumThreadsController < ApplicationController
  before_action :set_forum_thread, only: %i[ show update destroy ]
  before_action :authorized

  # GET /forum_threads
  def index
    @forum_threads = ForumThread.all
    render json: @forum_threads
  end

  # GET /forum_threads/1
  def show
    render json: @forum_thread
  end

  # POST /forum_threads
  def create
    @forum_thread = ForumThread.new(forum_thread_params)
    @forum_thread.user_id = @user.id
    @forum_thread.username = @user.username
    if @forum_thread.save
      render json: @forum_thread, status: :created, location: @forum_thread
    else
      render json: @forum_thread.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /forum_threads/1
  def update
    if @forum_thread.update(forum_thread_params)
      render json: @forum_thread
    else
      render json: @forum_thread.errors, status: :unprocessable_entity
    end
  end

  # DELETE /forum_threads/1
  def destroy
    @forum_thread.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_forum_thread
      @forum_thread = ForumThread.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def forum_thread_params
      params.permit(:title, :content, :category, :user_id).except(:username, :user_id)
    end
end
