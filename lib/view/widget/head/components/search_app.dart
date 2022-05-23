import 'package:flutter/material.dart';

class SearchApp extends SearchDelegate {
  List colors = [
    'design',
    'software engineering',
    'data structures',
    'development',
    'instructors',
    'course',
    'learning'
  ];
  int i = 3;
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query;
          },
          icon: const Icon(Icons.search))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.close));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.green,
        child: Text(
          query,
          style: const TextStyle(
            fontSize: 30,
          ),
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List filter = colors
        .where((element) => element.startsWith(query.toLowerCase()))
        .toList();
    return Builder(builder: (context) {
      return ListView.builder(
          itemCount: query == "" ? colors.length : filter.length,
          itemBuilder: (context, i) {
            print(filter.length);
            return Container(
                alignment: Alignment.center,
                child: query == ""
                    ? const Text("")
                    : Container(
                        color: Colors.amber,
                        child: InkWell(
                          splashColor: Colors.red,
                          child: Text(
                            '${filter[i]}',
                            style: const TextStyle(fontSize: 25),
                          ),
                          onTap: () {
                            query = filter[i];
                            showResults(context);
                          },
                        ),
                      ));
          });
    });
  }
}
