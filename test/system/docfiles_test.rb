require 'application_system_test_case'

class DocfilesTest < ApplicationSystemTestCase
  setup do
    @docfile = docfiles(:one)
  end

  test 'visiting the index' do
    visit docfiles_url
    assert_selector 'h1', text: 'Docfiles'
  end

  test 'creating a Docfile' do
    visit docfiles_url
    click_on 'New Docfile'

    fill_in 'Description', with: @docfile.description
    fill_in 'File Type', with: @docfile.file_type_id
    fill_in 'Name', with: @docfile.name
    click_on 'Create Docfile'

    assert_text 'Docfile was successfully created'
    click_on 'Back'
  end

  test 'updating a Docfile' do
    visit docfiles_url
    click_on 'Edit', match: :first

    fill_in 'Description', with: @docfile.description
    fill_in 'File Type', with: @docfile.file_type_id
    fill_in 'Name', with: @docfile.name
    click_on 'Update Docfile'

    assert_text 'Docfile was successfully updated'
    click_on 'Back'
  end

  test 'destroying a Docfile' do
    visit docfiles_url
    page.accept_confirm do
      click_on 'Destroy', match: :first
    end

    assert_text 'Docfile was successfully destroyed'
  end
end
