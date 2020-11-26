class ApplicationController < ActionController::Base
    before_action :authenticate_user!
    include Pundit

    after_action :verify_authorized, except: :index, unless: :skip_pundit?
    after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
 
    private
   
        def user_not_authorized
            flash[:warning] = "You are not authorized to perform this action."
            redirect_to(request.referrer || root_path)
        end

        def skip_pundit?
            devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
        end

        def after_successful_token_authentication
            # Make the authentication token to be disposable - for example
            renew_authentication_token!
        end
end
