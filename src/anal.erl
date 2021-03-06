%% @author author <author@example.com>
%% @copyright YYYY author.

%% @doc TEMPLATE.

-module(anal).
-author('author <author@example.com>').
-export([start/0, stop/0]).

ensure_started(App) ->
    case application:start(App) of
        ok ->
            ok;
        {error, {already_started, App}} ->
            ok
    end.
        
%% @spec start() -> ok
%% @doc Start the anal server.
start() ->
    anal_deps:ensure(),
    ensure_started(crypto),
    application:start(anal).

%% @spec stop() -> ok
%% @doc Stop the anal server.
stop() ->
    Res = application:stop(anal),
    application:stop(crypto),
    Res.
