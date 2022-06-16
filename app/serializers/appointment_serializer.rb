class AppointmentSerializer < ActiveModel::Serializer
  attributes :lat, :lng, :address
  attribute :time do
    object.time.strftime("%d/%m/%Y %k:%M")
  end
  belongs_to :seller
  belongs_to :realtor
end
