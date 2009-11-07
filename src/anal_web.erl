%% @author author <author@example.com>
%% @copyright YYYY author.

%% @doc Web server for anal.

-module(anal_web).
-author('author <author@example.com>').

-export([start/1, stop/0, loop/2]).

%% External API

start(Options) ->
    {DocRoot, Options1} = get_option(docroot, Options),
    Loop = fun (Req) ->
                   ?MODULE:loop(Req, DocRoot)
           end,
    mochiweb_http:start([{name, ?MODULE}, {loop, Loop} | Options1]).

stop() ->
    mochiweb_http:stop(?MODULE).

loop(Req, DocRoot) ->
    Path = Req:get(raw_path),
    Method = Req:get(method),
    case Method of
	'GET' ->
	    Str = io_lib:format("page is ~p", [Path]);
	'POST' ->
	    Str = io_lib:format("post is ~p", [Path])
    end,
    ok(Req, Str).



ok(Req, Response) ->
    Req:ok({_ContentType = "text/plain",
            _Headers = [],
            Response}).


%% Internal API

get_option(Option, Options) ->
    {proplists:get_value(Option, Options), proplists:delete(Option, Options)}.
