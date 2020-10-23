class CreateRoleDescriptionsTechnologies < ActiveRecord::Migration[6.0]
  def change
    create_table :role_descriptions_technologies do |t|
      t.references :role_description, index: true, foreign_key: {on_delete: :cascade}
      t.references :technology, index: true, foreign_key: {on_delete: :cascade}
      t.timestamps
    end
  end
end
