# Preview all emails at http://localhost:3000/rails/mailers/info_mailer
class InfoMailerPreview < ActionMailer::Preview
  def new_reward_email
    reward = Reward.new(name: "Macbook Pro", email: "joe@gmail.com")
    user = User.new(name: "Joe Mama")
    InfoMailer.with(reward: Reward.first, user: User.first).new_reward_email
  end
end