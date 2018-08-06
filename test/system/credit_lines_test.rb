require 'application_system_test_case'

class CreditLinesTest < ApplicationSystemTestCase
  setup do
    @credit_line = credit_lines(:one)
  end

  test 'visiting the index' do
    visit credit_lines_url
    assert_selector 'h1', text: 'Credit Lines'
  end

  test 'creating a Credit line' do
    visit credit_lines_url
    click_on 'New Credit Line'

    fill_in 'Client Type', with: @credit_line.client_type
    fill_in 'Credit Type', with: @credit_line.credit_type_id
    fill_in 'Description', with: @credit_line.description
    fill_in 'Name', with: @credit_line.name
    click_on 'Create Credit line'

    assert_text 'Credit line was successfully created'
    click_on 'Back'
  end

  test 'updating a Credit line' do
    visit credit_lines_url
    click_on 'Edit', match: :first

    fill_in 'Client Type', with: @credit_line.client_type
    fill_in 'Credit Type', with: @credit_line.credit_type_id
    fill_in 'Description', with: @credit_line.description
    fill_in 'Name', with: @credit_line.name
    click_on 'Update Credit line'

    assert_text 'Credit line was successfully updated'
    click_on 'Back'
  end

  test 'destroying a Credit line' do
    visit credit_lines_url
    page.accept_confirm do
      click_on 'Destroy', match: :first
    end

    assert_text 'Credit line was successfully destroyed'
  end
end
