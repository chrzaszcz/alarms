%%%-------------------------------------------------------------------
%%% @author Pawel Chrzaszcz
%%% @copyright (C) 2013, Erlang Solutions Ltd.
%%% @doc Alarm service utils
%%%
%%% @end
%%% Created : 8 May 2013 by pawel.chrzaszcz@erlang-solutions.com
%%%-------------------------------------------------------------------
-module(alarm_service_utils).

-export([alarm_types/0, get_cfg/1, set_cfg/2]).

-include("alarm_service.hrl").

get_cfg(Key) ->
    {ok, Val} = application:get_env(alarm_service, Key),
    Val.

set_cfg(Key, Val) ->
    application:set_env(alarm_service, Key, Val).

alarm_types() ->
    ?ALARM_TYPES.
