class Api::V1::BaseController < ActionController::API
  private

  def current_user
    return unless decoded_token
    @current_user ||= User.find(decoded_token[:user_id])
  end

  def decoded_token
    header = request.headers['Authorization']
    return unless header
    token = header.split(' ').last
    @decoded_token ||= JwtService.decode(token)
  end

  def authenticate_request!
    render json: { error: 'Not Authorized' }, status: :unauthorized unless current_user
  end

  def authorize_admin!
    render json: { error: 'Forbidden' }, status: :forbidden unless current_user&.role == 'admin'
  end
end
