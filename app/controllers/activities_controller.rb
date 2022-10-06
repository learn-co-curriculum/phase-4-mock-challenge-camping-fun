class ActivitiesController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :not_found_response


def index 
    activity = Activity.all
    render json: activity, status: :ok
end

def destroy
    activity =Activity.find_by!(id: params[:id])
    activity.destroy
    render json: {}, status: :no_content

end

private

def not_found_response
    render json: {error: "Activity not found"}, status: :not_found

end
end      
