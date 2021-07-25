Gem::Specification.new do |spec|
  spec.name          = 'lita-toro'
  spec.version       = '0.1.0'
  spec.authors       = ['Osamu Takiya']
  spec.email         = ['takiya@toran.sakura.ne.jp']
  spec.description   = 'ToroBot'
  spec.summary       = 'Do toro'
  spec.homepage      = 'https://github.com/nikukyugamer/doppielitta'
  spec.license       = 'MIT License'
  spec.metadata      = { 'lita_plugin_type' => 'handler' }

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'lita'

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'pry-byebug'
  spec.add_development_dependency 'rack-test'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
end
