import 'dart:convert';

import 'package:elements/data/category.dart';
import 'package:elements/models/element.dart';
import 'package:elements/widgets/periodic_table_cell.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ElementsScreen extends StatefulWidget {
  const ElementsScreen({Key? key}) : super(key: key);

  @override
  State<ElementsScreen> createState() => _ElementsScreenState();
}

class _ElementsScreenState extends State<ElementsScreen> {
  bool loading = true;
  List<ElementModel?> elements = [];

  Future fetchDataFromJson() async {
    var data = await rootBundle.loadString('assets/elements.json');
    var jsonData = await json.decode(data);

    var elementsData = jsonData["elements"] as List;

    var result = elementsData
        .map((e) => e == null ? null : ElementModel.fromJson(e))
        .toList();

    setState(() {
      elements = result;
      loading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchDataFromJson();
  }

  Widget buildBottomSheet(BuildContext context) {
    return Container(
      child: ListView(children: [
        InkWell(
          onTap: () {
            setState(() {
              elements.forEach((element) {
                if (element != null) {
                  element.visible = true;
                }
              });
            });

            Navigator.pop(context);
          },
          child: Container(
            child: ListTile(
              title: Text("All Categories"),
            ),
          ),
        ),
        ...categories.keys
            .map(
              (e) => Column(
                children: [
                  InkWell(
                    onTap: () {
                      selectGroup(e);
                      Navigator.pop(context);
                    },
                    child: Container(
                      color: categories[e],
                      child: ListTile(
                        title: Text(e),
                      ),
                    ),
                  ),
                ],
              ),
            )
            .toList(),
      ]),
    );
  }

  void selectGroup(String category) {
    setState(() {
      elements.forEach((element) {
        if (element != null) {
          if (element.category == category) {
            element.visible = true;
          } else {
            element.visible = false;
          }
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: GridView.count(
              crossAxisCount: 10,
              scrollDirection: Axis.horizontal,
              children: elements
                  .map((e) => PeriodicTableCell(element: e, goToPage: (x) {}))
                  .toList(),
              mainAxisSpacing: 8.0,
              crossAxisSpacing: 8.0,
              padding: EdgeInsets.all(16.0),
            ),
          ),
          InkWell(
            onTap: () {
              showModalBottomSheet(
                  context: context, builder: (_) => buildBottomSheet(_));
            },
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 60,
              child: Center(
                  child: Text(
                "All Categories",
                style: TextStyle(fontSize: 20),
              )),
            ),
          )
        ],
      ),
    );
  }
}
