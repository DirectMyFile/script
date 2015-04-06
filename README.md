# Script

Script is an interface for scripting with Dart. It's designed to be an interface between the embedder of the scripting 
system and the scripting implementation.

## Example

```dart
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
```
