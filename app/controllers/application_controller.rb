class ApplicationController < ActionController::Base
  ActionController::Base
    protect_from_forgery with: :exception
    helper_method :current_user, :logged_in?




    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end


    #
    #   if session[:user_id]
    #     @current_user = User.find(session[:user_id])
    #     if @current_user
    #       return @current_user
    #     # else
    #     #   return number_field
    #     end
    #   end
    # end

      def logged_in?
        !!current_user
      end

      def authorize
        redirect_to login_path unless logged_in?
      end
end
