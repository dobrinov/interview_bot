class CreateNumberOfProjectsType < ActiveRecord::Migration[6.0]
  def up
    execute <<-SQL
      CREATE TYPE number_of_projects AS ENUM ('no experience',
                                              '1',
                                              '2',
                                              '3',
                                              '4',
                                              '5-10',
                                              '10+');
    SQL
  end

  def down
    execute <<-SQL
      DROP TYPE number_of_projects;
    SQL
  end
end
