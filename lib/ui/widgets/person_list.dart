import 'package:flutter/material.dart';
import '../../data/models/person.dart';
import '../../viewmodel/person_viewmodel.dart';

class PersonList extends StatelessWidget {
  final PersonViewModel viewModel;

  const PersonList({required this.viewModel, super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Person>>(
      stream: viewModel.personStream,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }

        final persons = snapshot.data!;

        return ListView.builder(
          itemCount: persons.length,
          itemBuilder: (context, index) {
            final person = persons[index];
            return ListTile(
              title: Text(person.name),
              subtitle: Text('Age: ${person.age}'),
            );
          },
        );
      },
    );
  }
}
