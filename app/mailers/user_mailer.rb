class UserMailer < ApplicationMailer
  def account_activation(user)
    @user = user
    mail to: user.email, subject: "【Value】登録ありがとうございます！"
  end

  def password_reset(user)
    @user = user
    mail to: user.email, subject: "【Value】パスワードのリセットについて"
  end

  def notice_buying(micropost, buyer, seller, room)
    @micropost = micropost
    @buyer = buyer
    @seller = seller
    @room = room
    mail to: buyer.email, subject: "【Value】商品の購入を確認いたしました！"
  end

  def notice_bought(micropost, buyer, seller, room)
    @micropost = micropost
    @buyer = buyer
    @seller = seller
    @room = room
    mail to: seller.email, subject: "【Value】商品が購入されました！"
  end

  def notice_message(micropost, from, to, room)
    @micropost = micropost
    @from = from
    @to = to
    @room = room
    mail to: to.email, subject: "【Value】メッセージが届きました！"
  end

  def evaluating(micropost, from, to, room)
    @micropost = micropost
    @from = from
    @to = to
    @room = room
    mail to: to.email, subject: "【Value】評価が完了いたしました！"
  end

  def evaluated(micropost, from, to, room)
    @micropost = micropost
    @from = from
    @to = to
    @room = room
    mail to: to.email, subject: "【Value】相手が評価を完了しました！"
  end

  def evaluating_done(micropost, from, to, room)
    @micropost = micropost
    @from = from
    @to = to
    @room = room
    mail to: to.email, subject: "【Value】取引が終了しました！"
  end
end
