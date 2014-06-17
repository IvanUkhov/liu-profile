require 'haml'
require 'sprockets'

Haml::Options.defaults[:ugly] = true if ENV['production']
Sprockets.register_engine('.haml', Tilt::HamlTemplate)

class Application
  def call(env)
    case env['PATH_INFO']
    when '/'
      pipeline = build_pipeline(env)
      [ 200, {}, pipeline['application.html'] ]
    when /^.+(css)$/
      pipeline = build_pipeline(env)
      pipeline.call(env)
    else
      browser.call(env)
    end
  end

  private

  def browser
    @browser ||= Rack::Directory.new('public')
  end

  def build_pipeline(env)
    pipeline = Sprockets::Environment.new

    pipeline.append_path('app/assets/stylesheets')
    pipeline.append_path('app/views/layouts')

    pipeline.css_compressor = :scss if ENV['production']

    pipeline
  end
end
