import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'user_data_variables.dart';
import 'home.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  final _ageController = TextEditingController();
  final _avgPeriodLengthController = TextEditingController();
  final _avgCycleLengthController = TextEditingController();
  DateTime? _lastPeriodDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFAF6F0), // Set background color to pinkAccent
      body: Padding(
        padding: EdgeInsets.fromLTRB(16, 100, 16, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // "Let's get you started!" text at the top
            Text(
              "Let's get you started!",
              style: TextStyle(
                fontFamily: 'PlayfairDisplay', // Set font family
                fontSize: 48, // Set font size
                color: Colors.brown, // Set font color to brown
              ),
            ),
            SizedBox(height: 32), // Add space between the text and the next input

            // Age Input
            TextField(
              controller: _ageController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Age",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),

            // Last Period Date Picker
            ListTile(
              title: Text(
                _lastPeriodDate == null
                    ? "Select Last Period Date"
                    : "Last Period Date: ${_lastPeriodDate!.toLocal()}".split(' ')[0],
              ),
              trailing: Icon(Icons.calendar_today),
              onTap: _selectDate,
            ),
            SizedBox(height: 16),

            // Average Period Length Input
            TextField(
              controller: _avgPeriodLengthController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Average Period Length (days)",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),

            // Average Cycle Length Input
            TextField(
              controller: _avgCycleLengthController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Average Cycle Length (days)",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 32),

            // Save Button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  _saveData(context);
                  // Navigate to Home after saving data
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => Home()),
                    );
                  });
                },
                child: Text("Save Information"),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> _selectDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _lastPeriodDate) {
      setState(() {
        _lastPeriodDate = picked;
      });
    }
  }

  void _saveData(BuildContext context) {
    if (_ageController.text.isNotEmpty &&
        _avgPeriodLengthController.text.isNotEmpty &&
        _avgCycleLengthController.text.isNotEmpty &&
        _lastPeriodDate != null) {
      // Store values in UserCycleData model
      Provider.of<UserDataVariables>(context, listen: false).updateData(
        int.parse(_ageController.text),
        _lastPeriodDate!,
        int.parse(_avgPeriodLengthController.text),
        int.parse(_avgCycleLengthController.text),
      );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Cycle information saved successfully!")),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please fill out all fields!")),
      );
    }
  }

  @override
  void dispose() {
    _ageController.dispose();
    _avgPeriodLengthController.dispose();
    _avgCycleLengthController.dispose();
    super.dispose();
  }
}
