class AuthenticatedController < ApplicationController
  if ENV['HTTP_BASIC_AUTH_PASSWORD'].present?
    http_basic_authenticate_with name: 'deyan', password: ENV['HTTP_BASIC_AUTH_PASSWORD']
  end
end
