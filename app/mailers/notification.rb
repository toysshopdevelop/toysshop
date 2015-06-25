class Notification < ActionMailer::Base
  default from: 'toysshop.develop@gmail.com'

  def order_notification(number)
    @number = number
    mail subject: t('notification.new') + ' ' + number.to_s,
         to: 'toysshop.develop@gmail.com',
         from: 'Toysshop@gmail.com'
  end
end
