class Public::MembersController < ApplicationController
    before_action :authenticate_member!
    def show
        @member = Member.find(current_member.id)
    end

    def edit
        @member =Member.find(current_member.id)
    end

    def update
        @member = Member.find(current_member.id)
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
        @member.update(is_active: false)
        reset_session
        redirect_to root_path
    end

    private
    def member_params
      params.require(:member).permit(:last_name, :first_name, :last_name_ruby, :first_name_ruby, :email, :encrypted_password, :address_id, :telephone_number, :is_deleted)
    end
end
