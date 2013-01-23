-module(comprehensions).

-compile(export_all).


make_cars(Amount) ->
	Cars = [{car, "Car " ++ Number} || Number <- lists:seq(1, Amount)],
	io:format("Made cars: ~n~p~n", [Cars]).
