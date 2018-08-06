require 'test_helper'

class SimulationControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get simulation_index_url
    assert_response :success
  end

end
