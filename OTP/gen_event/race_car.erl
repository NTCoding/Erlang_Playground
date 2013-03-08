-module(race_car).

-behaviour(gen_event).

-export([init/1, handle_event/2, handle_call/2, handle_info/2, code_change/3,
	terminate/2]).

init(Name) ->
	io:format("Car started up: ~p~n", [Name]),
	{ok, {name, Name}}.

handle_event(chequered_flag, {name, Name} = State) ->
	io:format("~p roars off the grid down to turn 1~n", [Name]),
	{ok, State}.

handle_call(_, State) ->
	{ok, ok, State}.

handle_info(_, State) ->
	{ok, State}.

code_change(_OldVsn, State, _Extra) ->
	{ok, State}.

terminate(_Reason, _State) ->
	ok.