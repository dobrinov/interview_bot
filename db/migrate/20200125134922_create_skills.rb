class CreateSkills < ActiveRecord::Migration[6.0]
  def change
    create_table :skills do |t|
      t.string :name, null: false
      t.boolean :standartized, null: false, default: false
    end
  end
end
