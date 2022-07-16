class Message < ApplicationRecord
  belongs_to :user
  belongs_to :room

  validates_presence_of :content, :room_id, :user_id

  def message_time
      created_at.strftime("%m/%d/%y at %l:%M %p")
  end
end
