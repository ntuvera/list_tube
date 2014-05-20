class SharesController < ApplicationController

    # def create
    #   @share = current_user.shares.build(:receiver_id => params[:receiver_id])
    #   if @shares.save
    #     flash[:notice] = "Video sent"
    #     redirect_to play_lists_path
    #   else
    #     flash[:error] = "Something Went Horribly Wrong"
    #     render :action => 'new'
    #   end
    # end

    # def destroy
    #   @share = current_user.shares.find(params[:id])
    #   @share.destroy
    #   redirect_to play_lists_path
    # end

    def edit
      binding.pry

      @clip = Clip.find(params[:id])
      @user = current_user
      @receiver = User.find_by name: params["receiver_id"]
    # take clip_id, current_user_id, receiver_id and add to share table
      new_share = Share.create({:user_id => @user.id, :receiver_id => @receiver.id, :clip_id => @clip.id})

    end

end
