require_relative 'basic_game.rb'
require_relative 'strategy.rb'

mode = 'live'
ap "Launching"
if mode == 'sandbox'
	puts "here"
	MY_PLAYER_KEY = '728f53dd-a5dc-4582-8864-be37576b9592'
	URL = 'http://no-limit-code-em.com/sandbox/players/'
elsif mode == 'live'
	MY_PLAYER_KEY = '71b60c9a-156e-4b60-9513-1feb00ea3958'
	URL = "http://no-limit-code-em.com/api/players/"
end

# while true
#   sleep 1
#   #check for errors
#   puts "I am running"
#   turn_data = game_state(MY_PLAYER_KEY)
#   ap turn_data
#   if turn?(turn_data)
#   	action = action(turn_data)
#   	res = post_response(MY_PLAYER_KEY, action)
#   	ap res.body
#   end
# end	


# TEST SHIT
while true
  sleep 1
  #check for errors
  puts "I am running"
  turn_data = game_state(MY_PLAYER_KEY)
  turn_data = JSON.parse(turn_data)
	ap turn_data  
	if turn?(turn_data)
  	action = action(turn_data)
  	res = post_response(MY_PLAYER_KEY, action)
   	ap res.body
  end
end	
