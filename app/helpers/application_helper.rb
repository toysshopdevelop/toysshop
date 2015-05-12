module ApplicationHelper
  def active_class(my_controller)
    :active if controller.controller_name.to_s == my_controller.to_s
  end
end
