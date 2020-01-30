class CreateCompaniesSkills < ActiveRecord::Migration[6.0]
  def change
    create_table :companies_skills do |t|
      t.references :company, null: false, foreign_key: true, index: true
      t.references :skill, null: false, foreign_key: true, index: true
    end
  end
end
