require 'net/http'
require "awesome_print"
require 'json'


mode = 'live'

if mode == 'sandbox'
	MY_PLAYER_KEY = 'fc2455f8-1879-4ad4-8012-1f337c2869f2'
	URL = 'http://no-limit-code-em.com/sandbox/players/'
elsif mode == 'live'
	MY_PLAYER_KEY = '864954a2-f469-409d-bb45-3241a1260aae'
	URL = "http://no-limit-code-em.com/api/players/"
end

def game_state(key)
  base_url = URL
  request_url =  base_url + key
  url = URI.parse(request_url)
  req = Net::HTTP::Get.new(url.path)
  res = Net::HTTP.start(url.host, url.port) {|http|
    http.request(req)
  }
  res.body
end


def turn?(turn_data)
 if turn_data["your_turn"]
 		puts "Your turn" 
 	  if turn_data["betting_phase"] == "deal" 
 	  	puts "Deal"
 	  	action = "bet" # TO BE FINISHED
 	  else turn_data["betting_phase"] == "post_draw"
 	  	action = "bet" # TO BE FINISHED
 	  	puts "bet"
 	  end
	end
end

def game_phase(turn_data)
  turn_data["betting_phase"]
end


def bet_amount(turn_data) # NOT DONE
  # Params is the amount you betting. Remember this is an absolute bet
  params = turn_data["minimum_bet"]
  
  if turn_data["betting_phase"] == "deal" || turn_data["betting_phase"] == "post_draw"

    # Action is always set to bet
    action = "bet"

    # Params is the amount you betting. Remember this is an absolute bet
    params = turn_data["minimum_bet"]

  # Check if you are supposed to replace	
  elsif turn_data["betting_phase"] == "draw"

    # Action is always set to replace
    action = "replace"

    # Sort through your cards and pick cards to replace
    discards = turn_data["hand"].first
  end
end

# def action(action, params, discards)
#   my_action = {:action_name => action, :amount => params, :cards => discards}
# end

def post_response(key, action)
	response_url = URL + key + '/action'
	url = URI.parse(response_url)
	postData = Net::HTTP.post_form(url, action)																				 
end


# response = game_state(MY_PLAYER_KEY)
# puts response
# turn?(response)


