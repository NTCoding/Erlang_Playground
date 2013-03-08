-module(race).

-export([setup/2, start/1]).


setup(Cars, Spectators) ->
	{ok, Manager} = gen_event:start_link(),
	lists:foreach(fun(Name) -> gen_event:add_handler(Manager, spectator, Name) end, Spectators),
	lists:foreach(fun(Name) -> gen_event:add_handler(Manager, race_car, Name) end, Cars),
	Manager.


start(Race) ->
	gen_event:notify(Race, chequered_flag),
	ok.