class CreateJobApplications < ActiveRecord::Migration[6.0]
  def change
    create_table :job_applications do |t|
      t.references :role_description, foreign_key: true, index: true
      t.references :interviewee, foreign_key: true, index: true
    end
  end
end
