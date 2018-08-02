require 'test_helper'

class CriteriaSetupsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @criteria_setup = criteria_setups(:one)
  end

  test "should get index" do
    get criteria_setups_url
    assert_response :success
  end

  test "should get new" do
    get new_criteria_setup_url
    assert_response :success
  end

  test "should create criteria_setup" do
    assert_difference('CriteriaSetup.count') do
      post criteria_setups_url, params: { criteria_setup: { criteria_name: @criteria_setup.criteria_name, criterium_id: @criteria_setup.criterium_id, description: @criteria_setup.description, real_value: @criteria_setup.real_value, value: @criteria_setup.value } }
    end

    assert_redirected_to criteria_setup_url(CriteriaSetup.last)
  end

  test "should show criteria_setup" do
    get criteria_setup_url(@criteria_setup)
    assert_response :success
  end

  test "should get edit" do
    get edit_criteria_setup_url(@criteria_setup)
    assert_response :success
  end

  test "should update criteria_setup" do
    patch criteria_setup_url(@criteria_setup), params: { criteria_setup: { criteria_name: @criteria_setup.criteria_name, criterium_id: @criteria_setup.criterium_id, description: @criteria_setup.description, real_value: @criteria_setup.real_value, value: @criteria_setup.value } }
    assert_redirected_to criteria_setup_url(@criteria_setup)
  end

  test "should destroy criteria_setup" do
    assert_difference('CriteriaSetup.count', -1) do
      delete criteria_setup_url(@criteria_setup)
    end

    assert_redirected_to criteria_setups_url
  end
end
