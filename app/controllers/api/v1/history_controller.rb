class Api::V1::HistoryController < Api::V1::BaseController
  before_action :authenticate_request!
  before_action :authorize_admin!
  def index
    @history = History.all
    render json: @history
  end

  def show
    @history = History.find(params[:id])
      render json: @borrow
  end
end