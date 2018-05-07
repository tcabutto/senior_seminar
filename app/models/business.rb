class Business < ApplicationRecord
  has_one :account, as: :accountable
  has_many :deals, :dependent => :destroy
  has_many :events, :dependent => :destroy

  
  enum status: [:Pending, :Rejected, :Approved]

  validates :name, presence:true, on: :update
  validates :address1, presence:true, on: :update
  validates :city, presence:true, on: :update
  validates :state, presence:true, on: :update
  validates :zip, presence:true, on: :update, format: { :with => /(^\d{5}$)|(^\d{5}-\d{4}$)/, 
                                                        message: "must be in 12345 or 12345-1234 format" }
  validates :phone_number, presence:true, on: :update
  validates :phone_number, on: :update, format: { :with => /\(?[0-9]{3}\)?-[0-9]{3}-[0-9]{4}/, 
                                                  message: "must be in 123-456-7890 format" }

  geocoded_by :address #can also be an IP address
  after_validation :geocode #autofetch coordinates

  # builds the string in order to be used by geocoder in google maps.
  def address
    [address1, address2, city, state, zip].compact.join(', ')
  end

  mount_uploader :logo, PictureUploader

  paginates_per 10
end
