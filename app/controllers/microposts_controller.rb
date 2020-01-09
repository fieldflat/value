class MicropostsController < ApplicationController
  before_action :logged_in_user, only: [:new, :show, :edit, :create, :destroy, :update]
  before_action :correct_user, only: [:edit, :destroy, :update]

  def new
    @micropost = current_user.microposts.build
  end

  def show
    @micropost = Micropost.find(params[:id])
  end

  def create
    @micropost = current_user.microposts.build(microposts_params)
    if params[:micropost][:requested] == 'true'
      @micropost.requested = true
    elsif params[:micropost][:requested] == 'false'
      @micropost.requested = false
    end
    if @micropost.save
      flash[:success] = "出品しました！"
      redirect_to current_user
    else
      render 'new'
    end
  end

  def edit

  end

  def destroy
    @micropost.delete
    flash[:success] = "削除しました。"
    redirect_to current_user
  end

  def update
    if @micropost.update_attributes(microposts_params)
      if params[:micropost][:requested] == 'true'
        @micropost.requested = true
      elsif params[:micropost][:requested] == 'false'
        @micropost.requested = false
      end
      @micropost.save
      flash[:success] = "編集しました！"
      redirect_to current_user
    else
      render 'edit'
    end
  end

  def search
    @microposts = Micropost.where(purchased: false)
    @microposts = @microposts.where("title like ?", "%"+params[:micropost][:string]+"%")
                             .or(Micropost.where(purchased: false).where("content like ?", "%"+params[:micropost][:string]+"%"))
    if params[:micropost][:tag] != ""
      @microposts = @microposts.where(tag: params[:micropost][:tag])
    end
    @search_words = params[:micropost][:string]
    @tag = params[:micropost][:tag]
    render "static_pages/home"
  end

  private

    def microposts_params
      params.require(:micropost).permit(:title, :content, :price, :picture, :tag)
    end

    def correct_user
      @micropost = current_user.microposts.find_by(id: params[:id])
      if @micropost.nil?
        redirect_to root_url
        flash[:danger] = "権限がありません。"
      end
    end

end