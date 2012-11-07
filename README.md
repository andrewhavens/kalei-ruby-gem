# Kalei - a living styleguide for your Ruby project

This gem provides an easy way to add the Kalei Styleguide to your existing Ruby application.

## Rails Installation

**Step 1:** Add kalei to your `Gemfile`:

    gem 'kalei', :require => 'kalei/engine'

**Step 2:** Add kalei to your `config/routes.rb`:

    Rails.application.routes.draw do
			mount Kalei::Engine => "/style-guide"
		end

**Step 3:** Kalei is now available in the browser at `/style-guide`


## Non-Rails Installation

**Step 1:** Add kalei to your `Gemfile`:

    gem 'kalei'

**Step 2:** Add kalei to your `config.ru`:

		require 'kalei/app'

		map '/style-guide' do
			run Kalei::App
		end

**Step 3:** Kalei is now available in the browser at `/style-guide`