require 'test_helper'

class CreditTypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @credit_type = credit_types(:one)
  end

  test 'should get index' do
    get credit_types_url
    assert_response :success
  end

  test 'should get new' do
    get new_credit_type_url
    assert_response :success
  end

  test 'should create credit_type' do
    assert_difference('CreditType.count') do
      post credit_types_url, params: { credit_type: { client_type: @credit_type.client_type, description: @credit_type.description, name: @credit_type.name } }
    end

    assert_redirected_to credit_type_url(CreditType.last)
  end

  test 'should show credit_type' do
    get credit_type_url(@credit_type)
    assert_response :success
  end

  test 'should get edit' do
    get edit_credit_type_url(@credit_type)
    assert_response :success
  end

  test 'should update credit_type' do
    patch credit_type_url(@credit_type), params: { credit_type: { client_type: @credit_type.client_type, description: @credit_type.description, name: @credit_type.name } }
    assert_redirected_to credit_type_url(@credit_type)
  end

  test 'should destroy credit_type' do
    assert_difference('CreditType.count', -1) do
      delete credit_type_url(@credit_type)
    end

    assert_redirected_to credit_types_url
  end
end
