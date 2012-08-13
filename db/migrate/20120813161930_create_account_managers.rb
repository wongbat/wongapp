class CreateAccountManagers < ActiveRecord::Migration
  def change
    create_table :account_managers do |t|
      t.string :name
      t.string :surname
      t.string :email
      t.timestamps
    end
  end
end
      