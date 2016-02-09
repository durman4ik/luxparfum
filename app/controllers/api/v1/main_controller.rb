class Api::V1::MainController < ApplicationController
  respond_to :json

  http_basic_authenticate_with name: 'admin', password: 'admin'


end