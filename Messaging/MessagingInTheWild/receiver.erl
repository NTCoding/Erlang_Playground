-module(receiver).

-export([start/0]).


start() ->
	spawn(fun() -> wait_for_messages() end). %% Returns Pid of receiver - new process so it is  non-blocking (async)


wait_for_messages() ->
	receive
			
		{From, Message} ->
			io:format("Receiver received: ~p from: ~p~n", [Message, From]),
			io:format("Receiver returning to sender: You've got a fat bum~n"),
			From ! {self(), "You've got a fat bum"} %% so I like to tell my girlfriend

	end.
