class CreateLevelType < ActiveRecord::Migration[6.0]
  def up
    execute <<-SQL
      CREATE TYPE level AS ENUM ('no experience',
                                 'theoretical',
                                 'beginner',
                                 'advanced',
                                 'expert');
    SQL
  end

  def down
    execute <<-SQL
      DROP TYPE level;
    SQL
  end
end
