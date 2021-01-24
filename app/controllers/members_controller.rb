class MembersController < ApplicationController
  before_action :set_member, only: [:show, :edit, :update, :destroy]

  # GET /members
  # GET /members.json
  def index
    @members = Member.all
  end

  # GET /members/1
  # GET /members/1.json
  def show
  end

  # GET /members/new
  def new
    @member = Member.new
  end

  # GET /members/1/edit
  def edit
  end

  # POST /members
  # POST /members.json
  def create
    @member = Member.new(member_params)
    puts "Member: " + member_params.inspect
    respond_to do |format|
      if @member.save
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
    respond_to do |format|
      if @member.update(member_params)
        format.html { redirect_to @member, notice: 'Member was successfully updated.' }
        format.json { render :show, status: :ok, location: @member }
      else
        format.html { render :edit }
        format.json { render json: @member.errors, status: :unprocessable_entity }
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
      params.require(:member).permit(:name, :name_am, :father_name, :father_name_am, :grand_father_name, :grand_father_name_am, :gender, :dob, :educational_level, :work, :christian_name, :christian_name_am, :membership_date, :talent, :home_address_id, :work_address_id, :emergency_contact_id, :status, :created_by, :modified_by, :deleted_at, departments: [:id], :home_address => [:id, :sub_city, :woreda, :house_no, :home_phone, :mobile_phone, :email, :postal_code],
      :work_address => [:id, :sub_city, :woreda, :house_no, :home_phone, :mobile_phone, :email, :postal_code], :emergency_contact => [:id, :full_name, :relation, :address => [:id, :sub_city, :woreda, :house_no, :home_phone, :mobile_phone, :email, :postal_code]] )
    end
end
