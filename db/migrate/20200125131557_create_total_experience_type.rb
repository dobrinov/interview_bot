class CreateTotalExperienceType < ActiveRecord::Migration[6.0]
  def up
    execute <<-SQL
      CREATE TYPE total_experience AS ENUM ('no experience',
                                            'less than a month',
                                            '1-3 months',
                                            '3-6 months',
                                            '6-12 months',
                                            '1-2 years',
                                            '2-5 years',
                                            '5+ years');
    SQL
  end

  def down
    execute <<-SQL
      DROP TYPE total_experience;
    SQL
  end
end
