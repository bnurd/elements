import 'package:elements/data/category.dart';
import 'package:elements/models/element.dart';
import 'package:flutter/material.dart';

class ElementCard extends StatelessWidget {
  ElementCard({Key? key, required this.element}) : super(key: key);

  ElementModel element;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 250,
          padding: const EdgeInsets.all(18.0),
      decoration: BoxDecoration(
        color: categories[element.category],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(element.name),
              Text(element.category.split(' ').join("\n")),
            ],
          ),
          Text(element.symbol,style: TextStyle(fontSize: 50),),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(element.atomicWeight),
              Text(element.number.toString())
            ],
          ),
        ],
      ),
    );
  }
}
