module RestaurantsHelper
  def owner_checkbox_for(form, current_user)
    form.label(:owner, "Are you the owner?") +
    form.check_box(:owner, {}, current_user.id, "")
  end

  def owner_area(form, current_user)
    return owner_checkbox_for(form, current_user) unless current_user.nil?
    link_to("Sign in to claim ownership", user_session_path)
  end
end
