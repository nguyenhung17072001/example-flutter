import 'package:flutter/material.dart';

class AgentDropdownFormField extends StatefulWidget {
  const AgentDropdownFormField({super.key});

  @override
  State<AgentDropdownFormField> createState() => _AgentDropdownFormFieldState();
}

class _AgentDropdownFormFieldState extends State<AgentDropdownFormField> {
  String? _selectedOption;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            DropdownButtonFormField<String>(
              value: _selectedOption,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedOption = newValue;
                });
              },
              items: <String>['Option 1', 'Option 2', 'Option 3', 'Option 4']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              decoration: InputDecoration(
                labelText: 'Select an option',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Selected Option: $_selectedOption',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      
    );
  }
}