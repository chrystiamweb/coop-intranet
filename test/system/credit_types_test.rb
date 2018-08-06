require 'application_system_test_case'

class CreditTypesTest < ApplicationSystemTestCase
  setup do
    @credit_type = credit_types(:one)
  end

  test 'visiting the index' do
    visit credit_types_url
    assert_selector 'h1', text: 'Credit Types'
  end

  test 'creating a Credit type' do
    visit credit_types_url
    click_on 'New Credit Type'

    fill_in 'Client Type', with: @credit_type.client_type
    fill_in 'Description', with: @credit_type.description
    fill_in 'Name', with: @credit_type.name
    click_on 'Create Credit type'

    assert_text 'Credit type was successfully created'
    click_on 'Back'
  end

  test 'updating a Credit type' do
    visit credit_types_url
    click_on 'Edit', match: :first

    fill_in 'Client Type', with: @credit_type.client_type
    fill_in 'Description', with: @credit_type.description
    fill_in 'Name', with: @credit_type.name
    click_on 'Update Credit type'

    assert_text 'Credit type was successfully updated'
    click_on 'Back'
  end

  test 'destroying a Credit type' do
    visit credit_types_url
    page.accept_confirm do
      click_on 'Destroy', match: :first
    end

    assert_text 'Credit type was successfully destroyed'
  end
end
