module Lita
  module Handlers
    class Healthcheck < Handler
      http.get '/healthcheck' do |_request, response|
        response.body << 'OK'
      end

      Lita.register_handler(self)
    end
  end
end
