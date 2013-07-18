class IGiveYouIndex
  def call(env)
    path = env['PATH_INFO']
    case
      when path =~ %r{js/(.*)}
        [200, {'Content-Type' => 'application/javascript'}, [File.read("js/#{$1}")]]
      else
        [200, {'Content-Type' => 'text/html'}, [File.read('html/index.html')]]
    end
  end
end
