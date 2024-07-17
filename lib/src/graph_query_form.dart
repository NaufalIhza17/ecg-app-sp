import 'package:flutter/material.dart';

class GraphQueryForm extends StatefulWidget {
  const GraphQueryForm({super.key});

  @override
  GraphQueryFormState createState() {
    return GraphQueryFormState();
  }
}

// Holds data related to the form
class GraphQueryFormState extends State<GraphQueryForm> {
  // Note: This is a 'GlobalKey<FormState>',
  // not a GlobalKey<GraphQueryFormState>.
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    String selectedValue = 'Gender';
    final TextTheme textStyle = Theme.of(context).textTheme;

    // Build a Form widget using the _formKey created above.
    return Center(
      child: SizedBox(
        width: 500,
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Start Datetime',
                style: textStyle.titleMedium,
              ),
              // Add TextFormFields and ElevatedButton
              // TODO: Change to datetime picker
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
              const SizedBox(
                height: 20,
              ),
              Text(
                'End Datetime',
                style: textStyle.titleMedium,
              ),
              // TODO: Change to datetime picker
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
              const SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.centerRight,
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
                  child: const Text('Get ECG signal'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
