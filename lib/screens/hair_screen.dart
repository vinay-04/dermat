import 'package:dermat/components/HProducts.dart';
import 'package:dermat/components/hair/HairForm.dart';
import 'package:dermat/components/hair/hair_services.dart';
import 'package:dermat/screens/cart.Dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HairScreen extends StatefulWidget {
  HairScreen({super.key});

  @override
  State<HairScreen> createState() => _HairScreenState();
}

class _HairScreenState extends State<HairScreen> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double padding = size.width * 0.05;
    String name = '';
    String email = '';
    String gender = 'Male';

    return Scaffold(
      appBar: AppBar(
        title: const Text("Hair"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => CartPage(),
              ));
            },
            icon: const Icon(
              Icons.shopping_bag_outlined,
              size: 32,
            ),
          ),
          IconButton(
            icon: const Icon(
              Icons.account_circle,
              size: 36,
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/account');
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(padding),
                  color: const Color(0xFFFF6347),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 12.0),
                    child: Column(
                      children: [
                        Text(
                          "Hair growth is possible, you're in the right hands.",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: size.width * 0.045,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: size.height * 0.02),
                        Text(
                          "RIGHT TO GROW SALE",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: size.width * 0.06,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "FLAT 30% OFF",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: size.width * 0.05,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: size.height * 0.01),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.green,
                            backgroundColor: Colors.white,
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
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
                                      decoration:
                                          InputDecoration(labelText: 'Name'),
                                    ),
                                    SizedBox(height: 16),
                                    // TextField for Email
                                    TextField(
                                      onChanged: (value) => setState(() {
                                        email = value;
                                      }),
                                      decoration:
                                          InputDecoration(labelText: 'Email'),
                                    ),
                                    SizedBox(height: 16),

                                    // RadioButtons for Gender
                                    StatefulBuilder(
                                      builder: (BuildContext context,
                                          StateSetter setState) {
                                        return Row(
                                          children: [
                                            Text('Gender:'),
                                            SizedBox(width: 10),
                                            Radio<String>(
                                              value: 'Male',
                                              groupValue: gender,
                                              onChanged: (value) =>
                                                  setState(() {
                                                gender = value!;
                                              }),
                                            ),
                                            Text('Male'),
                                            Radio<String>(
                                              value: 'Female',
                                              groupValue: gender,
                                              onChanged: (value) =>
                                                  setState(() {
                                                gender = value!;
                                              }),
                                            ),
                                            Text('Female'),
                                          ],
                                        );
                                      },
                                    ),
                                    SizedBox(height: 16),

                                    // Submit button
                                    ElevatedButton(
                                      onPressed: () {
                                        // Process the form data here
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
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
                              fontSize: size.width * 0.04,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(height: size.height * 0.01),
                        Text(
                          "10th - 12th Aug",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: size.width * 0.04,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            HairServices(size: size, padding: padding),
            ProductScroll(),
          ],
        ),
      ),
    );
  }
}
