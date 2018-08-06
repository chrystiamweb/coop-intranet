require 'test_helper'

class CreditLinesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @credit_line = credit_lines(:one)
  end

  test 'should get index' do
    get credit_lines_url
    assert_response :success
  end

  test 'should get new' do
    get new_credit_line_url
    assert_response :success
  end

  test 'should create credit_line' do
    assert_difference('CreditLine.count') do
      post credit_lines_url, params: { credit_line: { client_type: @credit_line.client_type, credit_type_id: @credit_line.credit_type_id, description: @credit_line.description, name: @credit_line.name } }
    end

    assert_redirected_to credit_line_url(CreditLine.last)
  end

  test 'should show credit_line' do
    get credit_line_url(@credit_line)
    assert_response :success
  end

  test 'should get edit' do
    get edit_credit_line_url(@credit_line)
    assert_response :success
  end

  test 'should update credit_line' do
    patch credit_line_url(@credit_line), params: { credit_line: { client_type: @credit_line.client_type, credit_type_id: @credit_line.credit_type_id, description: @credit_line.description, name: @credit_line.name } }
    assert_redirected_to credit_line_url(@credit_line)
  end

  test 'should destroy credit_line' do
    assert_difference('CreditLine.count', -1) do
      delete credit_line_url(@credit_line)
    end

    assert_redirected_to credit_lines_url
  end
end
