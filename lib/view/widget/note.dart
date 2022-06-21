import 'package:flutter/material.dart';

class Progress extends StatelessWidget {
  const Progress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        child: const Text(
          "In Progress",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ));
  }
}

note(context) {
  return showModalBottomSheet(
      context: context,
      builder: (context) => Container(
            padding: const EdgeInsets.all(8),
            height: 150,
            child: Column(
              children: const [
                Text(
                  "This part is not yet complete and is in progress\n\n",
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.red),
                ),
                Text(
                  "Soliman",
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      decorationStyle: TextDecorationStyle.wavy),
                ),
              ],
            ),
          ));
}
