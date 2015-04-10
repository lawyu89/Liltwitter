helpers do

  def current_user
    @current_user ||= User.find(session[:id]) if session[:id]
  end


# experimentation!
  # def pick_user_icon
  #   icons = ["star", "spoon", "trophy", "tree", "umbrella", "sun-o", "glass", "heart", "paw", "music", "fighter-jet", "bed", "book", "cloud", "anchor", "diamond", "bolt"]
  #   "fa fa-" + icons.sample
  # end
end
