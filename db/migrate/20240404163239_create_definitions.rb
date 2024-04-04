# frozen_string_literal: true

class CreateDefinitions < ActiveRecord::Migration[7.0] # :nodoc:
  def change
    create_table :definitions do |t|
      t.string :explanation
      t.string :context
      t.references :part_of_speach, null: false, foreign_key: true

      t.timestamps
    end
  end
end
