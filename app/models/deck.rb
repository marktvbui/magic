# == Schema Information
#
# Table name: decks
#
#  id         :integer          not null, primary key
#  deck_id    :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Deck < ApplicationRecord

  belongs_to :user
  has_many :deck_cards

  def card
    return Card.find(card_id)
  end
  
  def self.sorted_by_type
    types = {
      "creature" => [], 
      "planeswalker" => [], 
      "artifact" => [], 
      "enchantment" => [], 
      "instant" => [], 
      "sorcery" => [], 
      "land" => [], 
    }
    all.each do |deckcard|
      current_card = deckcard.card
      types[deckcard.type[0]] << {card: deckcard, quantity: deckcard.quantity}
    end
    return types
  end
end
