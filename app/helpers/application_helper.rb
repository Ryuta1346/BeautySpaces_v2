module ApplicationHelper
  def reservation_time(time)
    "#{time.strftime("%-m月%-d日 #{%w(日 月 火 水 木 金 土)[time.wday]}曜日 %H:%M ")}"
  end

  def operation(time)
    "#{time}分"
  end

  def offer_price(price)
    "#{price} 円"
  end

  def customer_path(customer)
    return admin_salon_path if customer.class == Salon
    return admin_stylist_path if customer.class == Stylist
    return user_path if customer.class == User
  end
end
