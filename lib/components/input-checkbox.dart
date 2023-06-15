import 'package:flutter/material.dart';
import '../variables/colors.dart';

class InputCheckBox extends StatefulWidget {
  InputCheckBox({
    super.key,
    this.value = false,
  });
  bool value;
  @override
  State<InputCheckBox> createState() => _InputCheckBoxState();
}

class _InputCheckBoxState extends State<InputCheckBox> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 15,
      height: 15,
      child: Checkbox(
          value: widget.value,
          onChanged: (value){
            setState(() {
              widget.value = !widget.value;
            });
          },
          checkColor: colorWhite,
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          fillColor: MaterialStatePropertyAll(colorTheme),
          side: BorderSide(width: 1, color: colorBorder),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5)
          )
      ),
    );
  }
}
