%%%-------------------------------------------------------------------
%%% @author Pawel Chrzaszcz
%%% @copyright (C) 2013, Erlang Solutions Ltd.
%%% @doc Macros used by alarms
%%%
%%% @end
%%% Created : 8 May 2013 by pawel.chrzaszcz@erlang-solutions.com
%%%-------------------------------------------------------------------

-define(EVENT_MANAGER, alarm_handler).

-define(ALARM_TYPES,
        [long_gc,
         large_heap,
         busy_port,
         busy_dist_port,
         mnesia_overload,
         inconsistent_database,
         mnesia_fatal,
         mnesia_error,
         nodeup,
         nodedown
        ]).
