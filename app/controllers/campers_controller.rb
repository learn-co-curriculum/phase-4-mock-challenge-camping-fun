class CampersController < ApplicationController
    def index
        render json: Camper.all
    end

    def show
        camper = Camper.find_by(id:params[:id])
        render json: camper

    end
end
