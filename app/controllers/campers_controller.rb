class CampersController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
rescue_from ActiveRecord::RecordInvalid, with: :unprocessable_entity_response
    def index
        render json: Camper.all
    end

    def show
        camper = Camper.find_by!(id:params[:id])
        render json: camper, serializer: CamperAndActivitySerializer
    end

    def create
        camper = Camper.create!(camper_params)
        render json: camper, status: :created
    end

    private
    def render_not_found_response
        render json: {error: "Camper not found"}, status: :not_found
    end

    def camper_params
        params.permit(:name, :age)
    end

    def unprocessable_entity_response(invalid)
        render json: {errors: invalid.record.errors.full_messages}, status: :unprocessable_entity
    end
end
