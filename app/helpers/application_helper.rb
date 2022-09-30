module ApplicationHelper
  def flash_type(type)
    return 'danger' if type == 'alert'
    return 'danger' if type == 'error'
    return 'success' if type == 'notice'
  end

  def welcome_text
    str = ""
    str = str + "#{link_to raw("<i class='icon fa fa-sign-out'></i> Sign Out"),
                           logout_path, :method => :Delete}"
    str = str + "#{link_to raw("<i class='icon fa fa-user user'  style='min-height:44px'></i>
                                #{current_user.name.titleize}"), admin_path}"
  end

  def manage_menu
    current_user.nil? ? "normal" : "with-user-bar"
  end

  def tag_value(product)
    # text = product.is_promo? ? "Promo" : (product.is_best_seller? ? "Best Seller" : "")
    text = ""
    return "" if text.blank?
    return "<span class='tg-themetag tg-featuretag'>#{text}</span>"
  end

  def admin_menu_indicator(this_menu)
    return "active" if this_menu.include?(controller_name)
  end

  def msg_flash(flash)
    str = ""
    flash.each do |key, value|
      str += "<p class='#{key}'>#{value}</p><br />"
    end
    str+= "<br /><br />" unless flash.empty?
    return str
  end

  def short_desc(text, count)
    new_text_splited = text[0, count].split(" ")
    new_text_splited.pop(1) unless new_text_splited.count == 1
    return new_text_splited.join(" ")
  end
end
