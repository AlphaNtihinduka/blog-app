class Api::V1::ApplicationController < ActionController::API
    before_action :authenticate_user!
    respond_to :json
end