import 'package:flutter/material.dart';
import '../data/database/app_database.dart';
import '../data/models/person.dart';

class PersonViewModel extends ChangeNotifier {
  final AppDatabase _database;
  late final Stream<List<Person>> _personStream;

  PersonViewModel(this._database) {
    _personStream = _database.personDao.findAllPersons();
  }

  Stream<List<Person>> get personStream => _personStream;

  Future<void> addPerson(String name, int age) async {
    final person = Person(name: name, age: age);
    await _database.personDao.insertPerson(person);
    notifyListeners();
  }
}