class ActivitiesController < ApplicationController
rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity
rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

    def index
        render json: Activity.all, status: :ok
    end

    def create
        activity = Activity.create!(activity_params)
        render json: activity, status: :created
    end

    def destroy
        activity = find_activity
        activity.destroy!
        render json: {message: 'Activity deletion is successful'}, status: :no_content
    end

    private

    def activity_params
        params.permit(:name, :difficulty)
    end

    def find_activity
        activity = Activity.find(params[:id])
    end

    def render_unprocessable_entity(invalid)
        render json: {errors: invalid.record.errors.full_messages}, status: :unprocessable_entity
    end

    def render_not_found_response
        render json: {error: 'Activity not found'}, status: :not_found
    end

end
