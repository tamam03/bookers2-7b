class ChatsController < ApplicationController
  def show
    @user = User.find(params[:id])
    @chats = room.chats
    @chat = Chat.new(room_id: room.id)
  end

  def create
    @chat = current_user.chats.new(chat_params)
    @chat.save
  end

  private

  def chat_params
    params.require(:chat).permit(:message, :room_id)
  end
end
