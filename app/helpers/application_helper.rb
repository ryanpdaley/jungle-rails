module ApplicationHelper
  def authenticate_user
    if ! current_user
      redirect_to '/login'
    end
  end
end
