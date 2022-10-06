class SignupsController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
    
    def create
        signup=Signup.create(signup_params)
        render signup.activity
    end

    private 

    def signup_params
        params.permit :time, :camper_id,:activity_id
    end

    def render_unprocessable_entity_response(invalid)
        render json: {error: invalid.record.errors}
    end
end
