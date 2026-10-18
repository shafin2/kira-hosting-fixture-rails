class CreateNotes < ActiveRecord::Migration[7.2]
  def change
    create_table :notes do |t|
      t.string :body, null: false
      t.timestamps
    end
  end
end
