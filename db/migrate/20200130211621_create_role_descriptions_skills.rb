class CreateRoleDescriptionsSkills < ActiveRecord::Migration[6.0]
  def change
    create_table :role_descriptions_skills do |t|
      t.references :role_description, index: true, foreign_key: true
      t.references :skill, index: true, foreign_key: true
    end
  end
end
