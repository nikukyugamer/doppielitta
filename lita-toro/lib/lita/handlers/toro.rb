# rubocop:disable Style/FrozenStringLiteralComment, Style/Documentation
require 'net/http'
require 'json'

module Lita
  module Handlers
    class Toro < Handler
      RANDOM_CAT_API_URL = 'https://aws.random.cat/meow'.freeze

      route /^ねこ画像\Z/, :cat_image, help: { 'ねこ画像' => 'ねこ画像を表示します' }

      def cat_image(response)
        uri = URI(RANDOM_CAT_API_URL)
        res = Net::HTTP.get_response(uri)
        res_hash = JSON.parse(res.body)

        response.reply(res_hash['file'])
      end

      Lita.register_handler(self)
    end
  end
end
# rubocop:enable Style/FrozenStringLiteralComment, Style/Documentation
