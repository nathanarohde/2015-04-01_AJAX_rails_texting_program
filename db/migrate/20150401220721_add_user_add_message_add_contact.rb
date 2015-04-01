class AddUserAddMessageAddContact < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :password
      t.string :password_confirmation

      t.timestamp
    end

    create_table :messages do |t|
      t.string :to
      t.string :from
      t.text :body
      t.string :status
      t.references :user

      t.timestamp
    end

    create_table :contacts do |t|
      t.string :name
      t.string :phone_number
      t.references :user

      t.timestamp
    end

  end
end
