# Kalei - a living styleguide for your Ruby project

This gem provides an easy way to add the Kalei Styleguide to your existing Ruby application.

## Rails Installation

**Step 1:** Add kalei to your `Gemfile`:

    gem 'kalei', :require => 'kalei/engine'

**Step 2:** Add kalei to your `config/routes.rb`:

    Rails.application.routes.draw do
      mount Kalei::Engine => "/style-guide"
    end

Kalei will now be available in the browser at `/style-guide`. By default, it will parse your stylesheet at `/assets/application.css`. More configuration options coming soon.


## Non-Rails Installation

**Step 1:** Add kalei to your `Gemfile`:

    gem 'kalei'

**Step 2:** Add kalei to your `config.ru`:

    require 'kalei/app'

    map '/style-guide' do
      run Kalei::App
    end

Kalei will now be available in the browser at `/style-guide`. By default, it will parse your stylesheet at `/assets/application.css`, which may not be correct for your application. More configuration options coming soon.
