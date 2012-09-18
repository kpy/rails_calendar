# coding: UTF-8
class SessionsController < ApplicationController
  def new
    render 'new'
  end
  
  def create
  	user = User.authenticate(params[:email], params[:password])
  	if user
  	  session[:user_id] = user.id
  	  redirect_to root_url, :notice => "Erfolgreich eingeloggt"
  	else
  	  flash.now.alert = "Login war nicht möglich. Falsche Email oder falsches Passwort"
  	  render "new"
  	end
  end

  def destroy
	session[:user_id] = nil
	redirect_to root_url, :notice => "Erfolgreich ausgeloggt"
  end
end
