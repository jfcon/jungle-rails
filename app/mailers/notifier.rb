class Notifier < ApplicationMailer
    default from: 'no-reply@jungle.com'

    def order_confirm_email(user, order)
        @user = user
        @order = order
        mail(to: @user.email, subject: "Order ##{order.id} confirmation with Jungle")
    end

end
