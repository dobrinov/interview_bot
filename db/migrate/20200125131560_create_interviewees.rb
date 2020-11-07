class CreateInterviewees < ActiveRecord::Migration[6.0]
  def change
    create_table :interviewees do |t|
      t.string :name, null: false
      t.string :email, null: false

      t.timestamps
    end

    add_index :interviewees, :email, unique: true
  end
end
