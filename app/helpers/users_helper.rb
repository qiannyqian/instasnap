module UsersHelper
  def sign_in(user)
    cookies.signed[:id] = user.id
  end
end
