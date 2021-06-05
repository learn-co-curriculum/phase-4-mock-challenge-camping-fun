class ActivitiesController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

  def index
    render json: Activity.all
  end

  def destroy
    activity = find_activity
    activity.destroy
    head :no_content
  end

  private

  def find_activity
    Activity.find(params[:id])
  end

  def render_not_found_response
    render json: { error: "Activity not found" }, status: :not_found
  end

end
