require 'bundler'
Bundler.require(:default)

module Profile
  class Application < Rail::Application
    config.precompile << 'application.css'
    config.precompile << 'index.html'
  end
end
