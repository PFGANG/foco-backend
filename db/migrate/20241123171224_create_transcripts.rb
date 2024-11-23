class CreateTranscripts < ActiveRecord::Migration[7.0]
  def change
    create_table :transcripts, id: :uuid do |t|
      t.text :content
      t.references :session, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
