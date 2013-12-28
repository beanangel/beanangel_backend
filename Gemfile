source 'https://rubygems.org'

ruby '2.0.0'

gem 'rails', '4.0.2'

gem 'rails-api'

# security
gem 'rack-cors', require: 'rack/cors'
gem 'rack-protection', github: 'aCandidMind/rack-protection', require: 'rack/protection'

gem 'mongoid', github: 'mongoid/mongoid'
gem 'geocoder'

# uploader gem
gem 'carrierwave'
gem "carrierwave-mongoid", "~> 0.6.3"

# Having mongoid 4.x means carrierwave-mongoid's dependency mongoid-grid_fs
# needs to point to master as it doesn't have a release yet with mongoid 4 support.
# This gem is a dependency even though we're not using GridFS.
# For reasons see https://github.com/carrierwaveuploader/carrierwave-mongoid/issues/94
# This topic is being discussed in further github issues on carrierwave-mongoid: #97, #100 and #115
# TODO check whether this still applies from time to time
gem "mongoid-grid_fs", github: "ahoward/mongoid-grid_fs"
gem 'mini_magick'



# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

gem 'active_model_serializers', github: 'rails-api/active_model_serializers'

# Use unicorn as the app server
gem 'puma'

# Deploy with Capistrano
# gem 'capistrano', :group => :development

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'

gem "sentry-raven", github: "getsentry/raven-ruby"