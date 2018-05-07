class Account < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :visits, class_name: "Ahoy::Visit"

  belongs_to :accountable, polymorphic: true
  has_many :transactions
  ACCOUNT_TYPES=["SuperAccount","Personnel", "Business"]
  has_many :event_reports
  has_many :deal_reports


  attr_accessor :type

  acts_as_voter
  
  
end
