require 'test_helper'

class WorkbookControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get workbook_index_url
    assert_response :success
  end

  test "should get execution" do
    get workbook_execution_url
    assert_response :success
  end

  test "should get reports" do
    get workbook_reports_url
    assert_response :success
  end

end
