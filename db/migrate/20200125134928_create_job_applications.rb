class CreateJobApplications < ActiveRecord::Migration[6.0]
  def change
    create_table :job_applications do |t|
      t.references :role_description, foreign_key: {on_delete: :cascade}, index: true
      t.references :interviewee, foreign_key: {on_delete: :cascade}, index: true
      t.timestamps
    end
  end
end
