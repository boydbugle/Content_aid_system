class CreateAnswers < ActiveRecord::Migration[5.0]
  def change
    create_table :answers do |t|
      t.string :description
      t.text :code
      t.integer :question_id
      t.integer :user_id

      t.timestamps
    end
  end
end
