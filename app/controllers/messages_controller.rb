class MessagesController < ApplicationController
    before_action do
        @room = Room.find(params[:room_id])
      end
    
    def index
        @messages = @room.messages

        if @messages.length > 10
            @over_ten = true
            @messages = @messages[-10..-1]
        end

        if params[:m]
            @over_ten = false
            @messages = @room.messages
        end

        if @messages.last
            if @messages.last.user_id != @current_user.id
                @messages.last.read = true;
            end
        end
        @message = @room.messages.new
    end

    def new
        @message = @room.messages.new
    end

    def create
        @message = @room.messages.new(message_params)
        if @message.save
            redirect_to room_messages_path(@room)
        end
    end

    private
    def message_params
        params.require(:message).permit(:content, :user_id)
    end
end
