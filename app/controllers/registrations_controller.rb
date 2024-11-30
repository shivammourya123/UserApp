class RegistrationsController < Devise::RegistrationsController
  def new
    super
  end

  def create
    @user = User.new(user_params)
    if @user.save!
      redirect_to posts_path, alert: "save successfully."
    else
      redirect_to posts_path, alert: "Failed to save like."
    end
  end

  def update
    super
  end

  private

  def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end 