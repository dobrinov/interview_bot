class CreateSelfEvaluations < ActiveRecord::Migration[6.0]
  def change
    create_table :self_evaluations do |t|
      t.references :job_application, foreign_key: {on_delete: :cascade}, index: true
      t.string :slug, null: false
      t.timestamp :submitted_at, null: true
      t.timestamps
    end
  end
end
