import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gigabank/widgets/text_widget.dart';

class WideButton extends StatefulWidget {
  final Function()? onPressed;
  final String label;
  final Color? color;
  final double? height;
  final bool isLoading;
  final Color? textColor;
  final IconData? icon;
  final Color? iconColor;

  const WideButton({
    Key? key,
    required this.label,
    this.onPressed,
    this.icon,
    this.color,
    this.height,
    this.isLoading = false,
    this.iconColor,
    this.textColor,
  }) : super(key: key);

  @override
  State<WideButton> createState() => _WideButtonState();
}

class _WideButtonState extends State<WideButton> {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: widget.height,
      color: widget.color ?? Color(0xff5508ad),
      disabledColor:Color(0xfff3eaff),
      onPressed: widget.onPressed,
      padding: const EdgeInsets.symmetric(vertical: 15),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      child: Center(
        child: widget.isLoading
            ? Transform.scale(
                scale: .5,
                child: const CircularProgressIndicator(),
              )
            : Center(
                child: TextWidget(
                  text: widget.label,
                  color: widget.textColor ?? Colors.white,
                  fontsize: 14,
                  fontWeight: FontWeight.w700,
                 
                ),
              ),
      ),
    );
  }
}
