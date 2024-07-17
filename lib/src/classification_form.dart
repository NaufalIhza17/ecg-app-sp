import 'package:flutter/material.dart';

class ClassificationForm extends StatefulWidget {
  const ClassificationForm({super.key});

  @override
  ClassificationFormState createState() {
    return ClassificationFormState();
  }
}

// Holds data related to the form
class ClassificationFormState extends State<ClassificationForm> {
  // Note: This is a 'GlobalKey<FormState>',
  // not a GlobalKey<ClassificationFormState>.
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    String selectedValue = 'Gender';
    final TextTheme textStyle = Theme.of(context).textTheme;

    // Build a Form widget using the _formKey created above.
    return SizedBox(
      width: 200,
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Classify this attribute',
              style: textStyle.titleMedium,
            ),
            // Add TextFormFields and ElevatedButton
            DropdownButtonFormField(
              value: selectedValue,
              hint: Text('Select an attribute'),
              onChanged: (String? value) {
                setState(() {
                  selectedValue = value is String ? value : 'Error';
                });
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              items: const [
                DropdownMenuItem(
                  value: 'Gender',
                  child: Text('Gender'),
                ),
                DropdownMenuItem(
                  value: 'Age_group',
                  child: Text('Age group'),
                ),
                DropdownMenuItem(
                  value: 'Health_status',
                  child: Text('Health status'),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: FilledButton.tonal(
                onPressed: () {
                  // Validate returns true if the form is valid, or false otherwise.
                  if (_formKey.currentState!.validate()) {
                    // If the form is valid, display a snackbar. In the real world,
                    // you'd often call a server or save the information in a database.
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Processing Data')),
                    );
                  }
                },
                child: const Text('Classify'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
