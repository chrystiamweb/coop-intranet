require 'test_helper'

class CriteriaImpactDefinitionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @criteria_impact_definition = criteria_impact_definitions(:one)
  end

  test 'should get index' do
    get criteria_impact_definitions_url
    assert_response :success
  end

  test 'should get new' do
    get new_criteria_impact_definition_url
    assert_response :success
  end

  test 'should create criteria_impact_definition' do
    assert_difference('CriteriaImpactDefinition.count') do
      post criteria_impact_definitions_url, params: { criteria_impact_definition: { criteria_id: @criteria_impact_definition.criteria_id, impact: @criteria_impact_definition.impact } }
    end

    assert_redirected_to criteria_impact_definition_url(CriteriaImpactDefinition.last)
  end

  test 'should show criteria_impact_definition' do
    get criteria_impact_definition_url(@criteria_impact_definition)
    assert_response :success
  end

  test 'should get edit' do
    get edit_criteria_impact_definition_url(@criteria_impact_definition)
    assert_response :success
  end

  test 'should update criteria_impact_definition' do
    patch criteria_impact_definition_url(@criteria_impact_definition), params: { criteria_impact_definition: { criteria_id: @criteria_impact_definition.criteria_id, impact: @criteria_impact_definition.impact } }
    assert_redirected_to criteria_impact_definition_url(@criteria_impact_definition)
  end

  test 'should destroy criteria_impact_definition' do
    assert_difference('CriteriaImpactDefinition.count', -1) do
      delete criteria_impact_definition_url(@criteria_impact_definition)
    end

    assert_redirected_to criteria_impact_definitions_url
  end
end
