class ContactsController < ApplicationController
  def index
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      flash[:notice] = 'Your contact was created!'
      redirect_to contacts_path
    else
      render 'new'
    end
  end

  def edit
    @contact = Contact.find(params[:id])
    render :edit
  end

  def update
    @contact = Contact.find(params[:id])
    if @contact.update(contact_params)
      flash[:notice] = 'Contact edited!'
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy
    flash[:notice] = 'Contact deleted!'
    redirect_to root_path
  end

private
  def contact_params
    params.require(:contact).permit(:name, :number).merge(:user_id => current_user.id)
  end
end
