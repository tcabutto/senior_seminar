class Deal < ApplicationRecord
  belongs_to :business
  has_many :transactions
  has_many :comments, as: :commentable
  has_many :deal_reports#, as: :reportable

  before_create :set_qr_code

  validates :name, presence:true,  on: :create

  validates_date :start_date, :on_or_after => :today, on: :create

  validates_date :end_date, :after => :start_date, on: :create
  enum category: ["Food", "Clothing", "Electronics", "Services", "Health & Fitness", "Education", "Automotive", "Other"]
  enum reported: ["False", "True"]

  acts_as_votable

 #later can combine both checkvote and checkfav and return a hash
 
  def checkvote(vote,account)
    @deal = Deal.find_by_id(vote)
    @vs = 0 
    @current = account
     
    if @current.voted_for? @deal, :vote_scope => 'popularity'
      if @current.voted_up_on? @deal, vote_scope: 'popularity'
        @vs = 1
      else
        @vs = -1
      end
    end
    return @vs
  end
  
  def checkfav(state, account)
    @deal = Deal.find_by_id(state)
    @fs = 0
    @current = account
    if @current.voted_for? @deal, :vote_scope => 'favorite'
      @fs = 1
    end
    return @fs
  end
  
  def getlogo(deal)
    @deal = Deal.find_by_id(deal)
    if @deal.business.logo.present?
      return @deal.business.logo
    else
      return @deal.business.logo.default_url
    end
    
  end
  
  def getbusinessname(deal)
    @deal = Deal.find_by_id(deal)
    return @deal.business.name
  end
  
  protected 
  def set_qr_code
    self.qr_code = generate_code
  end
  
  def generate_code
    loop do 
      code = SecureRandom.hex(4)
      break code unless Deal.where(qr_code: code).exists?
    end
  end
  


  paginates_per 10

end
