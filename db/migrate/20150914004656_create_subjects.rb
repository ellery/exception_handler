class CreateSubjects < ActiveRecord::Migration
  def change
    create_table :subjects do |t|
      t.string :subject
      t.string :from
      t.integer :priority
      t.string :to
      t.references :project, index: true

      t.timestamps
    end
  end
end
