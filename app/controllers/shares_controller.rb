class SharesController < ApplicationController

    def edit
      @clip = Clip.find(params[:id])
      @user = current_user
      @receiver = User.find_by name: params["receiver_id"]
      new_share = Share.create({:user_id => @user.id, :receiver_id => @receiver.id, :clip_id => @clip.id})
      redirect_to play_lists_path, notice: 'Clip sent'
    end

end
