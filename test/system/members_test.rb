require "application_system_test_case"

class MembersTest < ApplicationSystemTestCase
  setup do
    @member = members(:one)
  end

  test "visiting the index" do
    visit members_url
    assert_selector "h1", text: "Members"
  end

  test "creating a Member" do
    visit members_url
    click_on "New Member"

    fill_in "Christian name", with: @member.christian_name
    fill_in "Christian name am", with: @member.christian_name_am
    fill_in "Created by", with: @member.created_by
    fill_in "Deleted at", with: @member.deleted_at
    fill_in "Dob", with: @member.dob
    fill_in "Educational level", with: @member.educational_level
    fill_in "Emergency contact", with: @member.emergency_contact_id
    fill_in "Father name", with: @member.father_name
    fill_in "Father name am", with: @member.father_name_am
    fill_in "Gender", with: @member.gender
    fill_in "Grand father name", with: @member.grand_father_name
    fill_in "Grand father name am", with: @member.grand_father_name_am
    fill_in "Home address", with: @member.home_address_id
    fill_in "Membership date", with: @member.membership_date
    fill_in "Modified by", with: @member.modified_by
    fill_in "Name", with: @member.name
    fill_in "Name am", with: @member.name_am
    fill_in "Status", with: @member.status
    fill_in "Talent", with: @member.talent
    fill_in "Work", with: @member.work
    fill_in "Work address", with: @member.work_address_id
    click_on "Create Member"

    assert_text "Member was successfully created"
    click_on "Back"
  end

  test "updating a Member" do
    visit members_url
    click_on "Edit", match: :first

    fill_in "Christian name", with: @member.christian_name
    fill_in "Christian name am", with: @member.christian_name_am
    fill_in "Created by", with: @member.created_by
    fill_in "Deleted at", with: @member.deleted_at
    fill_in "Dob", with: @member.dob
    fill_in "Educational level", with: @member.educational_level
    fill_in "Emergency contact", with: @member.emergency_contact_id
    fill_in "Father name", with: @member.father_name
    fill_in "Father name am", with: @member.father_name_am
    fill_in "Gender", with: @member.gender
    fill_in "Grand father name", with: @member.grand_father_name
    fill_in "Grand father name am", with: @member.grand_father_name_am
    fill_in "Home address", with: @member.home_address_id
    fill_in "Membership date", with: @member.membership_date
    fill_in "Modified by", with: @member.modified_by
    fill_in "Name", with: @member.name
    fill_in "Name am", with: @member.name_am
    fill_in "Status", with: @member.status
    fill_in "Talent", with: @member.talent
    fill_in "Work", with: @member.work
    fill_in "Work address", with: @member.work_address_id
    click_on "Update Member"

    assert_text "Member was successfully updated"
    click_on "Back"
  end

  test "destroying a Member" do
    visit members_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Member was successfully destroyed"
  end
end
