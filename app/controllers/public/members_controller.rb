class Public::MembersController < ApplicationController
    before_action :authenticate_member!
    def show
      @member = current_member
    end

    def edit
      @member = current_member
    end


    def update
      @member = Member.find(current_customer.id)
      #@member = current_member
      if @member.update(member_params)
        redirect_to '/members/my_page'
      else
        render :edit
      end
    end

    def quit
    end

    def out
        @member = current_member
        @member.update(is_deleted: true)
        reset_session
        redirect_to root_path
    end

    private
    def member_params
      params.require(:member).permit(:email, :last_name, :first_name, :last_name_ruby, :first_name_ruby, :postal_code, :address, :telephone_number, :is_deleted)
    end
end