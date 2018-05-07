require 'test_helper'

class EventReportsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @event_report = event_reports(:one)
  end

  test "should get index" do
    get event_reports_url
    assert_response :success
  end

  test "should get new" do
    get new_event_report_url
    assert_response :success
  end

  test "should create event_report" do
    assert_difference('EventReport.count') do
      post event_reports_url, params: { event_report: { content: @event_report.content, offense: @event_report.offense, reportable_id: @event_report.reportable_id, reporter_id: @event_report.reporter_id } }
    end

    assert_redirected_to event_report_url(EventReport.last)
  end

  test "should show event_report" do
    get event_report_url(@event_report)
    assert_response :success
  end

  test "should get edit" do
    get edit_event_report_url(@event_report)
    assert_response :success
  end

  test "should update event_report" do
    patch event_report_url(@event_report), params: { event_report: { content: @event_report.content, offense: @event_report.offense, reportable_id: @event_report.reportable_id, reporter_id: @event_report.reporter_id } }
    assert_redirected_to event_report_url(@event_report)
  end

  test "should destroy event_report" do
    assert_difference('EventReport.count', -1) do
      delete event_report_url(@event_report)
    end

    assert_redirected_to event_reports_url
  end
end
