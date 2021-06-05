class ApplicationController < ActionController::Base
    
    def after_sign_in_path_for(resource)
      if current_user
        flash[:notice] = "ログインに成功しました" 
        root_path  #　指定したいパスに変更
      else
        flash[:notice] = "新規登録完了しました。" 
        root_path  #　指定したいパスに変更
      end
    end

    def after_sign_out_path_for(resource)
      if current_user
        flash[:notice] = "ログインに失敗しました" 
        root_path  #　指定したいパスに変更
      else
        flash[:notice] = "ログアウトしました。" 
        root_path  #　指定したいパスに変更
      end
    end

    private
    def sign_in_required
        redirect_to new_user_session_url unless user_signed_in?
    end
    
#  protect_from_forgery with: :exception
#  before_action :set_current_user
#  before_action :configure_permitted_parameters, if: :devise_controller?
#
#  def set_current_user
#    @current_user = User.find_by(id: session[:user_id])
#  end
#  
#  def authenticate_user
#    if @current_user == nil
#      flash[:notice] = "ログインが必要です"
#      redirect_to("/login/form")
#    end
#  end
#  
#  def forbid_login_user
#    if @current_user
#      flash[:notice] = "すでにログインしています"
#      redirect_to("/")
#    end
#  end
#    
#  def configure_permitted_parameters
#    added_attrs = [ :email, :name, :password, :password_confirmation ]
#    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
#    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
#    devise_parameter_sanitizer.permit :sign_in, keys: added_attrs
#  end

end
