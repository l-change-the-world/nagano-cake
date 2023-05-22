class Admin::MembersController < ApplicationController
  before_action :authenticate_admin!
  def index
    @members = Member.page(params[:page])
  end

  def show
    @member = Member.find(params[:id])
  end

  def edit
    @member = Member.find(params[:id])
  end

  def update
    @member = Member.find(params[:id])
    @member.update(member_params)
    redirect_to admin_member_path(@member)
  end

  private

  def member_params
    params.require(:member).permit(:email, :last_name, :first_name, :last_name_ruby, :first_name_ruby, :postal_code, :address, :telephone_number)
  end

end
