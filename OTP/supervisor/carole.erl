-module(carole).

%%-behaivour(gen_server).

%% API
-export([start/0, init/1]).

start() ->
	io:format("Starting link ~n"), 
	gen_server:start_link({local, ?MODULE}, ?MODULE, [], []) .

init(Message) ->
		Pid = spawn(fun() ->
					io:format("Carole starting up. She says: ~p~n", [Message]),
					loop(1)
				end),
		{ok, Pid}.


loop(5) ->
	io:format("Carole about to die~n"),
	exit(self(), kill);

loop(Number) ->
	io:format("Carole running ~n"),
	timer:sleep(2000),
	loop(Number + 1).

	


