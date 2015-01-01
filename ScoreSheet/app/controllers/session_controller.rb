class SessionController < ApplicationController
  before_filter :check_login

  #
  # ログイン判定処理
  #
  private
  def check_login
    if session[:is_login] then
      return
    else
      redirect_to auth_login_path
    end
  end
end
