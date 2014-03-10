class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def twitter
    user = User.find_for_twitter_oauth(request.env['omniauth.auth'])

    if user.persisted? and user.name
      flash[:notice] = I18n.t 'devise.omniauth_callbacks.success', kind: 'Twitter'
      sign_in_and_redirect user, event: :authentication
    else
      session['devise.twitter_data'] = request.env['omniauth.auth'].except('extra')
      redirect_to new_user_registration_url, resource: user
    end
  end
end