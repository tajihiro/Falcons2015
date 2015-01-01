class AuthenticationController < ApplicationController
  layout 'application_entry'

  #
  # Login画面表示
  #
  def login

  end

  #
  # Login処理
  #
  def auth_login
    email = params[:email]
    passwd = params[:passwd]
    #ログイン認証処理
    member = Member.authenticate(email, passwd)
    if member then
      #ログイン情報セッション登録
      session[:is_login] = true
      session[:member_id] = member.id
      session[:member_name] = member.member_name
      session[:admin_id] = member.admin_id

      #ログ取得
      # history = History.new
      # history.employee_id = session[:employee_id]
      # history.action_id = 1
      # history.ip_address = request.remote_ip
      # history.save

      redirect_to score_sheet_index_path
    else
      reset_session
      flash[:notice] = "ログインが不正です。"
      redirect_to auth_login_path
    end
  end

  #
  # Logout処理
  #
  def logout
    reset_session
    flash[:notice] = "ログアウトしました。"
    redirect_to auth_login_path
  end

  #
  # Signin画面表示
  #
  def signin

  end

  #
  # Signin処理
  #
  def auth_signin

  end

end
