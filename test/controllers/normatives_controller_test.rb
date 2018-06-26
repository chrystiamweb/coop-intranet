require 'test_helper'

class NormativesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @normative = normatives(:one)
  end

  test "should get index" do
    get normatives_url
    assert_response :success
  end

  test "should get new" do
    get new_normative_url
    assert_response :success
  end

  test "should create normative" do
    assert_difference('Normative.count') do
      post normatives_url, params: { normative: { description: @normative.description, title: @normative.title } }
    end

    assert_redirected_to normative_url(Normative.last)
  end

  test "should show normative" do
    get normative_url(@normative)
    assert_response :success
  end

  test "should get edit" do
    get edit_normative_url(@normative)
    assert_response :success
  end

  test "should update normative" do
    patch normative_url(@normative), params: { normative: { description: @normative.description, title: @normative.title } }
    assert_redirected_to normative_url(@normative)
  end

  test "should destroy normative" do
    assert_difference('Normative.count', -1) do
      delete normative_url(@normative)
    end

    assert_redirected_to normatives_url
  end
end
