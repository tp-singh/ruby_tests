class PaymentsController < ApplicationController

  # POST /payments
  # POST /payments.json
  def create

    @payment = Payment.find_or_initialize_by_line_item_id_and_service_id(params[:payment][:line_item_id], params[:payment][:service_id])

    respond_to do |format|
      if @payment.update_attributes(params[:payment])
        format.html { redirect_to @payment, notice: 'Payment was successfully made.' }
        format.json { render json: @payment, status: :created, location: @payment }
      else
        format.html { render action: "new" }
        format.json { render json: @payment.errors, status: :unprocessable_entity }
      end
    end
  end

end
