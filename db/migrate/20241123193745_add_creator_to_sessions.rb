class AddCreatorToSessions < ActiveRecord::Migration[7.0]
  def change
    add_reference :sessions, :creator, foreign_key: { to_table: :users }, type: :uuid
  end
end
