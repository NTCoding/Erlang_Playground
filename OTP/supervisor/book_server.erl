-module(book_server).

-behaviour(gen_server).

-export([start_link/0]).
-export([kill_me/0]).
-export([init/1, handle_call/3, terminate/2]).

start_link() ->
    gen_server:start_link({local, book_server}, book_server, [], []).

kill_me() ->
    gen_server:call(book_server, kill).

init(_Args) ->
	process_flag(trap_exit, true),
	io:format("book server starting up~n"),
	{ok, []}.

handle_call(kill, _From, State) ->
    erlang:raise(exit, "Boom!", []),
    {reply, [], State}.

 terminate(_, State) ->
 	io:format("Book server terminated~n"),
 	ok.



