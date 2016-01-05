class CreateTables < ActiveRecord::Migration
  def change
    create_table :cohorts do |t|
      t.string :name
      t.timestamps null: false
    end
    create_table :activities do |t|
      t.string :day
      t.string :title
      t.timestamps null: false
    end
    create_table :quizzes do |t|
      t.string :day
      t.references :cohort
      t.timestamps null: false
    end
    create_table :questions do |t|
      t.text :question
      t.boolean :active, default: true
      t.references :activity
      t.timestamps null: false
    end
    create_table :question_quizzes do |t|
      t.references :question
      t.references :quiz
      t.timestamps null: false
    end
    create_table :options do |t|
      t.text :answer
      t.text :explanation
      t.boolean :correct
      t.references :question
      t.timestamps null: false
    end
    create_table :students do |t|
      t.string :github_username
      t.references :cohort
      t.timestamps null: false
    end
    create_table :submissions do |t|
      t.references :quiz
      t.references :student
      t.timestamps null: false
    end
    create_table :answers do |t|
      t.references :option
      t.references :submission
      t.timestamps null: false
    end
  end
end
