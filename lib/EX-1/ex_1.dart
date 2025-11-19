import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  const CustomButton({super.key});

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      height: 100,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: isSelected ? Colors.blue[500]: Colors.blue[50],
        ),
        onPressed: () {
          setState(() {
            isSelected = !isSelected;
          });
        },
        child: Center(
          child: Text(
            isSelected ? "Selected"  : "Not Selected",
            
            style: isSelected ? const TextStyle(fontSize: 24, color: Colors.white) : const TextStyle(fontSize: 24, color: Colors.black),
          ),
        ),
      ),
    );
  }
}

void main() => runApp(MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Custom buttons"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              CustomButton(),
              SizedBox(height: 20),
              CustomButton(),
              SizedBox(height: 20),
              CustomButton(),
              SizedBox(height: 20),
              CustomButton(),
            ],
          )
          
        ),
      ),
    ));
