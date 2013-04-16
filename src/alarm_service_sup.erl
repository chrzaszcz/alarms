%%%-------------------------------------------------------------------
%%% @author  Pawel Chrzaszcz
%%% @copyright (C) 2013, Erlang Solutions Ltd.
%%% @doc Top level supervisor for alarm_service application.
%%%
%%% @end
%%% Created : 16 Apr 2013 by pawel.chrzaszcz@erlang-solutions.com
%%%-------------------------------------------------------------------
-module(alarm_service_sup).

-behaviour(supervisor).

-export([start_link/0]).
-export([init/1]).

start_link() ->
    supervisor:start_link(?MODULE, []).

init([]) ->
    {ok, {{one_for_one, 4, 1},
          [
           {alarm_service_server, {alarm_service_server, start_link, []},
            permanent, 5000, worker, [alarm_service_server]}
          ]}}.
