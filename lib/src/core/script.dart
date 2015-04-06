part of script;

/// The Script Evaluator is the main class of the script package.
/// It has all the utilities necessary to get started.
class ScriptEvaluator {
  Map<String, ScriptLanguage> _languages = {};
  Map<String, ScriptLanguage> get languages =>
    new UnmodifiableMapView<String, ScriptLanguage>(_languages);

  /// Adds a Scripting Language
  void addScriptLanguage(String name, ScriptLanguage language) {
    _languages[name] = language;
  }

  /// Evaluates Scripts
  dynamic evaluate(String languageName, String script, [Map<String, dynamic> context]) {
    if (context == null) {
      context = {};
    }

    if (!_languages.containsKey(languageName)) {
      throw new ArgumentError.value(languageName, "languageName", "Unknown Language");
    }

    return _languages[languageName].evaluate(script, context);
  }

  /// Removes a Scripting Language
  void removeScriptLanguage(String name) {
    _languages.remove(name);
  }
}

/// Base Class for Implementations of Languages
abstract class ScriptLanguage {
  dynamic evaluate(String input, Map<String, dynamic> context);
}
