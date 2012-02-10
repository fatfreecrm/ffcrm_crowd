# -*- encoding: utf-8 -*-
$:.push File.expand_path('../lib', __FILE__)
require 'ffcrm_crowd/version'

Gem::Specification.new do |s|
  s.name = 'ffcrm_crowd'
  s.authors = ['Ben Tillman']
  s.summary = 'Fat Free CRM - Crowd authentication'
  s.description = 'Fat Free CRM - Crowd authentication'
  s.files = `git ls-files`.split("\n")
  s.version = FatFreeCrmCrowd::VERSION

  s.add_development_dependency 'rspec-rails', '~> 2.6'
  s.add_development_dependency 'capybara'
  s.add_development_dependency 'combustion'
  s.add_dependency 'fat_free_crm'
end
