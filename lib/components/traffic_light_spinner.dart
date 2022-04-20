import 'package:flutter/material.dart';

class TrafficLightSpinner extends StatefulWidget {
  const TrafficLightSpinner({Key? key}) : super(key: key);

  @override
  State<TrafficLightSpinner> createState() => _TrafficLightSpinnerState();
}

class _TrafficLightSpinnerState extends State<TrafficLightSpinner> {
  var _colorIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _startSpinner();
  }

  void _startSpinner() async {
    while (true) {
      await Future.delayed(const Duration(milliseconds: 600));
      _colorIndex = _colorIndex == 2 ? 0 : _colorIndex + 1;
      if (mounted) {
        setState(() {});
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final grey = Colors.grey.shade800;
    return SizedBox(
      width: 90,
      height: 150,
      child: Card(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CircleAvatar(
                backgroundColor: _colorIndex == 0 ? Colors.red : grey,
              ),
              CircleAvatar(
                backgroundColor: _colorIndex == 1 ? Colors.amber : grey,
              ),
              CircleAvatar(
                backgroundColor: _colorIndex == 2 ? Colors.green : grey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
