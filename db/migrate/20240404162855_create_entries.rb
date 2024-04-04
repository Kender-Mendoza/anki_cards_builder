# frozen_string_literal: true

class CreateEntries < ActiveRecord::Migration[7.0] # :nodoc:
  def change
    create_table :entries do |t|
      t.string :term
      t.string :audio_url

      t.timestamps
    end
  end
end
