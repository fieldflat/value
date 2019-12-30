class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      if user.activated?
        log_in user
        flash[:success] = "ログインに成功しました。"
        params[:session][:remember_me] == '1' ? remember(user) : forget(user)
        redirect_back_or user
      else
        message  = "アカウントが認証されていません。"
        message += "メールを確認してください。"
        flash[:warning] = message
        redirect_to root_url
      end
    else
      flash[:danger] = 'メールアドレスもしくはパスワードが違います。'
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    flash[:success] = "ログアウトしました。"
    redirect_to root_url
  end
end
