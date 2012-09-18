# coding: UTF-8
class UsersController < ApplicationController
  def new
  	@user = User.new
  end

  def create
  	@user = User.new(params[:user])
  	if @user.save
	    login @user
      flash[:success] = "Willkommen #{@user.name}!"
      redirect_to @user
	  else
	    render "new"
	  end
  end 

  def show
    @user = User.find(params[:id])
  end
end
