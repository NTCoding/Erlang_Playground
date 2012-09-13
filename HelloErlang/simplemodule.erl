-module(simplemodule). %% Name of module. Must match file name

-export([start/1]). %% public interface - list of function/arity


start(Message) ->
	io:format("~p~n", [Message]).
