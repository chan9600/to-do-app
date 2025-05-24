import 'package:flutter/material.dart';
import 'package:provider_todo_list/model.dart';

class ProviderPage extends ChangeNotifier {
  final List<Model> _contact = [];
  List<Model> get contacts => _contact;

  void add(Model model2) {
    contacts.add(model2);
    notifyListeners();
  }

  void removeContact(Model model1) {
    contacts.remove(model1);
    notifyListeners();
  }
}
