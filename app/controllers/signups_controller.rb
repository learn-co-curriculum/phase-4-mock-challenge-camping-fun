class SignupsController < ApplicationController
rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity
rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

    def index
        render json: Signup.all, status: :ok
    end

    def create
        signup = Signup.create!(signup_params)
        render json: signup.activity, status: :created
    end

    private

    def signup_params
        params.permit(:camper_id, :activity_id, :time)
    end

    def find_signup
        signup = Signup.find(params[:id])
    end

    # def render_unprocessable_entity(invalid)
    #     render json: {errors: invalid.record.errors.full_messages}, status: :unprocessable_entity
    # end

    def render_not_found_response
        render json: {error: 'Signup not found'}, status: :not_found
    end

end
