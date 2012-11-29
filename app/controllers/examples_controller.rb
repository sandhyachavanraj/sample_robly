class ExamplesController < ApplicationController
  before_filter :allow_one_time_registration, only: :new
  def new
    @user = current_user
  end
  
  def create
    @user = current_user
    if @user.update_attributes(params[:user])
      redirect_to examples_path, notice: 'You are successfully registerd!'
    else
      render :new, layout: 'register'
    end
  end
  
  def show
    
  end
  
  private
  def allow_one_time_registration
    if current_user.username.present?
      redirect_to examples_path, alert: 'Already your details are registered!'
    end
  end
end
