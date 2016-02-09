class OrderMailer < ApplicationMailer
  EMAIL = 'luxparfum.by@yandex.ru'

  def new_order(order)
    @order = order
    mail(to: EMAIL, subject: 'Новый заказ')
  end
end
