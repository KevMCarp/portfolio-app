import 'package:flutter/material.dart';
import 'package:service_status/components/traffic_light_spinner.dart';

Future<void> showCarSeachDialog(
    BuildContext context, String registration) async {
  return await showDialog(
    context: context,
    builder: (_) => const CarSearchDialog(),
  );
}

class CarSearchDialog extends StatelessWidget {
  const CarSearchDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      alignment: Alignment.center,
      children: const [
        Center(child: TrafficLightSpinner()),
        SizedBox(height: 5),
        Text(
          'Looking for vehicle information..',
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class SearchSpinner extends StatelessWidget {
  const SearchSpinner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: SizedBox(
          width: 200,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Center(child: TrafficLightSpinner()),
              SizedBox(height: 5),
              Text(
                'Looking for vehicle information..',
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
