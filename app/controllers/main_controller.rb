class MainController < ApplicationController
    def index
        @allcontacts = Main.all
    end
    def show
        @contact = Main.find(params[:id])
        @level = @contact.level
    end
    def new
        @contact = Main.new
    end
    def create
        @contact = Main.new(contact_params)
        if @contact.save
            redirect_to main_path
        else
            render 'new'
        end
    end
    private
    def contact_params
        params_require(:newcontact).permit(:image, :first_name, :last_name, :email, :phone)
    end
    def edit
        @contact = Main.find(params[:id])
    end
    def update
        @contact = Main.find(params[:id])
        if @contact.update_attributes(editcontact_params)
            redirect_to(:action => 'show', :id => @contact.id)
        else
            render 'edit'
        end
    end
    private
    def editcontact_params
        params.require(:contact).permit(:image, :first_name, :last_name, :email, :phone)
    end

end
