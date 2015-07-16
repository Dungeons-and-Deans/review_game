class PagesController < ApplicationController
  def home
    if teacher_signed_in?
      redirect_to games_path
    end
  end

  def faq
  end

  def help
  end
end
