class AddUserAddMessageAddContact < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :number
      t.string :email, null: false, default: ''
      t.string :encrypted_password, null: false, default: ''

      t.string :reset_password_token
      t.datetime :reset_password_sent_at

      t.datetime :remember_created_at

      t.integer :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.inet :current_sign_in_ip
      t.inet :last_sign_in_ip

      t.timestamp
    end

    add_index :users, :email, unique: true
    add_index :users, :reset_password_token, unique: true

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
      t.string :number
      t.references :user

      t.timestamp
    end

  end
end
