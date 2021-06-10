class CreateLivechats < ActiveRecord::Migration[6.0]
  def change
    create_table :livechats do |t|
      t.text :text
      # t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
