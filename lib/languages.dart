library script.languages;

import "package:script/script.dart";
import "package:script/lisp.dart" as Lisp;

class LispScriptLanguage extends ScriptLanguage {
  final bool shared;
  final bool useStandardLibrary;
  final bool useNatives;

  Lisp.Environment _env;

  LispScriptLanguage({this.shared: false, this.useStandardLibrary: true, this.useNatives: true});

  @override
  evaluate(String input, Map<String, dynamic> context) {
    Lisp.Environment env;

    if (shared && _env != null) {
      env = _env.create();
    } else {
      env = new Lisp.Environment();

      if (useNatives) {
        Lisp.Natives.import(env);
      }

      if (useStandardLibrary) {
        Lisp.Standard.import(env);
      }

      if (shared) {
        _env = env;
      }
    }

    for (var x in context.keys) {
      var value = context[x];

      if (value != null && value is Function) {
        value = (env, args) {
          return Function.apply(context[x], args);
        };
      }

      env.define(new Lisp.Name(x), value);
    }

    var parser = new Lisp.LispParser();
    return Lisp.evalString(parser, env, input);
  }
}
