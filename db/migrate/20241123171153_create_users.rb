class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users, id: :uuid do |t|
      t.string :email
      t.string :name

      t.timestamps
    end
  end
end
