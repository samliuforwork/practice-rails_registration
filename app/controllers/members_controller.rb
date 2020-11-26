class MembersController < ApplicationController
    def new
        @member = Member.new
    end

    def index
        @members = Member.all
    end

    def create
       @member = Member.new(clear_params) 
       if @member.save
        flash[:notice] = "cool!"
        redirect_to '/books'
       else 
         render :new
       end
    end

    private
    def clear_params
     params.require(:member).permit(:name, :account, :password, :password_confirmation, :email)
    end
end