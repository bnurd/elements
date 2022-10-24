import 'package:elements/models/element.dart';
import 'package:elements/widgets/element_card.dart';
import 'package:flutter/material.dart';

class ElementScreen extends StatelessWidget {
  ElementScreen({Key? key, required this.element}) : super(key: key);

  ElementModel element;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(element.name)),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElementCard(element: element),
            Text(element.extract),
            Text(element.source),
          ],
        ),
      ),
    );
  }
}
