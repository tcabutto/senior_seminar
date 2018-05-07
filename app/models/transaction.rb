class Transaction < ApplicationRecord
    belongs_to :account, :dependent => :destroy
    belongs_to :deal, :dependent => :destroy
end
