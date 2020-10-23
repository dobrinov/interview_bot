class CreateRoleDescriptions < ActiveRecord::Migration[6.0]
  def change
    create_table :role_descriptions do |t|
      t.string :name, null: false
      t.references :company, index: true, foreign_key: {on_delete: :cascade}
      t.timestamps
    end
  end
end
