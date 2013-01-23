-module(date_converter_tests).

-include_lib("eunit/include/eunit.hrl").

-compile(export_all).

number_1_is_monday_test() ->
	Day = date_converter:number_to_day(1),
	?assertEqual("Monday", Day).

number_2_is_tuesday_test() ->
	?assertEqual("Tuesday", date_converter:number_to_day(2)).

number_3_is_wednesday_test() ->
	?assertEqual("Wednesday", date_converter:number_to_day(3)).

number_4_is_thursday_test() ->
	?assertEqual("Thursday", date_converter:number_to_day(4)).

number_5_is_friday_test() ->
	?assertEqual("Friday", date_converter:number_to_day(5)).

number_6_is_saturday_test() ->
	?assertEqual("Saturday", date_converter:number_to_day(6)).

number_7_is_sunday_test() ->
	?assertEqual("Sunday", date_converter:number_to_day(7)).

number_0_throws_exception_test() ->
	?assertThrow(not_a_day, date_converter:number_to_day(0)).

numbers_greater_than_7_throw_exception_test() ->
	?assertThrow(not_a_day, date_converter:number_to_day(8)),
	?assertThrow(not_a_day, date_converter:number_to_day(55)),
	?assertThrow(not_a_day, date_converter:number_to_day(320)).
	


