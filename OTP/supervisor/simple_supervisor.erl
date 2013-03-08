-module(simple_supervisor).

-behaviour(supervisor).

%% API
-export([start_link/0]).

%% Callbacks
-export([init/1]).


start_link() ->
	supervisor:start_link(simple_supervisor, []).


init(_) ->
	io:format("Inside init~n"),
	ChildSpecs = 
	[
		{book_server, {book_server, start_link, []}, permanent, brutal_kill, worker, [book_server]}
	],
	{ok, {{one_for_one, 5, 60}, ChildSpecs}}.