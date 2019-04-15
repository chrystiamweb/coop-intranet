require "application_system_test_case"

class GoalsReportsTest < ApplicationSystemTestCase
  setup do
    @goals_report = goals_reports(:one)
  end

  test "visiting the index" do
    visit goals_reports_url
    assert_selector "h1", text: "Goals Reports"
  end

  test "creating a Goals report" do
    visit goals_reports_url
    click_on "New Goals Report"

    fill_in "Description", with: @goals_report.description
    fill_in "Goal category", with: @goals_report.goal_category_id
    fill_in "Location", with: @goals_report.location_id
    fill_in "Name", with: @goals_report.name
    click_on "Create Goals report"

    assert_text "Goals report was successfully created"
    click_on "Back"
  end

  test "updating a Goals report" do
    visit goals_reports_url
    click_on "Edit", match: :first

    fill_in "Description", with: @goals_report.description
    fill_in "Goal category", with: @goals_report.goal_category_id
    fill_in "Location", with: @goals_report.location_id
    fill_in "Name", with: @goals_report.name
    click_on "Update Goals report"

    assert_text "Goals report was successfully updated"
    click_on "Back"
  end

  test "destroying a Goals report" do
    visit goals_reports_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Goals report was successfully destroyed"
  end
end
