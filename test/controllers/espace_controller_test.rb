require "test_helper"

class EspaceControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get espace_index_url
    assert_response :success
  end

  test "should get dashboard" do
    get espace_dashboard_url
    assert_response :success
  end

  test "should get audition" do
    get espace_audition_url
    assert_response :success
  end
end
