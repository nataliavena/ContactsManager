class MainController < ApplicationController
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
            redirect_to main_path
        else
            render 'new'
        end
    end

    def update
        @contact = Main.find(params[:id])

        if @contact.update(contact_params)
            redirect_to @article
        else
            render 'edit'
        end
    end

    private
    def contact_params
        params_require(:contact).permit(:image, :first_name, :last_name, :email, :phone)
    end

end
