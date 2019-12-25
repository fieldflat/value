class StaticPagesController < ApplicationController
  def home
    @microposts = Micropost.limit(9)
  end

  def creator_info
  end
end
