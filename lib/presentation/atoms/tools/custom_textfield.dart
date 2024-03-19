import 'package:flutter/material.dart';
import 'package:pmfrontend/presentation/pale_themes.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    this.width,
    this.height,
    required this.backgroundColor,
    required this.style,
    this.obscure = false,
    this.hint,
    this.hintStyle,
    this.clearOnSubmit = false,
    required this.init,
    required this.onChanged,
    this.onSubmitted,
  });

  final double? width;
  final double? height;
  final Color backgroundColor;
  final TextStyle style;
  final bool obscure;
  final String? hint;
  final TextStyle? hintStyle;
  final bool clearOnSubmit;
  final void Function(TextEditingController controller) init;
  final void Function(String value) onChanged;
  final void Function(String value)? onSubmitted;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  final _controller = TextEditingController();

  @override
  void initState() {
    widget.init(_controller);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        borderRadius: BorderRadius.circular(Radii.small),
      ),
      child: TextField(
        controller: _controller,
        onChanged: widget.onChanged,
        onSubmitted: (value) {
          if (widget.clearOnSubmit) _controller.clear();
          if (widget.onSubmitted != null) widget.onSubmitted!(value);
        },
        style: widget.style,
        cursorColor: widget.style.color,
        decoration: InputDecoration(
          hintText: widget.hint,
          hintStyle: widget.hintStyle,
          contentPadding: const EdgeInsets.symmetric(horizontal: Pad.small),
          border: InputBorder.none,
        ),
        obscureText: widget.obscure,
        enableSuggestions: !widget.obscure,
        autocorrect: !widget.obscure,
      ),
    );
  }
}
