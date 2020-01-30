class CreateSelfEvaluations < ActiveRecord::Migration[6.0]
  def change
    create_table :self_evaluations do |t|
      t.references :interviewee, foreign_key: true, index: true, null: false
      t.timestamp :submitted_at, null: true
    end
  end
end
