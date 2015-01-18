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
    location = params.permit(:location)["location"]
    start_date = params.permit(:startDate)["startDate"]
    end_date = params.permit(:endDate)["endDate"]
    identyficator = Digest::SHA1.hexdigest([Time.now, rand].join)

    adres = Address.create(params.permit(:city, :street, :buildingNumber, :flatNumber))
    customer = adres.customers.create(params.permit(:firstName, :lastName, :email, :phone, :description))

    reservation = customer.reservations.create(
      location_id: location, 
      startDate: start_date, 
      endDate: end_date,
      reservationNumber: identyficator
      )
    
    render :json=>reservation
  end

  def showLocation
    render :json=> Location.where(params.permit(:id)).first.reservations
  end
  def show
    reseravations = Reservation.where(params.permit(:reservationNumber)).includes(customers: :address, location: [:type, :level])
    output = []
    reseravations.map do |reservation|
      object = {
        startDate: reservation.startDate,
        endDate: reservation.endDate,
        location: {
          name: reservation.location.name,
          type: reservation.location.type.name,
          level: reservation.location.level.name
          },
        customer: reservation.customers[0],
        address: reservation.customers[0].address
        }
      output.push(object)
    end
    render :json=>output
  end

end
