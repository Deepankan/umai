class ApplicationController < ActionController::API
  respond_to :json

  def render_resource(resource)
    if resource.errors.empty?
      render json: resource
    else
      validation_error(resource)
    end
  end

  def validation_error(resource)
    render json: {
      errors: [
        {
          status: '422',
          title: 'Bad Request',
          detail: resource.errors,
        }
      ]
    }, status: :bad_request
  end

  # def authenticate_user!(options = {})
  #   unless signed_in?
  #     render json: { message: "Please sign in."}, status: :unauthorized
  #   end
  # end
end
