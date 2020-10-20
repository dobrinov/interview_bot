class CreateTechnologySelfEvaluations < ActiveRecord::Migration[6.0]
  def change
    create_table :technology_self_evaluations do |t|
      t.references :self_evaluation, index: true, foreign_key: true, null: false
      t.references :technology, index: true, foreign_key: true, null: false

      t.integer :level
      t.column :number_of_projects, :number_of_projects
      t.column :total_experience, :total_experience
    end

    add_index :technology_self_evaluations, %i(self_evaluation_id technology_id),
                                            unique: true,
                                            name: 'index_tech_self_eval_on_self_eval_id_and_tech_id'
  end
end
