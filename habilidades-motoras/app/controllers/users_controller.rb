class UsersController < ApplicationController
  before_action :set_user, only: [:show,:update, :destroy, :verify_pass]
  before_action :authenticate_request!, only:[:show, :update, :get_user, :verify_pass]

  def login
    user = User.find_by(email: params[:email].to_s.downcase)
    if user && user.authenticate(params[:password])
        auth_token = JsonWebToken.encode({user_id: user.id})
        render json: {auth_token: auth_token}, status: :ok
    else
      renderError("Unauthenticated",401,"Invalid username / password")
    end
  end

  def search_user
    user=User.find_by(id: params[:id])
    if user
      renderError("Success",200,"The user exists")
    else
      renderError("Not found",404,"The user does not exists")
    end
  end

  def confirm
    token = params[:token].to_s
    user = User.find_by(confirmation_token: token)
    if user.present? && user.confirmation_token_valid?
      user.mark_as_confirmed!
      UserNotifierMailer.send_confirm_email(user).deliver
      render json: "Email succesfully confirmed", status: :ok
    else
      renderError("Not found",404,"Invalid token")
    end
  end

  def verify_pass
    if @user.authenticate(params[:password])
      renderError("Success",200,"password is correct")
    else
      renderError("Unauthenticated",401,"Invalid password")
    end
  end

  def get_user
    render json: {id: @current_user.id,
                  name: @current_user.name,
                  age: @current_user.age,
                  email: @current_user.email,
                  type: @current_user.type}
  end

  def show
    if @current_user.id == params[:id].to_i
      get_user
    else
      renderError("Forbidden",403,"current user has no access")
    end
  end

  def create
      @user = User.new(user_params)
    if @user.save
      UserNotifierMailer.send_signup_email(@user).deliver
      head 201
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def update
    if @current_user.id == params[:id].to_i
      if (!user_params[:name]) && ( !user_params[:age]) && (!user_params[:email]) && (!user_params[:type])
        if @user.update(user_params)
          head 204
        else
          render json: @user.errors, status: :unprocessable_entity
        end
      else
        renderError("Not acceptable",406,"Only password cant be updated")
      end
    else
      renderError("Forbidden",403,"current user has no access")
    end
  end

  def destroy
    @user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      if !(Integer(params[:id]) rescue false)
        renderError("Not Acceptable (Invalid Params)", 406, "The parameter id is not an integer")
        return -1
      end
      if @user = User.find(params[:id])
        return @user
      else
        renderError("Not found",404,"User not found")
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :age, :email, :password, :type)
    end
end
