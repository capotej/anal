%% @author author <author@example.com>
%% @copyright YYYY author.

%% @doc Callbacks for the anal application.

-module(anal_app).
-author('author <author@example.com>').

-behaviour(application).
-export([start/2,stop/1]).


%% @spec start(_Type, _StartArgs) -> ServerRet
%% @doc application start callback for anal.
start(_Type, _StartArgs) ->
    anal_deps:ensure(),
    anal_sup:start_link().

%% @spec stop(_State) -> ServerRet
%% @doc application stop callback for anal.
stop(_State) ->
    ok.
