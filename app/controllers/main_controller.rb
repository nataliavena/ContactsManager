class MainController < ApplicationController
    before_action :require_user
    def index
        @contacts = Main.all
    end

    def show
        @contact = Main.find(params[:id])
    end

    def new
        @contact = Main.new
    end

    def edit
        @contact = Main.find(params[:id])
    end

    def create
        @contact = Main.new(contact_params)

        if @contact.save
            flash[:success] = "Contact created!"
            redirect_to @contact
        else
            render 'new'
        end
    end

    def update
        @contact = Main.find(params[:id])

        if @contact.update(contact_params)
            redirect_to @contact
        else
            render 'edit'
        end
    end

    def delete
        @contact = Main.find(params[:id])
    end

    def destroy
        @contact = Main.find(params[:id])
        flash[:info] = "Contact deleted"
        @contact.destroy

        redirect_to main_index_path
    end

    private
    def contact_params
        params.require(:main).permit(:image, :first_name, :last_name, :email, :phone)
    end

end
