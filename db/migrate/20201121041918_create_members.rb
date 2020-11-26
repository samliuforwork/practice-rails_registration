class CreateMembers < ActiveRecord::Migration[6.0]
  def change
    create_table :members do |t|
      t.string :name
      t.string :password
      t.string :email
      t.string :account
      t.string :school
      t.datetime :create_at
      t.datetime :update_at

      t.timestamps
    end
  end
end
