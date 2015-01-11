class ReservationsController < ApplicationController
  def index
    
  end

  def all
    render :json=>Location.all
  end
end
