class DealReport < ApplicationRecord
    enum offense: ["Pornographic material", "Bad Language/Racist Comments", "Other"]
    belongs_to :deal
    belongs_to :account
end
