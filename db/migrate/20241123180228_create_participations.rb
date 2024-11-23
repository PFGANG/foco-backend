class CreateParticipations < ActiveRecord::Migration[7.0]
  def change
    create_table :participations do |t|
      t.references :user, null: false, foreign_key: true, type: :uuid
      t.references :session, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
