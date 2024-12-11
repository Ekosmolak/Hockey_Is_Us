class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      flash[:notice] = "Thank you for your message! We will get back to you soon."
      redirect_to root_path
    else
      render :new
    end
  end

  def contact_params
    params.require(:contact).permit(:name, :email, :message)
  end
end
