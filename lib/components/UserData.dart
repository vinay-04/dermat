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

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: ListView(
          children: [
            TextFormField(
              decoration: InputDecoration(labelText: 'Name'),
              onSaved: (value) {
                _userData.name = value!;
              },
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Gender'),
              onSaved: (value) {
                _userData.gender = value!;
              },
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Age'),
              keyboardType: TextInputType.number,
              onSaved: (value) {
                _userData.age = int.parse(value!);
              },
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Living Place Climate'),
              onSaved: (value) {
                _userData.livingPlaceClimate = value!;
              },
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Temperature'),
              keyboardType: TextInputType.number,
              onSaved: (value) {
                _userData.temperature = double.parse(value!);
              },
            ),
            DropdownButtonFormField<Dryness>(
              decoration: InputDecoration(labelText: 'Dryness'),
              value: _userData.dryness,
              onChanged: (Dryness? newValue) {
                setState(() {
                  _userData.dryness = newValue!;
                });
              },
              items: Dryness.values.map((Dryness dryness) {
                return DropdownMenuItem<Dryness>(
                  value: dryness,
                  child: Text(dryness.toString().split('.').last),
                );
              }).toList(),
            ),
            DropdownButtonFormField<Humidity>(
              decoration: InputDecoration(labelText: 'Humidity'),
              value: _userData.humidity,
              onChanged: (Humidity? newValue) {
                setState(() {
                  _userData.humidity = newValue!;
                });
              },
              items: Humidity.values.map((Humidity humidity) {
                return DropdownMenuItem<Humidity>(
                  value: humidity,
                  child: Text(humidity.toString().split('.').last),
                );
              }).toList(),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Type of Occupation'),
              onSaved: (value) {
                _userData.typeOfOccupation = value!;
              },
            ),
            DropdownButtonFormField<HairType>(
              decoration: InputDecoration(labelText: 'Hair Type'),
              value: _userData.hairType,
              onChanged: (HairType? newValue) {
                setState(() {
                  _userData.hairType = newValue!;
                });
              },
              items: HairType.values.map((HairType hairType) {
                return DropdownMenuItem<HairType>(
                  value: hairType,
                  child: Text(hairType.toString().split('.').last),
                );
              }).toList(),
            ),
            DropdownButtonFormField<SkinType>(
              decoration: InputDecoration(labelText: 'Skin Type'),
              value: _userData.skinType,
              onChanged: (SkinType? newValue) {
                setState(() {
                  _userData.skinType = newValue!;
                });
              },
              items: SkinType.values.map((SkinType skinType) {
                return DropdownMenuItem<SkinType>(
                  value: skinType,
                  child: Text(skinType.toString().split('.').last),
                );
              }).toList(),
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Description'),
              onSaved: (value) {
                _userData.description = value!;
              },
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  Navigator.pop(context, _userData);
                }
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
