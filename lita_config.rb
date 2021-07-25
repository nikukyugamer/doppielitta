# rubocop:disable Style/FrozenStringLiteralComment, Style/AsciiComments, Style/ConditionalAssignment
Lita.configure do |config|
  # The name your robot will use.
  config.robot.name = 'Lita'

  # The locale code for the language to use.
  # NOTE: 設定を有効にすると ERROR: translation missing: ja-JP.UTF-8.lita.handler.exception が出てしまう
  # config.robot.locale = :ja
  # config.robot.default_locale = 'ja'

  # The severity of messages to log. Options are:
  # :debug, :info, :warn, :error, :fatal
  # Messages at the selected level and above will be logged.
  config.robot.log_level = :info

  # An array of user IDs that are considered administrators. These users
  # the ability to add and remove other users from authorization groups.
  # What is considered a user ID will change depending on which adapter you use.
  # config.robot.admins = ["1", "2"]

  # The adapter you want to connect with. Make sure you've added the
  # appropriate gem to the Gemfile.
  # config.robot.adapter = :shell
  config.robot.adapter = :slack

  ## Example: Set options for the chosen adapter.
  # config.adapter.username = "myname"
  # config.adapter.password = "secret"

  config.adapters.slack.token = ENV['SLACK_API_KEY']
  # config.adapters.slack.link_names = true
  # config.adapters.slack.parse = 'full'
  # config.adapters.slack.unfurl_links = false
  # config.adapters.slack.unfurl_media = false

  ## Example: Set options for the Redis connection.
  # config.redis.host = ENV['REDIS_URL']
  # config.redis.port = 1234

  # REDISTOGO_URL は Redis To Go における事実上の予約語である
  ENV['REDIS_URL'].nil? ? config.redis[:url] = ENV['REDISTOGO_URL'] : config.redis[:url] = ENV['REDIS_URL']

  # PORT は Heroku における予約語である
  config.http.port = ENV['PORT']

  ## Example: Set configuration for any loaded handlers. See the handler's
  ## documentation for options.
  # config.handlers.some_handler.some_config_key = "value"
end
# rubocop:enable Style/FrozenStringLiteralComment, Style/AsciiComments, Style/ConditionalAssignment
