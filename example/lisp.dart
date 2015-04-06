import "package:script/script.dart";
import "package:script/languages.dart";

void main() {
  var evaluator = new ScriptEvaluator();

  evaluator.addScriptLanguage("lisp", new LispScriptLanguage());

  evaluator.evaluate("lisp", """
  (print "Hello World")
  """, {
    "x": 1
  });
}
