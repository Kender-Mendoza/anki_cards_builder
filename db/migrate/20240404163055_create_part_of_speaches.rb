# frozen_string_literal: true

class CreatePartOfSpeaches < ActiveRecord::Migration[7.0] # :nodoc:
  def change
    create_table :part_of_speaches do |t|
      t.string :speach_type
      t.references :entry, null: false, foreign_key: true

      t.timestamps
    end
  end
end
