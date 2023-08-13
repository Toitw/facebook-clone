class UserMailer < ApplicationMailer
    default from: 'odinfacebook@juroga.com'

    def welcome_email
        @user = params[:user]
        @url = 'https://odin-facebook.herokuapp.com/users/sign_in'
        mail(to: @user.email, subject: 'Welcome to Odin Facebook')
    end
end
