// lib/screens/screen2.dart
import 'package:flutter/material.dart';

class Screen2 extends StatefulWidget {
  const Screen2({super.key});

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  final _formKey = GlobalKey<FormState>(); // Key for Screen2's form
  String _phoneNumber = '';

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final String name = args['name'];
    final String email = args['email'];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey, // Associate the form with the key
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Name: $name', style: const TextStyle(fontSize: 18)),
              Text('Email: $email', style: const TextStyle(fontSize: 18)),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Phone Number'),
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your phone number';
                  }
                  if (value.length != 10) { // Example: Validate for 10 digits
                    return 'Phone number must be 10 digits';
                  }
                  _phoneNumber = value; // Store the valid phone number
                  return null;
                },
              ),
              const SizedBox(height: 20), // Add some spacing
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // All validation passed on Screen 2
                    // You can now proceed, e.g., submit the data
                    print("Name: $name, Email: $email, Phone: $_phoneNumber");
                    showDialog(context: context, builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text("Success"),
                        content: const Text("Information saved successfully"),
                        actions: [
                          TextButton(onPressed: (){Navigator.of(context).pop();}, child: const Text("OK"))
                        ],
                      );
                    });
                  }
                },
                child: const Text('Submit'), // Changed to "Submit" for clarity
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // Navigate back to Screen1
                },
                child: const Text('Back'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}