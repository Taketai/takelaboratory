class DonationsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @donation = Donation.order("created_at DESC")
  end



  def new
    @donation = Donation
  end

  def create

    @donation = Donation.new(Donation_params)
      if @donation.valid?
        @donation.save
        redirect_to root_path
      else
        render :new
      end
  end



end