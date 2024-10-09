import 'package:flutter/material.dart';
import 'package:dermat/model/UserDataModel.dart';

class UserDataBottomSheet extends StatefulWidget {
  @override
  _UserDataBottomSheetState createState() => _UserDataBottomSheetState();
}

class _UserDataBottomSheetState extends State<UserDataBottomSheet> {
  final _formKey = GlobalKey<FormState>();
  final _userData = UserDataModel(
    name: '',
    gender: '',
    age: 0,
    livingPlaceClimate: '',
    temperature: 0.0,
    dryness: Dryness.low,
    humidity: Humidity.low,
    typeOfOccupation: '',
    hairType: HairType.straight,
    skinType: SkinType.dry,
    description: '',
  );

  final primaryColor = Color(0xFFFF6347);
  final secondaryColor = Color(0xFFFFA07A);
  final backgroundColor = Color(0xFFFFF0E6);

  InputDecoration _inputDecoration(String label) {
    return InputDecoration(
      labelText: label,
      labelStyle: TextStyle(color: primaryColor),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: primaryColor, width: 2.0),
        borderRadius: BorderRadius.circular(10.0),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: secondaryColor, width: 1.0),
        borderRadius: BorderRadius.circular(10.0),
      ),
      filled: true,
      fillColor: Colors.white,
    );
  }

  @override
  Widget build(BuildContext context) {
    final viewInsets = MediaQuery.of(context).viewInsets;

    return Container(
      padding: EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
      ),
      child: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: viewInsets.bottom),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Text(
                'User Data',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: primaryColor,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: _inputDecoration('Name'),
                onSaved: (value) => _userData.name = value!,
              ),
              SizedBox(height: 16),
              TextFormField(
                decoration: _inputDecoration('Gender'),
                onSaved: (value) => _userData.gender = value!,
              ),
              SizedBox(height: 16),
              TextFormField(
                decoration: _inputDecoration('Age'),
                keyboardType: TextInputType.number,
                onSaved: (value) => _userData.age = int.parse(value!),
              ),
              SizedBox(height: 16),
              TextFormField(
                decoration: _inputDecoration('Living Place Climate'),
                onSaved: (value) => _userData.livingPlaceClimate = value!,
              ),
              SizedBox(height: 16),
              TextFormField(
                decoration: _inputDecoration('Temperature'),
                keyboardType: TextInputType.number,
                onSaved: (value) =>
                    _userData.temperature = double.parse(value!),
              ),
              SizedBox(height: 16),
              DropdownButtonFormField<Dryness>(
                decoration: _inputDecoration('Dryness'),
                value: _userData.dryness,
                onChanged: (Dryness? newValue) {
                  setState(() => _userData.dryness = newValue!);
                },
                items: Dryness.values.map((Dryness dryness) {
                  return DropdownMenuItem<Dryness>(
                    value: dryness,
                    child: Text(dryness.toString().split('.').last),
                  );
                }).toList(),
              ),
              SizedBox(height: 16),
              DropdownButtonFormField<Humidity>(
                decoration: _inputDecoration('Humidity'),
                value: _userData.humidity,
                onChanged: (Humidity? newValue) {
                  setState(() => _userData.humidity = newValue!);
                },
                items: Humidity.values.map((Humidity humidity) {
                  return DropdownMenuItem<Humidity>(
                    value: humidity,
                    child: Text(humidity.toString().split('.').last),
                  );
                }).toList(),
              ),
              SizedBox(height: 16),
              TextFormField(
                decoration: _inputDecoration('Type of Occupation'),
                onSaved: (value) => _userData.typeOfOccupation = value!,
              ),
              SizedBox(height: 16),
              DropdownButtonFormField<HairType>(
                decoration: _inputDecoration('Hair Type'),
                value: _userData.hairType,
                onChanged: (HairType? newValue) {
                  setState(() => _userData.hairType = newValue!);
                },
                items: HairType.values.map((HairType hairType) {
                  return DropdownMenuItem<HairType>(
                    value: hairType,
                    child: Text(hairType.toString().split('.').last),
                  );
                }).toList(),
              ),
              SizedBox(height: 16),
              DropdownButtonFormField<SkinType>(
                decoration: _inputDecoration('Skin Type'),
                value: _userData.skinType,
                onChanged: (SkinType? newValue) {
                  setState(() => _userData.skinType = newValue!);
                },
                items: SkinType.values.map((SkinType skinType) {
                  return DropdownMenuItem<SkinType>(
                    value: skinType,
                    child: Text(skinType.toString().split('.').last),
                  );
                }).toList(),
              ),
              SizedBox(height: 16),
              TextFormField(
                decoration: _inputDecoration('Description'),
                maxLines: 3,
                onSaved: (value) => _userData.description = value!,
              ),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    Navigator.pop(context, _userData);
                  }
                },
                child: Text('Submit'),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: primaryColor,
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
