%%%-------------------------------------------------------------------
%%% @author  Pawel Chrzaszcz
%%% @copyright (C) 2013, Erlang Solutions Ltd.
%%% @doc A simple system monitoring utility
%%%      for applications using mnesia.
%%%
%%% @end
%%% Created : 16 Apr 2013 by pawel.chrzaszcz@erlang-solutions.com
%%%-------------------------------------------------------------------
-module(alarms_app).

-behaviour(application).

%% Application callbacks
-export([start/2, stop/1]).

%% ===================================================================
%% Application callbacks
%% ===================================================================

start(_StartType, _StartArgs) ->
    {ok, Pid} = alarms_sup:start_link(),
    ok = alarms_basic_handler:swap_handler(),
    [ok = H:add_handler() || H <- alarms_utils:get_cfg(extra_handlers)],
    {ok, Pid}.

stop(_State) ->
    [gen_event:delete_handler(alarm_handler, H, [])
     || H <- gen_event:which_handlers(alarm_handler)],
    gen_event:add_handler(alarm_handler, alarm_handler, []).
