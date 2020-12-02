class UsersController < ApplicationController
  before_action :required_none, only: [:new]
    before_filter :authenticate_user!
    def show 
      @user = User.find(params[:id])
    end
    def create 
      @user = User.new(user_params) 
      respond_to do |format|
        if @email.save
          flash[:success] = "Create Email Success! "
          format.html { redirect_to @email, notice: 'Email was successfully created.' }
          format.json { render :show, status: :created, location: @email }
        else
          flash[:errors] = "Create Email Failed! "
          format.html { render :new }
          format.json { render json: @email.errors, status: :unprocessable_entity }
        end
      end
      if @user.save 
        session[:user_id] = @user.id 
        redirect_to '/home' 
      else 
        redirect_to '/signup' 
      end 
    end 
    private 
    def user_params
      params.require(:user).permit(:name, :username, :password);
    end
  end


  