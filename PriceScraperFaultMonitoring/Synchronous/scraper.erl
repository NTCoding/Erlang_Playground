-module(scraper).

-compile(export_all).


start() -> 
	scrape(1).

scrape(X) ->
	inets:start(),
	Url = "http://www.ebuyer.com/284697-b525-hd-webcam-usb-in-960-000842",
	{ok, {_, _, Body}} = httpc:request(get, {Url, []}, [], []),
	Price = parse_price_from(Body),
	io:format("Latest price of webcam is ~p~n", [Price]),
	case X > 20 of
		true -> exit("CPU is about to die");
		false -> scrape(X + 1)
	end.


parse_price_from(Html) ->
	{match, [{_, _}, {Start, _}]} = re:run(Html, "<span property=\"v:price\">(.*)</span>"),
	Price = string:substr(Html, Start + 1, 5).


	

