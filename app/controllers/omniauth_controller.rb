class OmniauthController < ApplicationController
  def facebook
  @user = User.create_from_provider_data(request.env['omniauth.auth'])
    if @user.persisted?
      sign_in_and_redirect @user
      #set_flash_message(:notice, :success, kind: 'facebook')if is_navigational_format?
    else
      flash[:notice] = 'there was a problem signing in through facebook. Please register or signing in you later.'
      redirect_to new_user_registration_url
    end
  end

  def google_oauth2
  @user = User.create_from_provider_data(request.env['omniauth.auth'])
    if @user.persisted?
      sign_in_and_redirect @user
      #set_flash_message(:notice, :success, kind: 'Google')if is_navigational_format?
    else
      flash[:notice] = 'there was a problem signing in through Google. Please register or signing in you later.'
      redirect_to new_user_registration_url
    end
  end

  def failure
    flash[:notice] = 'there was a problem signing you in. Please register or signing in you later.'
    redirect_to new_user_registration_url
  end
end
