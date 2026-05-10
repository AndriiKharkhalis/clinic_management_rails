require "test_helper"

class Doctor::ProfilesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get doctor_profiles_show_url
    assert_response :success
  end
end
