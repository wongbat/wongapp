class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.integer :account_manager_id
      t.integer :client_id
    end
  end
end
    