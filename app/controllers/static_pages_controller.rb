class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @microposts = Micropost.where(purchased: false).paginate(page: params[:page])
    else
      @microposts = Micropost.where(purchased: false).limit(9)
    end
    @micropost = Micropost.new
  end

  def creator_info
  end

  def how_to_use
  end
end
