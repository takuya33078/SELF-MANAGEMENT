require 'test_helper'

class WeightsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get weights_index_url
    assert_response :success
  end

  test "should get edit" do
    get weights_edit_url
    assert_response :success
  end

end
