module ApplicationHelper
  def bootstrap_class_for_flash(type)
    case type
      when 'notice' then "alert-info"
      when 'success' then "alert-success"
      when 'danger' then "alert-danger"
      when 'warning' then "alert-warning"
    end
  end
end
