class ReservationsController < ApplicationController
  def index
    
  end

  def all
    locations = Location.all.where(active: true).includes(:type, :level)
    output = []
    locations.map do |location|
      object = {
        id: location.id,
        name: location.name,
        type: location.type.name,
        level: location.level.name,
        places: location.places,
        price: location.price,
        fee: location.fee
      }
      output.push(object)
    end
    render :json=>output
  end

  def create
    location = params.permit(:location)
    start_date = params.permit(:startDate)
    end_date = params.permit(:endDate)
    identyficator = Digest::SHA1.hexdigest([Time.now, rand].join)

    params.permit(:city, :street, :buildingNumber, :flatNumber)

    params.permit(:firstName, :lastName, :email, :phone, :description)
    
  end
end
