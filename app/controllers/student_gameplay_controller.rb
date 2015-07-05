class StudentGameplayController < ApplicationController
  def login
    if request.post?
      group = Group.find_by_password(params[:password])
      if group
        redirect_to student_gameplay_home_path, notice: "Logged in."
      else
        flash.now[:notice] = "Incorrect Password"
      end
    end
  end

  def home
  end
end
