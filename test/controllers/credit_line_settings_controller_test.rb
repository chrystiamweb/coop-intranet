require 'test_helper'

class CreditLineSettingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @credit_line_setting = credit_line_settings(:one)
  end

  test "should get index" do
    get credit_line_settings_url
    assert_response :success
  end

  test "should get new" do
    get new_credit_line_setting_url
    assert_response :success
  end

  test "should create credit_line_setting" do
    assert_difference('CreditLineSetting.count') do
      post credit_line_settings_url, params: { credit_line_setting: { client_type: @credit_line_setting.client_type, credit_line_id: @credit_line_setting.credit_line_id, deadline_max: @credit_line_setting.deadline_max, deadline_min: @credit_line_setting.deadline_min, deadline_setup: @credit_line_setting.deadline_setup, description: @credit_line_setting.description, name: @credit_line_setting.name, tax_description: @credit_line_setting.tax_description, tax_max: @credit_line_setting.tax_max, tax_min: @credit_line_setting.tax_min } }
    end

    assert_redirected_to credit_line_setting_url(CreditLineSetting.last)
  end

  test "should show credit_line_setting" do
    get credit_line_setting_url(@credit_line_setting)
    assert_response :success
  end

  test "should get edit" do
    get edit_credit_line_setting_url(@credit_line_setting)
    assert_response :success
  end

  test "should update credit_line_setting" do
    patch credit_line_setting_url(@credit_line_setting), params: { credit_line_setting: { client_type: @credit_line_setting.client_type, credit_line_id: @credit_line_setting.credit_line_id, deadline_max: @credit_line_setting.deadline_max, deadline_min: @credit_line_setting.deadline_min, deadline_setup: @credit_line_setting.deadline_setup, description: @credit_line_setting.description, name: @credit_line_setting.name, tax_description: @credit_line_setting.tax_description, tax_max: @credit_line_setting.tax_max, tax_min: @credit_line_setting.tax_min } }
    assert_redirected_to credit_line_setting_url(@credit_line_setting)
  end

  test "should destroy credit_line_setting" do
    assert_difference('CreditLineSetting.count', -1) do
      delete credit_line_setting_url(@credit_line_setting)
    end

    assert_redirected_to credit_line_settings_url
  end
end
