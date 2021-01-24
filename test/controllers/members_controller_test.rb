require 'test_helper'

class MembersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @member = members(:one)
  end

  test "should get index" do
    get members_url
    assert_response :success
  end

  test "should get new" do
    get new_member_url
    assert_response :success
  end

  test "should create member" do
    assert_difference('Member.count') do
      post members_url, params: { member: { christian_name: @member.christian_name, christian_name_am: @member.christian_name_am, created_by: @member.created_by, deleted_at: @member.deleted_at, dob: @member.dob, educational_level: @member.educational_level, emergency_contact_id: @member.emergency_contact_id, father_name: @member.father_name, father_name_am: @member.father_name_am, gender: @member.gender, grand_father_name: @member.grand_father_name, grand_father_name_am: @member.grand_father_name_am, home_address_id: @member.home_address_id, membership_date: @member.membership_date, modified_by: @member.modified_by, name: @member.name, name_am: @member.name_am, status: @member.status, talent: @member.talent, work: @member.work, work_address_id: @member.work_address_id } }
    end

    assert_redirected_to member_url(Member.last)
  end

  test "should show member" do
    get member_url(@member)
    assert_response :success
  end

  test "should get edit" do
    get edit_member_url(@member)
    assert_response :success
  end

  test "should update member" do
    patch member_url(@member), params: { member: { christian_name: @member.christian_name, christian_name_am: @member.christian_name_am, created_by: @member.created_by, deleted_at: @member.deleted_at, dob: @member.dob, educational_level: @member.educational_level, emergency_contact_id: @member.emergency_contact_id, father_name: @member.father_name, father_name_am: @member.father_name_am, gender: @member.gender, grand_father_name: @member.grand_father_name, grand_father_name_am: @member.grand_father_name_am, home_address_id: @member.home_address_id, membership_date: @member.membership_date, modified_by: @member.modified_by, name: @member.name, name_am: @member.name_am, status: @member.status, talent: @member.talent, work: @member.work, work_address_id: @member.work_address_id } }
    assert_redirected_to member_url(@member)
  end

  test "should destroy member" do
    assert_difference('Member.count', -1) do
      delete member_url(@member)
    end

    assert_redirected_to members_url
  end
end
