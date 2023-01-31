import 'package:flutter/material.dart';

class AuthTextFieldWidget extends StatefulWidget {
  final String label;
  final String? hint;
  final String? error;
  final Function(String?)? onChange;
  final bool isPassword;
  final bool isPhoneNumber;
  final bool isEnabled;
  final double fontSize;
  final double padding;
  const AuthTextFieldWidget({
    Key? key,
    required this.label,
    this.isEnabled = true,
    this.hint,
    this.error,
    this.isPassword = false,
    this.isPhoneNumber = false,
    this.onChange,
    this.fontSize = 16,
    this.padding = 8,
  }) : super(key: key);

  @override
  State<AuthTextFieldWidget> createState() => _AuthTextFieldWidgetState();
}

class _AuthTextFieldWidgetState extends State<AuthTextFieldWidget> {
  bool isShowPassword = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(widget.padding),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: Colors.black,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        padding: EdgeInsets.all(widget.padding),
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
            TextFormField(
              onChanged: widget.onChange,
              obscureText: isShowPassword,
              enableSuggestions: !isShowPassword,
              enabled: widget.isEnabled,
              keyboardType: widget.isPhoneNumber
                  ? TextInputType.phone
                  : TextInputType.text,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabled: widget.isEnabled,
                  hintText: widget.hint,
                  hintStyle: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: widget.fontSize,
                    color: Colors.grey,
                  ),
                  suffixIcon: widget.isPassword
                      ? IconButton(
                          onPressed: () {
                            setState(() {
                              isShowPassword = !isShowPassword;
                            });
                          },
                          icon: Icon(
                            isShowPassword
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                            color: Colors.black,
                          ))
                      : null),
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: widget.fontSize,
                color: Colors.black,
              ),
            ),
            if (widget.error != null) ...[
              Text(
                widget.error!,
                style: TextStyle(
                  fontSize: widget.fontSize * 7 / 8,
                  color: Colors.red,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ]
          ],
        ),
      ),
    );
  }
}
