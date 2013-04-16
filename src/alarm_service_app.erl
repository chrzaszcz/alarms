%%%-------------------------------------------------------------------
%%% @author  Pawel Chrzaszcz
%%% @copyright (C) 2013, Erlang Solutions Ltd.
%%% @doc A simple system monitoring utility
%%%      for applications using mnesia.
%%%
%%% @end
%%% Created : 16 Apr 2013 by pawel.chrzaszcz@erlang-solutions.com
%%%-------------------------------------------------------------------
-module(alarm_service_app).

-behaviour(application).

%% Application callbacks
-export([start/2, stop/1]).

%% ===================================================================
%% Application callbacks
%% ===================================================================

start(_StartType, _StartArgs) ->
    alarm_service_sup:start_link().

stop(_State) ->
    ok.
