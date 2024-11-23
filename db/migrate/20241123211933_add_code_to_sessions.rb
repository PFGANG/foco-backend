class AddCodeToSessions < ActiveRecord::Migration[7.0]
  def change
    add_column :sessions, :code, :string
    add_index :sessions, :code, unique: true
  end
end
