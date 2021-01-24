class InvoicesController < ApplicationController
  before_action :set_invoice, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token

  # GET /invoices
  # GET /invoices.json
  def index
    @invoices = Invoice.includes(:vendor, :created_by).all
  end

  # GET /invoices/1
  # GET /invoices/1.json
  def show
  end

  # GET /invoices/new
  def new
    @invoice = Invoice.new
  end

  # GET /invoices/1/edit
  def edit
  end

  # POST /invoices
  # POST /invoices.json
  def create
    @invoice = Invoice.new(invoice_params)
    @invoice.created_by_id = current_user.id
    @invoice.status = 1
    respond_to do |format|
      if @invoice.save
        format.html { redirect_to invoices_url, notice: 'Invoice was successfully created.' }
        format.json { render :show, status: :created, location: @invoice }
      else
        format.html { render :new }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /invoices/1
  # PATCH/PUT /invoices/1.json
  def update
    @invoice.modified_by = current_user.id
    respond_to do |format|
      if @invoice.update(invoice_params)
        format.html { redirect_to invoices_url, notice: 'Invoice was successfully updated.' }
        format.json { render :show, status: :ok, location: @invoice }
      else
        format.html { render :edit }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /invoices/1
  # DELETE /invoices/1.json
  def destroy
    @invoice.destroy
    respond_to do |format|
      format.html { redirect_to invoices_url, notice: 'Invoice was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_invoice
      @invoice = Invoice.includes(:vendor, :created_by).find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def invoice_params
      params.require(:invoice).permit(:invoice_number, :vendor_id, :date_received, :invoice_date, :currency_type, :number_of_waybill, :invoice_amount, :remark, :lti_number, :received_by, :received_from, :submitted_by, :deleted_at, :created_by_id, :modified_by, :assigned_to_id)
    end
end