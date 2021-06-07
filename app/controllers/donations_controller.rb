class DonationsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @donation = Donation.order("created_at DESC")
  end

  def show
    
  end

  def new
    @donation = Donation
  end

  def create

    @donation = Donation.new(donation_params)
    if @donation.valid?
      @donation.save
      redirect_to root_path
    else
      render :new
    end
  end


  private

  def donation_params
    params.require(:donation).permit(:donation_name, :description, :price, :image).merge(user_id: current_user.id)
  end

end