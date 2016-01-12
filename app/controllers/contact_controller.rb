class ContactController < ApplicationController
  before_action :require_user
  def index
    @contacts = Contact.all
  end

  def show
    @contact = Contact.find(params[:id])
  end

  def new
    @contact = Contact.new
  end

  def edit
    @contact = Contact.find(params[:id])
  end

  def create
    @contact = Contact.new(contact_params)

    if @contact.save
      flash[:success] = "Contact created!"
      redirect_to @contact
    else
      render 'new'
    end
  end

  def update
    @contact = Contact.find(params[:id])

    if @contact.update(contact_params)
      flash[:success] ="Info updated"
      redirect_to @contact
    else
      render 'edit'
    end
  end

  def delete
    @contact = Contact.find(params[:id])
  end

  def destroy
    @contact = Contact.find(params[:id])
    flash[:success] = "Contact deleted"
    @contact.destroy

    redirect_to contact_index_path
  end

  private
  def contact_params
    params.require(:contact).permit(:image, :first_name, :last_name, :email, :phone)
  end
end
