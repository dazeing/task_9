class CreateLogs < ActiveRecord::Migration[6.0]
  def change
    create_table :logs do |t|
      t.string :user_login
      t.string :type
      t.date :date
    end
  end
end
