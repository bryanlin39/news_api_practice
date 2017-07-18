class ApplicationController < ActionController::API
  include Response
  include ActionController::HttpAuthentication::Token::ControllerMethods
end
