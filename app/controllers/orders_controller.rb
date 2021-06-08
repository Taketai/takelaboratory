class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_donation, only: [:index, :create]

  def index
      @donation_order = DonationOrder.new  
  end

  def create
    @donation_order = DonationOrder.new(order_params)
    if @donation_order.valid?
      pay_donation
      @donation_order.save
      return redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def set_donation
    @donation = Donation.find(params[:donation_id])
    unless current_user.id != @donation.user_id && @donation.order == nil
      redirect_to root_path
    end
  end

  def order_params
    params.require(:donation_order).permit(:postal_code, :shipping_area_id, :city_name, :block_name, :building_name, :phone_number).merge(token: params[:token], donation_id: params[:donation_id], user_id: current_user.id )
  end

  def pay_donation
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @donation.price,  
        card: order_params[:token],    
        currency: 'jpy'                 
      )
  end

end