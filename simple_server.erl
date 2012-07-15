-module(simple_server).

-export([start/0]).  %% public interface of server %%

%% Send messages to server using name of its process "simple_server" e.g simple_server ! "message"
start() -> 
	register(simple_server, spawn( fun() -> loop() end)).

loop() ->
       receive
       
	        "quit" ->  io:format("Quit command received. Closing down server");

		Msg    ->  io:format("Received message: ~p~n", [Msg]),
				    loop()																%% recursion keeps server alive and listening %%

	end.				
