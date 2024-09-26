import 'package:flutter/material.dart';

class Hairform extends StatefulWidget {
  @override
  _HairformState createState() => _HairformState();
}

class _HairformState extends State<Hairform> {
  String name = '';
  String email = '';
  String gender = 'Male';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Apply Now'),
      ),
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.green,
            backgroundColor: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (context) => Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // TextField for Name
                    TextField(
                      onChanged: (value) => setState(() {
                        name = value;
                      }),
                      decoration: InputDecoration(labelText: 'Name'),
                    ),
                    SizedBox(height: 16),

                    // TextField for Email
                    TextField(
                      onChanged: (value) => setState(() {
                        email = value;
                      }),
                      decoration: InputDecoration(labelText: 'Email'),
                    ),
                    SizedBox(height: 16),

                    // RadioButtons for Gender
                    Row(
                      children: [
                        Text('Gender:'),
                        SizedBox(width: 10),
                        Radio<String>(
                          value: 'Male',
                          groupValue: gender,
                          onChanged: (value) => setState(() {
                            gender = value!;
                          }),
                        ),
                        Text('Male'),
                        Radio<String>(
                          value: 'Female',
                          groupValue: gender,
                          onChanged: (value) => setState(() {
                            gender = value!;
                          }),
                        ),
                        Text('Female'),
                      ],
                    ),
                    SizedBox(height: 16),

                    // Submit button
                    ElevatedButton(
                      onPressed: () {
                        // Process the form data here
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Submitted: $name, $email, $gender',
                            ),
                          ),
                        );
                      },
                      child: Text('Submit'),
                    ),
                  ],
                ),
              ),
            );
          },
          child: Text(
            "Apply Now",
            style: TextStyle(
              color: Colors.green,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
