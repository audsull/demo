class UsersController < Clearance::UsersController
  skip_before_action :verify_authenticity_token

  def new
    super
  end

  def create
    @user = User.new(user_params)
    key = @user.encrypted_password
    @user.update_attribute(:token, generate_token(key))
    if @user.save
      render json: @user
    else
      render json: 'Error'
    end
  end

  def show
    @user = current_user
  end

  private

  def generate_token(key)
    JWT.encode(user_params, key, 'HS256')
  end

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
