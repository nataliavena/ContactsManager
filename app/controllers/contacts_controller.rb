class ContactsController < ApplicationController
  before_action :require_user
  before_action :find_contact, except: [:index, :new, :create]

  def index
    @contacts = current_user.contacts
  end

  def show
  end

  def new
    @contact = Contact.new
  end

  def edit
  end

  def create
    @contact = current_user.contacts.new(contact_params)

    if @contact.save
      flash[:success] = "Contact created!"
      redirect_to @contact
    else
      render 'new'
    end
  end

  def update
    if @contact.update(contact_params)
      flash[:success] ="Info updated"
      redirect_to @contact
    else
      render 'edit'
    end
  end

  def delete
  end

  def destroy
    flash[:success] = "Contact deleted"
    @contact.destroy

    redirect_to contacts_path
  end

  private

  def contact_params
    params.require(:contact).permit(:image, :first_name, :last_name, :email, :phone)
  end

  def find_contact
    @contact = current_user.contacts.find(params[:id])
  end
end

