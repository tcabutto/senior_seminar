class EventReport < ApplicationRecord
    #belongs_to :reportable, polymorphic: true
    belongs_to :event, required: false
    belongs_to :account, required: false
     enum offense: ["Pornographic Material", "Bad Language/Racist Comments", "Other"]
end
