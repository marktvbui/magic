class CreateDeckCards < ActiveRecord::Migration[5.0]
  def change
    create_table :deck_cards do |t|
      t.integer :deckcard_id
      t.integer :card_id
      t.integer :deck_id
      t.timestamps
    end
  end
end
