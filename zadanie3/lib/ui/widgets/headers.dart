import 'package:flutter/material.dart';
import 'package:projekt2/utils/utils.dart';

class Headers extends StatelessWidget {
  const Headers({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (var i in getHeaders())
          Container(
            color: const Color.fromARGB(
              255,
              216,
              216,
              216,
            ),
            height: 80,
            width: 100,
            child: Center(
              child: Text(
                i,
                textAlign: TextAlign.center,
              ),
            ),
          ),
      ],
    );
  }
}
