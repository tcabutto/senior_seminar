class Event < ApplicationRecord
  belongs_to :business
  has_many :comments, as: :commentable
  has_many :event_reports#, as: :reportable


  validates :name, presence:true
  validates :address1, presence:true
  validates :city, presence:true
  validates :state, presence:true
  validates :zip, presence:true
  validates_format_of :zip, 
                      :with => /\A\d{5}(-\d{4})?\z/, 
                      :message => "should be in the form 12345 or 12345-1234"
  validates_date :start, :on_or_after => :today
  validates_date :end, :on_or_after => :start

  geocoded_by :address #can also be an IP address
  after_validation :geocode #autofetch coordinates
  
   # builds the string in order to be used by geocoder in google maps.
   def address
    [address1, address2, city, state, zip].compact.join(', ')
   end

  mount_uploader :image_url, PictureUploader

  acts_as_votable

  paginates_per 10
end
