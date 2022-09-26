class ActivitiesController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response 
    def index 
        activities = Activity.all 
        render json: activities
    end

    def destroy
        acitivity = Activity.find(params[:id])
        activity.destroy
        head :no_content
    end
    private 
    def render_unprocessable_entity_response(invalid)
        render json: {error: invalid.record.errors.full_messages}, status: :unprocessable_entity
    end
    def render_not_found_response(exception)
        render json: { error: "#{exception.model} not found" }, status: :not_found
    end
end
