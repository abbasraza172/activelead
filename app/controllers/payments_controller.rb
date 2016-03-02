class PaymentsController < ApplicationController
  layout 'admin'
  before_action :require_login
  def index

    @payment = current_user.subscription.payments.last


  end
end
