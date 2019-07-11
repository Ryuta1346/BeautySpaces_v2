module ApplicationHelper
  def reservation(time)
    "#{time.strftime("%-m月%-d日 #{%w(日 月 火 水 木 金 土)[time.wday]}曜日 %H:%M ")}"
  end

  def operation(time)
    "#{time}分"
  end
end
