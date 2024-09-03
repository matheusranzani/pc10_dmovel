import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../viewmodel/person_viewmodel.dart';
import '../widgets/person_list.dart';

class HomeScreen extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<PersonViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Person List'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: _ageController,
              decoration: const InputDecoration(labelText: 'Age'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 32.0),
            ElevatedButton(
              onPressed: () {
                final name = _nameController.text;
                final age = int.tryParse(_ageController.text) ?? 0;
                viewModel.addPerson(name, age);
                _nameController.clear();
                _ageController.clear();
              },
              child: const Text('Add'),
            ),
            const SizedBox(height: 12.0),
            Expanded(
              child: PersonList(viewModel: viewModel),
            ),
          ],
        ),
      ),
    );
  }
}