class CreateSkillSelfEvaluationCategoryType < ActiveRecord::Migration[6.0]
  def up
    execute <<-SQL
      CREATE TYPE skill_self_evaluation_category AS ENUM ('required_by_role', 'additional');
    SQL
  end

  def down
    execute <<-SQL
      DROP TYPE skill_self_evaluation_category;
    SQL
  end
end
