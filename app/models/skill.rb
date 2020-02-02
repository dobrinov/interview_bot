class Skill < ApplicationRecord
  class << self
    def all_options
      where(standartized: true).order(name: :asc).pluck :name, :id
    end

    def level_options
      [
        ['0 - I have no experience', 0],
        ['1', 1],
        ['2', 2],
        ['3', 3],
        ['4', 4],
        ['5', 5],
        ['6', 6],
        ['7', 7],
        ['8', 8],
        ['9', 9],
        ['10 - I know and can do everything', 10],
      ]
    end

    def number_of_projects_options
      [
        ['No experience', 'no experience'],
        ['1', '1'],
        ['2', '2'],
        ['3', '3'],
        ['4', '4'],
        ['5-10', '5-10'],
        ['10+', '10+'],
      ]
    end

    def total_experience_options
      [
        ['No experience', 'no experience'],
        ['less than a month', 'less than a month'],
        ['1-3 months', '1-3 months'],
        ['3-6 months', '3-6 months'],
        ['6-12 months', '6-12 months'],
        ['1-2 years', '1-2 years'],
        ['2-5 years', '2-5 years'],
        ['5+ years', '5+ years'],
      ]
    end
  end
end
