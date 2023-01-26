import 'package:flutter/material.dart';

class CustomTextFieldWidget extends StatefulWidget {
  final String label;
  final String? defaultValue;
  final String? changedValue;
  final bool canEditable;
  final double fontSize;
  final double padding;
  final Function(String?)? onChangeText;

  const CustomTextFieldWidget({
    Key? key,
    required this.label,
    this.defaultValue,
    this.onChangeText,
    this.changedValue,
    this.canEditable = false,
    this.fontSize = 16,
    this.padding = 8,
  }) : super(key: key);

  @override
  State<CustomTextFieldWidget> createState() => _CustomTextFieldWidgetState();
}

class _CustomTextFieldWidgetState extends State<CustomTextFieldWidget> {
  bool isEditable = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: widget.padding),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: Colors.black,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        padding: EdgeInsets.all(widget.padding * 2 / 3),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.label,
              style: TextStyle(
                fontSize: widget.fontSize * 3 / 4,
                color: Colors.black,
                fontWeight: FontWeight.w700,
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: TextFormField(
                    initialValue: widget.defaultValue,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabled: false,
                    ),
                    maxLines: widget.defaultValue != null &&
                            widget.defaultValue!.length > widget.fontSize * 2
                        ? 2
                        : 1,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: widget.fontSize,
                      color: Colors.black,
                      letterSpacing: 0.84,
                      wordSpacing: 1.04,
                      decoration: isEditable && widget.canEditable
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
                  ),
                ),
                if (widget.canEditable) ...[
                  Checkbox(
                    value: isEditable,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(2.0),
                    ),
                    side: MaterialStateBorderSide.resolveWith(
                      (states) =>
                          const BorderSide(width: 1.0, color: Colors.black),
                    ),
                    onChanged: (value) {
                      setState(() {
                        isEditable = value == true;
                      });
                    },
                  ),
                ],
              ],
            ),
            Visibility(
              visible: widget.canEditable && isEditable,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: widget.padding * 2 / 3),
                    child: const Icon(
                      Icons.subdirectory_arrow_right_outlined,
                      color: Colors.black,
                    ),
                  ),
                  Expanded(
                    child: TextFormField(
                      initialValue: widget.changedValue,
                      maxLines: widget.changedValue != null &&
                              widget.changedValue!.length > widget.fontSize * 2
                          ? 2
                          : 1,
                      onChanged: widget.onChangeText,
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(
                            width: 2,
                            color: Colors.black,
                          ),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            width: 2,
                            color: Colors.black,
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            width: 2,
                            color: Colors.black,
                          ),
                        ),
                        enabled: true,
                      ),
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: widget.fontSize,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
