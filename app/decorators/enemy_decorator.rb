class EnemyDecorator < ApplicationDecorator
  delegate_all
  
  def name
    object.name
  end

  def login
      object.login
  end

  def type
      object.type
  end
end
