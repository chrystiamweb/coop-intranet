require "application_system_test_case"

class CreditLineSettingsTest < ApplicationSystemTestCase
  setup do
    @credit_line_setting = credit_line_settings(:one)
  end

  test "visiting the index" do
    visit credit_line_settings_url
    assert_selector "h1", text: "Credit Line Settings"
  end

  test "creating a Credit line setting" do
    visit credit_line_settings_url
    click_on "New Credit Line Setting"

    fill_in "Client Type", with: @credit_line_setting.client_type
    fill_in "Credit Line", with: @credit_line_setting.credit_line_id
    fill_in "Deadline Max", with: @credit_line_setting.deadline_max
    fill_in "Deadline Min", with: @credit_line_setting.deadline_min
    fill_in "Deadline Setup", with: @credit_line_setting.deadline_setup
    fill_in "Description", with: @credit_line_setting.description
    fill_in "Name", with: @credit_line_setting.name
    fill_in "Tax Description", with: @credit_line_setting.tax_description
    fill_in "Tax Max", with: @credit_line_setting.tax_max
    fill_in "Tax Min", with: @credit_line_setting.tax_min
    click_on "Create Credit line setting"

    assert_text "Credit line setting was successfully created"
    click_on "Back"
  end

  test "updating a Credit line setting" do
    visit credit_line_settings_url
    click_on "Edit", match: :first

    fill_in "Client Type", with: @credit_line_setting.client_type
    fill_in "Credit Line", with: @credit_line_setting.credit_line_id
    fill_in "Deadline Max", with: @credit_line_setting.deadline_max
    fill_in "Deadline Min", with: @credit_line_setting.deadline_min
    fill_in "Deadline Setup", with: @credit_line_setting.deadline_setup
    fill_in "Description", with: @credit_line_setting.description
    fill_in "Name", with: @credit_line_setting.name
    fill_in "Tax Description", with: @credit_line_setting.tax_description
    fill_in "Tax Max", with: @credit_line_setting.tax_max
    fill_in "Tax Min", with: @credit_line_setting.tax_min
    click_on "Update Credit line setting"

    assert_text "Credit line setting was successfully updated"
    click_on "Back"
  end

  test "destroying a Credit line setting" do
    visit credit_line_settings_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Credit line setting was successfully destroyed"
  end
end
