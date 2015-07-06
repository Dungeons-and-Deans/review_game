class StudentGameplayController < ApplicationController
  def login
    if request.post?
      group = Group.find_by_password(params[:password]["password"])
      if group
        session[:group_id] = group.id
        redirect_to student_gameplay_home_path, notice: "Logged in."
      else
        flash.now[:notice] = "Incorrect Password"
      end
    end
  end

  def home
    @group = Group.find_by_id(session[:group_id])
  end

  def logout
    session[:group_id] = nil
    redirect_to student_gameplay_login_path, notice: "Successfully logged out."
  end

end
