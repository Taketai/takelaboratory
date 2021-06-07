class DonationsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_donation, only: [:show, :edit, :update, :destroy]
  before_action :move_to_root_path, only: [:edit, :update, :destroy]

  def index
    @donation = Donation.order("created_at DESC")
  end

  def show
    
  end

  def new
    @donation = Donation.new
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

  def edit

  end

  def update
    if @donation.update(donation_params)
      redirect_to action: :show
    else
      render :edit
    end
  end

  def destroy
    @donation.destroy
    redirect_to root_path
  end

  private

  def set_donation
    @donation = Donation.find(params[:id])
  end

  def donation_params
    params.require(:donation).permit(:donation_name, :description, :price, :image).merge(user_id: current_user.id)
  end

  def move_to_root_path
    if current_user.id != @donation.user_id
      redirect_to root_path
    else
      # if @donation.order != nil
      #   redirect_to root_path    
      # end
    end
  end


end