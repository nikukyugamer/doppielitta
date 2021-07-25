require 'net/http'
require 'json'

module Lita
  module Handlers
    class ArigatoJava < Handler
      ARIGATO_JAVA_API_URL = 'https://arigato-java.download/kakugen.json'.freeze

      route(/\Aジャバ.*\Z/, :arigato_java, help: { 'ジャバ(.*)' => 'ありがとう、ジャバ' })

      def arigato_java(response)
        uri = URI(ARIGATO_JAVA_API_URL)
        res = Net::HTTP.get_response(uri)

        return response.reply('さよなら、ジャバ') if res.code != '200'

        res_hash_in_array = JSON.parse(res.body)
        res_hash = res_hash_in_array.sample
        # res_hash['u'] は空っぽのときもある
        reply_text = "#{res_hash['t']}\n#{res_hash['u']}"

        response.reply(reply_text)
      end

      Lita.register_handler(self)
    end
  end
end
