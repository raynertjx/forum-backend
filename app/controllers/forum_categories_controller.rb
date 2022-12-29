class ForumCategoriesController < ApplicationController
    def index
        @forum_categories = ForumCategory.all
        render json: @forum_categories
    end

    def update
        @forum_category = ForumCategory.find(params[:id])
        if @forum_category.update(forum_category_params)
            render json: @forum_category
        else
            render json: @forum_category.errors, status: :unprocessable_entity
        end
    end
    
    private 
        def forum_category_params
            params.permit(:id, :latest_thread, :thread_count)
        end
end
