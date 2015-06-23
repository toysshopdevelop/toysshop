class Notification < ActionMailer::Base
  default from: 'toysshop.develop@gmail.com'

  def order_notification
    mail(to: 'toysshop.develop@gmail.com', subject: t('notification.new'))
  end
end
