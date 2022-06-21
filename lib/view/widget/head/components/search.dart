import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  Search({Key? key, this.width, this.fieldHeight, this.iconButtonheight})
      : super(key: key);
  String val = '';
  final double? width, fieldHeight, iconButtonheight;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 800),
          child: Row(
            children: [
              width! < 1101 ? const SizedBox() : const CategoriesDropDown(),
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(
                    enabled: true,
                    filled: true,
                    fillColor: Colors.white,
                    constraints: BoxConstraints(maxHeight: fieldHeight!),
                    focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(0)),
                      borderSide:
                          BorderSide(color: Color(0xFFffffff), width: 3),
                    ),
                    contentPadding: const EdgeInsets.only(bottom: 30),
                    enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(0)),
                      borderSide:
                          BorderSide(color: Color(0xFFffffff), width: 0),
                    ),
                  ),
                  onChanged: (value) {},
                ),
              ),
              Container(
                height: iconButtonheight,
                color: const Color(0xFFcedcde),
                child: IconButton(
                    padding: const EdgeInsets.all(0),
                    onPressed: () {},
                    icon: const Icon(Icons.search_outlined)),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CategoriesDropDown extends StatelessWidget {
  const CategoriesDropDown({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10),
      width: 118,
      decoration: const BoxDecoration(
          color: Color(0xFFcedcde),
          border: Border(
            right: BorderSide(color: Colors.black, width: 1.0),
          )),
      height: 40,
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          isExpanded: true,
          items: ["white", "blue", "red", "yellow"]
              .map(
                (v) => DropdownMenuItem(
                  child: Text(v),
                  value: v,
                ),
              )
              .toList(),
          hint: Text("defult"),
          onChanged: (val) {},
          dropdownColor: Colors.white,
          iconDisabledColor: Colors.white,
          iconEnabledColor: const Color(0xFF0a0a0a),
          iconSize: 30,
          icon: const Icon(
            Icons.arrow_drop_down_outlined,
          ),
          onTap: () {},
        ),
      ),
    );
  }
}
