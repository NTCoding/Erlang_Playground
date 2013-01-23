-module(date_converter).

-export([number_to_day/1]).


number_to_day(1) -> "Monday";

number_to_day(2) -> "Tuesday";

number_to_day(3) -> "Wednesday";

number_to_day(4) -> "Thursday";

number_to_day(5) -> "Friday";

number_to_day(6) -> "Saturday";

number_to_day(7) -> "Sunday";

number_to_day(_) -> throw(not_a_day).

