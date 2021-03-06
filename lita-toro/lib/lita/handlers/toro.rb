require 'net/http'
require 'json'

module Lita
  module Handlers
    class Toro < Handler
      RANDOM_CAT_API_URL = 'https://aws.random.cat/meow'.freeze

      route(/\Aねこ画像.*\Z/, :cat_image, help: { 'ねこ画像(.*)' => 'ねこ画像を表示します' })

      def cat_image(response)
        uri = URI(RANDOM_CAT_API_URL)

        # なぜか一度リクエストを挟まないと次が受け付けられないようなので、入れる
        _dummy_res = Net::HTTP.get_response(uri)
        res = Net::HTTP.get_response(uri)

        if res.code != '200'
          response.reply('見つかりませんでしたニャ……')

          return
        end

        res_hash = JSON.parse(res.body)
        reply_text = res_hash['file']

        response.reply(reply_text) unless reply_text.nil?
      end

      Lita.register_handler(self)
    end
  end
end
