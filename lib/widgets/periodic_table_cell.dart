import 'package:elements/data/category.dart';
import 'package:elements/models/element.dart';
import 'package:elements/screens/element_screen.dart';
import 'package:flutter/material.dart';

typedef void GoToPage(ElementModel elementModel);

class PeriodicTableCell extends StatelessWidget {
  PeriodicTableCell({Key? key, this.element, required this.goToPage})
      : super(key: key);

  GoToPage goToPage;
  final ElementModel? element;

  @override
  Widget build(BuildContext context) {
    if (element == null) {
      return Container(
        child: Center(),
      );
    } else {
      return InkWell(
        onTap: () {
          goToPage(element!);
          
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) => ElementScreen(
                        element: element!,
                      )));
        },
        child: Container(
          color:
              element!.visible ? categories[element!.category] : Colors.white,
          child: Center(
              child: Text(
            element!.symbol,
            style: TextStyle(
                color: element!.visible ? Colors.white : Colors.black),
          )),
        ),
      );
    }
  }
}
