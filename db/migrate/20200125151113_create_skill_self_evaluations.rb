class CreateSkillSelfEvaluations < ActiveRecord::Migration[6.0]
  def change
    create_table :skill_self_evaluations do |t|
      t.references :self_evaluation, index: true, foreign_key: true, null: false
      t.references :skill, index: true, foreign_key: true, null: false

      t.integer :level
      t.column :number_of_projects, :number_of_projects
      t.column :total_experience, :total_experience
    end
  end
end
