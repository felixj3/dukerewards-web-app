class InfoMailer < ApplicationMailer
    
    def new_reward_email
        @reward = params[:reward]
        @user = params[:user]
        mail(to: ENV['TO_EMAIL'], subject: "Receipt of Redemption")
        # mail(to: to_email, subject: "Receipt of Redemption")
    end
end