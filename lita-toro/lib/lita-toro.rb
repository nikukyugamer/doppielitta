require 'lita'

Lita.load_locales Dir[File.expand_path(
  File.join('..', '..', 'locales', '*.yml'), __FILE__
)]

require 'lita/handlers/toro'
require 'lita/handlers/healthcheck'
require 'lita/handlers/arigato_java'

Lita::Handlers::Toro.template_root File.expand_path(
  File.join('..', '..', 'templates'),
  __FILE__
)
