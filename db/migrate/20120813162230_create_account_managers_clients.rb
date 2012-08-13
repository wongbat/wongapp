class CreateAccountManagersClients < ActiveRecord::Migration
  def change
    create_table :account_managers_clients, :id => false do |t|
      t.integer :account_manager_id
      t.integer :client_id
    end
  end
end
    