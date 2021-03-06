class RoomsController < ApplicationController
    def index
      @users = User.all
      @rooms = Room.all
    end

    def create
      # @room = Room.new(room_params)
      if Room.between(params[:sender_id], params[:recipient_id]).present?
        @room = Room.between(params[:sender_id], params[:recipient_id]).first
      else
        @room = Room.create!(room_params)
      end
      redirect_to room_messages_path(@room)
    end

    private

    def room_params
      params.permit(:sender_id, :recipient_id)
    end
end
