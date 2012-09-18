# coding: UTF-8
class UsersController < ApplicationController
  def new
  	@user = User.new
  end

  def create
  	@user = User.new(params[:user])
  	if @user.save
	    redirect_to root_url, :notice => "Hallo #{@user.name}, vielen Dank für Ihre Anmeldung"
	  else
	    render "new"
	  end
  end 

  def show
    @user = User.find(params[:id])
  end
end
