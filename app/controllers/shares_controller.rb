class SharesController < ApplicationController

    def create
      @share = current.user.shares.build(:receiver_id => params[:receiver_id])
      if @shares.save
        flash[:notice] = "Video sent"
        redirect_to root_url
      else
        flash[:error] = "Something Went Horribly Wrong"
        render :action => 'new'
      end
    end

    def destroy
      @share = current_user.shares.find(params[:id])
      @share.destroy
      redirect_to root_url
    end

end
