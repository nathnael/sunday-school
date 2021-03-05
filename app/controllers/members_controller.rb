class MembersController < ApplicationController
  before_action :set_member, only: [:show, :edit, :update, :destroy, :print_member_form]
  include DateHelper, SubcityTranslated

  # GET /members
  # GET /members.json
  def index
    @members = Member.all
  end

  # GET /members/1
  # GET /members/1.json
  def show
    @departments = MemberDepartment.where(member_id: @member.id).joins(:department).map { |d| d.department.name }.join(', ')
    @home_address = Address.find_by_id(@member.home_address_id)
    @work_address = Address.find_by_id(@member.work_address_id)
    @emergency_contact = EmergencyContact.find_by_id(@member.emergency_contact_id)
    @emergency_contact_address = Address.find_by_id(@emergency_contact.address_id)
  end

  # GET /members/new
  def new
    @member = Member.new
    # @home_address = []
    # @work_address = []
    # @departments = []
    # @emergency_contact = []
    # @emergency_contact_address = []
  end

  # GET /members/1/edit
  def edit
    @departments = MemberDepartment.where(member_id: @member.id).joins(:department).map { |d| d.department.id }
    @home_address = Address.find_by_id(@member.home_address_id)
    @work_address = Address.find_by_id(@member.work_address_id)
    @emergency_contact = EmergencyContact.find_by_id(@member.emergency_contact_id)
    @emergency_contact_address = Address.find_by_id(@emergency_contact.address_id)
  end

  # POST /members
  # POST /members.json
  def create
    profile_picture = member_params[:profile_picture]
    departments_hash = member_params[:depart]
    home_address_hash = member_params[:home_addr]
    work_address_hash = member_params[:work_addr]
    emergency_contact_hash = member_params[:emergency_cont]
    emergency_contact_address_hash = member_params[:emergency_cont][:addr]    
    home_address = Address.new(home_address_hash)
    home_address.created_by = current_user.id
    home_address.save
    work_address = Address.new(work_address_hash)
    work_address.created_by = current_user.id
    work_address.save
    emergency_contact_address = Address.new(emergency_contact_address_hash)
    emergency_contact_address.created_by = current_user.id
    emergency_contact_address.save
    emergency_contact_map = emergency_contact_hash.except(:addr)
    emergency_contact_map[:address_id] = emergency_contact_address.id
    emergency_contact = EmergencyContact.new(emergency_contact_map)
    emergency_contact.created_by = current_user.id
    emergency_contact.save
    member_map = member_params.except(:depart, :home_addr, :work_addr, :emergency_cont, :profile_picture)
    member_map[:home_address_id] = home_address.id
    member_map[:work_address_id] = work_address.id
    member_map[:emergency_contact_id] = emergency_contact.id

    @member = Member.new(member_map)
    @member.created_by = current_user.id
    @member.status = 1

    respond_to do |format|
      if @member.save
        if departments_hash
          dispatch_items = departments_hash.collect { |d| MemberDepartment.create({member_id: @member.id, department_id: d, created_by: current_user.id })}
        end
        if profile_picture
          File.open(Rails.root.join('public', 'uploads', profile_picture.original_filename), 'wb') do |file|
            file.write(profile_picture.read)
            @uniq_path = Rails.root.join('public', 'uploads', @member.id.to_s + DateTime.now.to_s + File.extname(file))
            File.rename(file, @uniq_path)
            @member.profile_picture_url = @member.id.to_s + DateTime.now.to_s + File.extname(file)
            @member.save
          end
        end
        format.html { redirect_to @member, notice: 'Member was successfully created.' }
        format.json { render :show, status: :created, location: @member }
      else
        format.html { render :new }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /members/1
  # PATCH/PUT /members/1.json
  def update
    profile_picture = member_params[:profile_picture]
    departments_hash = member_params[:depart]
    home_address_hash = member_params[:home_addr]
    work_address_hash = member_params[:work_addr]
    emergency_contact_hash = member_params[:emergency_cont]
    emergency_contact_address_hash = member_params[:emergency_cont][:addr]  
    
    if profile_picture.present?
      File.delete(Rails.root.join('public', 'uploads', @member.profile_picture_url)) if File.exist?(Rails.root.join('public', 'uploads', @member.profile_picture_url))
      File.open(Rails.root.join('public', 'uploads', profile_picture.original_filename), 'wb') do |file|
        file.write(profile_picture.read)
        @uniq_path = Rails.root.join('public', 'uploads', @member.id.to_s + DateTime.now.to_s + File.extname(file))
        File.rename(file, @uniq_path)
        @member.profile_picture_url = @member.id.to_s + DateTime.now.to_s + File.extname(file)
        @member.save
      end
    end
    MemberDepartment.where(member_id: @member.id).collect { |d| d.destroy }
    if departments_hash.present?      
      dispatch_items = departments_hash.collect { |d| MemberDepartment.create({member_id: @member.id, department_id: d, created_by: current_user.id })}
    end

    home_address = Address.find_by_id(@member.home_address_id)
    home_address.modified_by = current_user.id
    home_address.update(home_address_hash)

    work_address = Address.find_by_id(@member.work_address_id)
    work_address.modified_by = current_user.id
    work_address.update(work_address_hash)

    emergency_contact_map = emergency_contact_hash.except(:addr)
    emergency_contact = EmergencyContact.find_by_id(@member.emergency_contact_id)
    emergency_contact.modified_by = current_user.id
    emergency_contact.update(emergency_contact_map)

    emergency_contact_address = Address.find_by_id(emergency_contact.address_id)
    emergency_contact_address.modified_by = current_user.id
    emergency_contact_address.update(emergency_contact_address_hash)

    member_map = member_params.except(:depart, :home_addr, :work_addr, :emergency_cont, :profile_picture)

    respond_to do |format|
      if @member.update(member_map)        
        format.html { redirect_to @member, notice: 'Member was successfully updated.' }
        format.json { render :show, status: :ok, location: @member }
      else
        format.html { render :edit }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  def print_member_form
    @member.dob = toEthiopian(@member.dob)
    @member.membership_date = toEthiopian(@member.membership_date)
    
    @departments = MemberDepartment.where(member_id: @member.id).joins(:department).map { |d| d.department.id }
    @home_address = Address.find_by_id(@member.home_address_id)    
    @home_address.sub_city = subcityToAmharic(@home_address.sub_city)
    @work_address = Address.find_by_id(@member.work_address_id)
    @work_address.sub_city = subcityToAmharic(@work_address.sub_city)
    @emergency_contact = EmergencyContact.find_by_id(@member.emergency_contact_id)
    @emergency_contact_address = Address.find_by_id(@emergency_contact.address_id)
    @emergency_contact_address.sub_city = subcityToAmharic(@emergency_contact_address.sub_city)
    respond_to do |format|
      format.html
      format.pdf do
          pdf = PrintMemberFormPdf.new(@member, @home_address, @work_address, @emergency_contact, @emergency_contact_address)          
          send_data pdf.render, filename: "#{@member.id}_#{@member.full_name}_member_form.pdf",
          type: "application/pdf",
          disposition: "inline"
      end
    end
  end

  # DELETE /members/1
  # DELETE /members/1.json
  def destroy
    @member.destroy
    respond_to do |format|
      format.html { redirect_to members_url, notice: 'Member was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_member
      @member = Member.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def member_params
      params.require(:member).permit(:profile_picture, :name, :name_am, :father_name, :father_name_am, :grand_father_name, :grand_father_name_am, :gender, :dob, :educational_level, :work, :christian_name, :christian_name_am, :membership_date, :talent, :home_address_id, :work_address_id, :emergency_contact_id, :status, :created_by, :modified_by, :deleted_at, :depart => [], :home_addr => [:id, :sub_city, :woreda, :house_no, :home_phone, :mobile_phone, :email, :postal_code], :work_addr => [:id, :sub_city, :woreda, :house_no, :home_phone, :mobile_phone, :email, :postal_code], :emergency_cont => [:id, :full_name, :relation, :addr => [:id, :sub_city, :woreda, :house_no, :home_phone, :mobile_phone, :email, :postal_code]] )
    end
end
