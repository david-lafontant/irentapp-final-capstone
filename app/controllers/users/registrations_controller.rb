class Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json

  private

  def respond_with(resource, opts = {})
    register_success && return if resource.persisted?

    register_failed
  end

  def register_success
    render json: {
      message: 'Signed up successfully.',
      user: current_user
    }, status: :created
  end

  def register_failed
    render json: resource.errors, status: :unprocessable_entity
  end
end
