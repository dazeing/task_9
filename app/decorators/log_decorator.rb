class LogDecorator < ApplicationDecorator
  delegate_all

  def user_login
    object.user_login
  end

  def user_type
    object.user_type
  end

  def date
    object.date
  end
end
