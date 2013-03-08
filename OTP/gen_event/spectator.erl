-module(spectator).

-behaviour(gen_event).

-export([init/1, handle_event/2, handle_call/2, handle_info/2, code_change/3,
terminate/2]).


init([Name|_]) ->
	io:format("'~p' is in the main grandstand waiting for the race to start~n", [Name]),
	{ok, {name, Name}}.


handle_event(chequered_flag, {name, Name}) ->
	io:format(" ~p goes wild as the cars accelerate past~n", [Name]),
	{ok, {name, Name}}.


handle_call(_, State) ->
	{ok, State}.


handle_info(_, State) ->
	{ok, State}.


code_change(_OldVsn, State, Extra) ->
	{ok, State}.


terminate(_Reason, _State) ->
	ok.