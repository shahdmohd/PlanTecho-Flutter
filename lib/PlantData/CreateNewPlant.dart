import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreateNewPlant extends StatefulWidget {
  @override
  _CreateNewPlantState createState() => _CreateNewPlantState();
}

class _CreateNewPlantState extends State<CreateNewPlant> {
  final TextEditingController _nameController = TextEditingController();
  int _temperature = 0;
  int _humidity = 0;
  int _water = 0;
  String? _selectedState;
  
  final List<String> _states = ['Dry', 'Optimal', 'Wet'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add New Plant',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTextField('Name', _nameController),
            _buildNumberPicker('Temperature', _temperature, (value) {
              setState(() => _temperature = value);
            }),
            _buildNumberPicker('Humidity', _humidity, (value) {
              setState(() => _humidity = value);
            }),
            _buildNumberPicker('Water', _water, (value) {
              setState(() => _water = value);
            }),
            _buildDropdownField('State', _states, _selectedState, (value) {
              setState(() => _selectedState = value);
            }),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildButton('Save', Colors.green, () {
                  // Handle save action
                }),
                _buildButton('Cancel', Colors.brown, () {
                  Navigator.pop(context);
                }),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(height: 5),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: label,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            filled: true,
            fillColor: Colors.green.shade50,
          ),
        ),
        SizedBox(height: 10),
      ],
    );
  }

  Widget _buildNumberPicker(String label, int value, Function(int) onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(height: 5),
        Container(
          height: 100,
          child: CupertinoPicker(
            scrollController: FixedExtentScrollController(initialItem: value),
            itemExtent: 40,
            onSelectedItemChanged: onChanged,
            children: List.generate(101, (index) => Text('$index')),
          ),
        ),
        SizedBox(height: 10),
      ],
    );
  }

  Widget _buildDropdownField(String label, List<String> options, String? selectedValue, Function(String?) onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
        SizedBox(height: 5),
        DropdownButtonFormField<String>(
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            filled: true,
            fillColor: Colors.green.shade50,
          ),
          value: selectedValue,
          items: options.map((option) {
            return DropdownMenuItem(value: option, child: Text(option));
          }).toList(),
          onChanged: onChanged,
        ),
        SizedBox(height: 10),
      ],
    );
  }

  Widget _buildButton(String text, Color color, VoidCallback onPressed) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      ),
      onPressed: onPressed,
      child: Text(text, style: TextStyle(color: Colors.white)),
    );
  }
}
