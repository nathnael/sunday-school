require "application_system_test_case"

class InvoicesTest < ApplicationSystemTestCase
  setup do
    @invoice = invoices(:one)
  end

  test "visiting the index" do
    visit invoices_url
    assert_selector "h1", text: "Invoices"
  end

  test "creating a Invoice" do
    visit invoices_url
    click_on "New Invoice"

    fill_in "Created by", with: @invoice.created_by
    fill_in "Currency type", with: @invoice.currency_type
    fill_in "Date received", with: @invoice.date_received
    fill_in "Deleted at", with: @invoice.deleted_at
    fill_in "Invoice amount", with: @invoice.invoice_amount
    fill_in "Invoice date", with: @invoice.invoice_date
    fill_in "Invoice number", with: @invoice.invoice_number
    fill_in "Lti number", with: @invoice.lti_number
    fill_in "Modified by", with: @invoice.modified_by
    fill_in "Number of waybill", with: @invoice.number_of_waybill
    fill_in "Received from", with: @invoice.received_from
    fill_in "Remark", with: @invoice.remark
    fill_in "Submitted by", with: @invoice.submitted_by
    fill_in "Vendor", with: @invoice.vendor_id
    click_on "Create Invoice"

    assert_text "Invoice was successfully created"
    click_on "Back"
  end

  test "updating a Invoice" do
    visit invoices_url
    click_on "Edit", match: :first

    fill_in "Created by", with: @invoice.created_by
    fill_in "Currency type", with: @invoice.currency_type
    fill_in "Date received", with: @invoice.date_received
    fill_in "Deleted at", with: @invoice.deleted_at
    fill_in "Invoice amount", with: @invoice.invoice_amount
    fill_in "Invoice date", with: @invoice.invoice_date
    fill_in "Invoice number", with: @invoice.invoice_number
    fill_in "Lti number", with: @invoice.lti_number
    fill_in "Modified by", with: @invoice.modified_by
    fill_in "Number of waybill", with: @invoice.number_of_waybill
    fill_in "Received from", with: @invoice.received_from
    fill_in "Remark", with: @invoice.remark
    fill_in "Submitted by", with: @invoice.submitted_by
    fill_in "Vendor", with: @invoice.vendor_id
    click_on "Update Invoice"

    assert_text "Invoice was successfully updated"
    click_on "Back"
  end

  test "destroying a Invoice" do
    visit invoices_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Invoice was successfully destroyed"
  end
end
