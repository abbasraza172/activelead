class UserMailer < ActionMailer::Base
  default from: "hasan.zia@engintechnologies.com"

  def list_subscription(user, list)
    @user = user
    @list = list
    @url  = list_url(list)
    mail(:to => user.email,
         :subject => "List Subscription")
  end

end