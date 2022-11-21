import 'package:flutter/material.dart';

class {{providerName.pascalCase()}} extends ChangeNotifier {
  {{#variableProvider}}
  {{variableType}}? _{{variableName.camelCase()}};

  {{variableType}}? get {{variableName.camelCase()}} => _{{variableName.camelCase()}};

  set {{variableName.camelCase()}}({{variableType}}? value) {
    _{{variableName.camelCase()}} = value;
    notifyListeners();
  }
  
  {{/variableProvider}}
}