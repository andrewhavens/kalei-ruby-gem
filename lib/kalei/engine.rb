require 'kalei'

module Kalei
  class Engine < ::Rails::Engine
    endpoint Kalei::App
  end
end
