require 'application_system_test_case'

class CriteriaImpactDefinitionsTest < ApplicationSystemTestCase
  setup do
    @criteria_impact_definition = criteria_impact_definitions(:one)
  end

  test 'visiting the index' do
    visit criteria_impact_definitions_url
    assert_selector 'h1', text: 'Criteria Impact Definitions'
  end

  test 'creating a Criteria impact definition' do
    visit criteria_impact_definitions_url
    click_on 'New Criteria Impact Definition'

    fill_in 'Criteria', with: @criteria_impact_definition.criteria_id
    fill_in 'Impact', with: @criteria_impact_definition.impact
    click_on 'Create Criteria impact definition'

    assert_text 'Criteria impact definition was successfully created'
    click_on 'Back'
  end

  test 'updating a Criteria impact definition' do
    visit criteria_impact_definitions_url
    click_on 'Edit', match: :first

    fill_in 'Criteria', with: @criteria_impact_definition.criteria_id
    fill_in 'Impact', with: @criteria_impact_definition.impact
    click_on 'Update Criteria impact definition'

    assert_text 'Criteria impact definition was successfully updated'
    click_on 'Back'
  end

  test 'destroying a Criteria impact definition' do
    visit criteria_impact_definitions_url
    page.accept_confirm do
      click_on 'Destroy', match: :first
    end

    assert_text 'Criteria impact definition was successfully destroyed'
  end
end
