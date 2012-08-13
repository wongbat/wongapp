class CreateCampaigns < ActiveRecord::Migration
  def change
    create_table :campaigns do |t|
      t.string :title
      t.string :type
      t.integer :client_id
      t.timestamps
    end
  end
end
