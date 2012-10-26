require 'rubygems'
require 'ruby-poker'

# def action(action, params, discards)
#   my_action = {:action_name => action, :amount => params, :cards => discards}
# end

def turn?(turn_data)
  if turn_data["your_turn"]
    true
  end
end

def build_action(action_name, amount, cards)
  action = {"action_name" => action_name,
            "amount" => amount,
            "cards" => cards}

end

def action(turn_data)
  minimum = turn_data["minimum_bet"]
  maximum = turn_data["maximum_bet"]
  current = turn_data["current_bet"]
  bets = bet(turn_data)
	if turn_data["betting_phase"] == "deal"   
    action = "bet"
    cards = ""
    amount = minimum.to_i
    return_action = build_action(action, amount, cards)
  elsif turn_data["betting_phase"] == "draw" 
    action = "replace"
    cards = replace_cards(turn_data)
    return_action = build_action(action, amount, cards)
  elsif turn_data["betting_phase"] == "post_draw"
    action = "bet"
    amount = minimum.to_i
    cards = ""
    return_action = build_action(action, amount, cards)
  elsif turn_data["betting_phase"] == "showdown"
    ""
  end
end

def bet(turn_data)
  minimum = turn_data["minimum_bet"]
  maximum = turn_data["maximum_bet"]
  current = turn_data["current_bet"]
  bets = [:minimum => minimum, 
          :maximum => maximum, 
          :current => current]
end



def replace_cards(turn_data)
  # Sort through your cards and pick cards to replace
  first_card = turn_data["hand"].first
end



def hand(turn_data)
  hand =  turn_data["hand"]
  hand = hand.join(" ").to_s
  hand = PokerHand.new(hand)
  puts hand.rank
end



