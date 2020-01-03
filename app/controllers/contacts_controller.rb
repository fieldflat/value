class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contacts_params)
    if @contact.save
      flash[:success] = "お問い合わせを送信しました"
      UserMailer.send_contact_mail(@contact.content, @contact.user).deliver_now
      redirect_to root_path
    else
      flash[:danger] = "送信に失敗しました。"
      render 'new'
    end
  end

  private

    def contacts_params
      params.require(:contact).permit(:content, :user_id)
    end
end
