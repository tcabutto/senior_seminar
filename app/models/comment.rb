class Comment < ApplicationRecord
    belongs_to :deal, required: false
    belongs_to :event, required: false
    belongs_to :commentable, polymorphic: true
   # belongs_to :account
    has_many :comments, as: :commentable

    

end
