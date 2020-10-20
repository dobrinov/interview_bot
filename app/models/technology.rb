class Technology < ApplicationRecord
  has_many :technology_self_evaluations
  has_many :self_evaluations, through: :technology_self_evaluations

  validates :name, presence: true, uniqueness: true

  default_scope { order(name: :asc) }

  class << self
    def all_options
      all.pluck :name, :id
    end

    def level_options
      [
        ['I have no experience', 0],
        ['1', 1],
        ['2', 2],
        ['3', 3],
        ['4', 4],
        ['5', 5],
        ['6', 6],
        ['7', 7],
        ['8', 8],
        ['9', 9],
        ['I know and can everything', 10],
      ]
    end

    def number_of_projects_options
      [
        ['I have no experience', 'no experience'],
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
        ['I have no experience', 'no experience'],
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
