require 'application_system_test_case'

class CriteriaTest < ApplicationSystemTestCase
  setup do
    @criterium = criteria(:one)
  end

  test 'visiting the index' do
    visit criteria_url
    assert_selector 'h1', text: 'Criteria'
  end

  test 'creating a Criterium' do
    visit criteria_url
    click_on 'New Criterium'

    fill_in 'Description', with: @criterium.description
    fill_in 'Name', with: @criterium.name
    click_on 'Create Criterium'

    assert_text 'Criterium was successfully created'
    click_on 'Back'
  end

  test 'updating a Criterium' do
    visit criteria_url
    click_on 'Edit', match: :first

    fill_in 'Description', with: @criterium.description
    fill_in 'Name', with: @criterium.name
    click_on 'Update Criterium'

    assert_text 'Criterium was successfully updated'
    click_on 'Back'
  end

  test 'destroying a Criterium' do
    visit criteria_url
    page.accept_confirm do
      click_on 'Destroy', match: :first
    end

    assert_text 'Criterium was successfully destroyed'
  end
end
