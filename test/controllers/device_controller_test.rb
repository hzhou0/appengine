require 'test_helper'

class DeviceControllerTest < ActionDispatch::IntegrationTest
  test "should get Flag" do
    get device_Flag_url
    assert_response :success
  end

  test "should get Request-Predict" do
    get device_Request-Predict_url
    assert_response :success
  end

  test "should get Registar" do
    get device_Registar_url
    assert_response :success
  end

end
