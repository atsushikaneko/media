class StaticPagesController < ApplicationController
  before_action :logged_in_user, only: [:setting] #管理ページはログインしないと入れない

  def home
  end

  def about
  end

  def contact
  end

  def help
  end

  def setting
  end

end
