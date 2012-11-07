require 'test_helper'

module Kalei
  class IndexControllerTest < ActionController::TestCase
    test "should get index" do
      get :index
      assert_response :success
    end
  
  end
end
