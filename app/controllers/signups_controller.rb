class SignupsController < ApplicationController

rescue_from ActiveRecord::RecordInvalid, with: :record_invalid

    def create
        signup = Signup.create!(signup_params)
        render json: signup.activity, status: :created 
    end


    private

    def signup_params
        params.permit(:time, :camper_id, :activity_id)
    end

    def record_invalid(invalid)
        render json: {errors: invalid.record.errors.full_messages}, status: :unprocessable_entity
    end
end
