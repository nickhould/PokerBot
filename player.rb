require 'net/http'

# SB - Respond with a bet: fc2455f8-1879-4ad4-8012-1f337c2869f2
# SB - Replacement card: 728f53dd-a5dc-4582-8864-be37576b9592

MY_PLAYER_KEY =  

def dumb_poker_player(MY_PLAYER_KEY)

  # Infinite Loop
  while true 
    
    # Your client should sleep 1 second.
    # If you send too many requests at once, we will start throttling your requests.
    # This will cause you to reach the timeout limit which will cause your player to FOLD.
    sleep 1

    # GET request.
    # Ask the server "What is going on?"
    response = game_state(MY_PLAYER_KEY)

    # Parse the response so you can use the data.
    turn_data = JSON.parse(response.body)
    
    # Logic!!
    # This logic is boring. But, yours should be more epic!
    if turn_data["your_turn"]
    
      # Check if you are supposed to bet
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
  
    # Stores all your parameters in a single variable
    my_action = {:action_name => action, :amount => params, :cards => discards}
  
    # POST a request to the server
    response = player_action(MY_PLAYER_KEY, my_action)
  
    end
  end
end

# GET
def game_state(key)
  base_url = "fc2455f8-1879-4ad4-8012-1f337c2869f2"
  url = key + base_url
  url = URI.parse('http://www.example.com/index.html')
  req = Net::HTTP::Get.new(url.path)
  res = Net::HTTP.start(url.host, url.port) {|http|
    http.request(req)
  }
  res.body
end

# POST
def player_action(key, params)
  do a get request to http://no-limit-code-em.com/api/players/key/action
end


