require 'application_system_test_case'

class CriteriaSetupsTest < ApplicationSystemTestCase
  setup do
    @criteria_setup = criteria_setups(:one)
  end

  test 'visiting the index' do
    visit criteria_setups_url
    assert_selector 'h1', text: 'Criteria Setups'
  end

  test 'creating a Criteria setup' do
    visit criteria_setups_url
    click_on 'New Criteria Setup'

    fill_in 'Criteria Name', with: @criteria_setup.criteria_name
    fill_in 'Criterium', with: @criteria_setup.criterium_id
    fill_in 'Description', with: @criteria_setup.description
    fill_in 'Real Value', with: @criteria_setup.real_value
    fill_in 'Value', with: @criteria_setup.value
    click_on 'Create Criteria setup'

    assert_text 'Criteria setup was successfully created'
    click_on 'Back'
  end

  test 'updating a Criteria setup' do
    visit criteria_setups_url
    click_on 'Edit', match: :first

    fill_in 'Criteria Name', with: @criteria_setup.criteria_name
    fill_in 'Criterium', with: @criteria_setup.criterium_id
    fill_in 'Description', with: @criteria_setup.description
    fill_in 'Real Value', with: @criteria_setup.real_value
    fill_in 'Value', with: @criteria_setup.value
    click_on 'Update Criteria setup'

    assert_text 'Criteria setup was successfully updated'
    click_on 'Back'
  end

  test 'destroying a Criteria setup' do
    visit criteria_setups_url
    page.accept_confirm do
      click_on 'Destroy', match: :first
    end

    assert_text 'Criteria setup was successfully destroyed'
  end
end
