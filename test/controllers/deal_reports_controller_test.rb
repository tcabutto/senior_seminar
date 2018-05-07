require 'test_helper'

class DealReportsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @deal_report = deal_reports(:one)
  end

  test "should get index" do
    get deal_reports_url
    assert_response :success
  end

  test "should get new" do
    get new_deal_report_url
    assert_response :success
  end

  test "should create deal_report" do
    assert_difference('DealReport.count') do
      post deal_reports_url, params: { deal_report: { content: @deal_report.content, offense: @deal_report.offense, reportable_id: @deal_report.reportable_id, reporter_id: @deal_report.reporter_id } }
    end

    assert_redirected_to deal_report_url(DealReport.last)
  end

  test "should show deal_report" do
    get deal_report_url(@deal_report)
    assert_response :success
  end

  test "should get edit" do
    get edit_deal_report_url(@deal_report)
    assert_response :success
  end

  test "should update deal_report" do
    patch deal_report_url(@deal_report), params: { deal_report: { content: @deal_report.content, offense: @deal_report.offense, reportable_id: @deal_report.reportable_id, reporter_id: @deal_report.reporter_id } }
    assert_redirected_to deal_report_url(@deal_report)
  end

  test "should destroy deal_report" do
    assert_difference('DealReport.count', -1) do
      delete deal_report_url(@deal_report)
    end

    assert_redirected_to deal_reports_url
  end
end
