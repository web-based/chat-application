class RoomsController < ApplicationController

  def index
    rooms = Room.all
    render json: rooms
    # render json: RoomSerializer.new(rooms)
  end

  def show
    room = Room.find(params[:id])
    render json: room
  end

  def create
    room = Room.create(rooms_params)
    users = User.find_by(params[:user_id]);
    if 
      user_rooms = UserRoom.create(user_id: user.id, room_id: room.id)
    else
    render json: room
    end
  end

  private

  def rooms_params
    params.permit(:name, :description)
  end

end
