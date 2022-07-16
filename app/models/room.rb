class Room < ApplicationRecord
    has_many :messages, dependent: :destroy
    belongs_to :sender, :foreign_key => :sender_id, class_name: "User"
    belongs_to :recipient, :foreign_key => :recipient_id, class_name: "User"

    validates_uniqueness_of :sender_id, :scope => :recipient_id
    
    scope :between, -> (sender_id,recipient_id) do
        where("(rooms.sender_id = ? AND rooms.recipient_id =?) OR (rooms.sender_id = ? AND rooms.recipient_id =?)", sender_id,recipient_id, recipient_id, sender_id)
    end
end
