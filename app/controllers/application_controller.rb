class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def index
    render nothing: true, layout: 'application'
  end
end
