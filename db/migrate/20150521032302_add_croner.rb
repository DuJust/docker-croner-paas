class AddCroner < ActiveRecord::Migration
  def change
    create_table :croners do |t|
      t.string :image
      t.string :schedule

      t.timestamps null: false
    end
  end
end
