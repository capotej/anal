{application, anal,
 [{description, "anal"},
  {vsn, "0.01"},
  {modules, [
    anal,
    anal_app,
    anal_sup,
    anal_web,
    anal_deps
  ]},
  {registered, []},
  {mod, {anal_app, []}},
  {env, []},
  {applications, [kernel, stdlib, crypto]}]}.
