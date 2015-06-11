# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'st_html_table/version'

Gem::Specification.new do |spec|
  spec.name          = "st_html_table"
  spec.version       = StHtmlTable::VERSION
  spec.authors       = ["StanZhuravlev"]
  spec.email         = ["stan@post-api.ru"]

  spec.summary       = %q{Формирование таблиц в формате HTML}
  spec.description   = %q{Библиотека позволяет формировать красиво форматированные таблицы в формате HTML, например,
для передаче по электроннйо почты. Библиотека предназначена для использования в составе различных CLI-скриптов,
в частности, в составе библиотеки cli_application}
  spec.homepage      = "https://github.com/StanZhuravlev/st_html_table"
  spec.license       = "MIT"
  spec.required_ruby_version = '~> 2.2.1'

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "https://rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = Dir.glob("{lib,test}/**/*") + %w(LICENSE.txt README.md)
  spec.require_paths = ["lib", "lib/st_html_table"]

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
end
