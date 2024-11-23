class AddPartialsToTranscripts < ActiveRecord::Migration[7.0]
  def change
    add_column :transcripts, :partial, :boolean
  end
end
