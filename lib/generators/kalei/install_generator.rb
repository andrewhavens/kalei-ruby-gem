require 'rails/generators/base'

module Kalei
  class InstallGenerator < Rails::Generators::Base
    source_root File.expand_path('../../templates', __FILE__)
    desc 'Kalei Rails Install'

    def install_steps
      copy_file 'config.rb', 'config/initializers/kalei.rb'
      route "mount Kalei::Engine => '/styleguide' if Rails.env.development?"
    end
  end
end