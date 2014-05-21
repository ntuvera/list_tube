class Fave < ActiveRecord::Base

  def destroy
    binding.pry
    ClipsUser.delete(params['id'])
    redirect_to play_lists_path
  end

end
