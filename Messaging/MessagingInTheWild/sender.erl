-module(sender).

-export([send/2]).


send(Pid, Message) ->
	io:format("Sender sending message: ~p to: ~p~n", [Message, Pid]),
	spawn(fun() -> send_message(Pid, Message) end).   %% async so it doesn't block


send_message(Pid, Message) ->
	Pid ! {self(), Message}, %% Send the message and say who sent it
	receive %% Keep checking for a response - we don't care about anything else
		{From, Response} -> 
			io:format("Returned to sender: ~p from ~p~n", [Response, From])
	end.


