module ApplicationHelper
  def active_class(my_controller)
    :active if controller.controller_name.to_s == my_controller.to_s
  end

  def active_category(id)
    :active if params[:id].to_s == id.to_s
  end
end
