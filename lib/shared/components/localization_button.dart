import 'package:flutter/material.dart';
import 'package:queen/queen.dart';

class LocalizationButton extends StatefulWidget {
  const LocalizationButton({Key? key}) : super(key: key);

  @override
  _LocalizationButtonState createState() => _LocalizationButtonState();
}

class _LocalizationButtonState extends State<LocalizationButton> {
  String selected = 'en';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6,vertical: 12),
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          color: Color(0xff27173a),
        ),
        constraints: const BoxConstraints(
          maxHeight: 20,
        ),
        height: 20,
        child: Center(
          child: DropdownButton<String>(
            iconSize: 10,
            value: selected,
            items: Lang.supportedLocales
                .map(
                  (e) => DropdownMenuItem<String>(
                    child: Text(e.languageCode,),
                    value: e.languageCode,
                  ),
                )
                .toList(),
            onChanged: (String? value) {
              if(value == null) return;
              selected = value;
              Lang.update(Locale(selected));
              setState(() {});
            },
          ),
        ),
      ),
    );
  }
}
