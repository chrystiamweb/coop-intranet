require 'test_helper'

class DocfilesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @docfile = docfiles(:one)
  end

  test 'should get index' do
    get docfiles_url
    assert_response :success
  end

  test 'should get new' do
    get new_docfile_url
    assert_response :success
  end

  test 'should create docfile' do
    assert_difference('Docfile.count') do
      post docfiles_url, params: { docfile: { description: @docfile.description, file_type_id: @docfile.file_type_id, name: @docfile.name } }
    end

    assert_redirected_to docfile_url(Docfile.last)
  end

  test 'should show docfile' do
    get docfile_url(@docfile)
    assert_response :success
  end

  test 'should get edit' do
    get edit_docfile_url(@docfile)
    assert_response :success
  end

  test 'should update docfile' do
    patch docfile_url(@docfile), params: { docfile: { description: @docfile.description, file_type_id: @docfile.file_type_id, name: @docfile.name } }
    assert_redirected_to docfile_url(@docfile)
  end

  test 'should destroy docfile' do
    assert_difference('Docfile.count', -1) do
      delete docfile_url(@docfile)
    end

    assert_redirected_to docfiles_url
  end
end
