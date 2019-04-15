require 'test_helper'

class GoalsReportsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @goals_report = goals_reports(:one)
  end

  test "should get index" do
    get goals_reports_url
    assert_response :success
  end

  test "should get new" do
    get new_goals_report_url
    assert_response :success
  end

  test "should create goals_report" do
    assert_difference('GoalsReport.count') do
      post goals_reports_url, params: { goals_report: { description: @goals_report.description, goal_category_id: @goals_report.goal_category_id, location_id: @goals_report.location_id, name: @goals_report.name } }
    end

    assert_redirected_to goals_report_url(GoalsReport.last)
  end

  test "should show goals_report" do
    get goals_report_url(@goals_report)
    assert_response :success
  end

  test "should get edit" do
    get edit_goals_report_url(@goals_report)
    assert_response :success
  end

  test "should update goals_report" do
    patch goals_report_url(@goals_report), params: { goals_report: { description: @goals_report.description, goal_category_id: @goals_report.goal_category_id, location_id: @goals_report.location_id, name: @goals_report.name } }
    assert_redirected_to goals_report_url(@goals_report)
  end

  test "should destroy goals_report" do
    assert_difference('GoalsReport.count', -1) do
      delete goals_report_url(@goals_report)
    end

    assert_redirected_to goals_reports_url
  end
end
