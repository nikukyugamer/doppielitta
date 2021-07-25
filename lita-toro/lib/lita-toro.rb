# rubocop:disable Style/FrozenStringLiteralComment, Naming/FileName
require 'lita'

Lita.load_locales Dir[File.expand_path(
  File.join('..', '..', 'locales', '*.yml'), __FILE__
)]

require 'lita/handlers/toro'
require 'lita/handlers/healthcheck'

Lita::Handlers::Toro.template_root File.expand_path(
  File.join('..', '..', 'templates'),
  __FILE__
)
# rubocop:enable Style/FrozenStringLiteralComment, Naming/FileName
