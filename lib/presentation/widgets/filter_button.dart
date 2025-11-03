import 'package:flutter/material.dart';

class FilterButton extends StatefulWidget {
  final List<String> options;
  final Color backgroundColor;
  final Color dropdownColor;
  final TextStyle textStyle;
  final String? hint;

  const FilterButton({
    super.key,
    required this.options,
    this.backgroundColor = Colors.white,
    this.dropdownColor = Colors.white,
    this.textStyle = const TextStyle(color: Colors.black),
    this.hint = "Select",
  });

  @override
  State<FilterButton> createState() => _FilterButtonState();
}

class _FilterButtonState extends State<FilterButton> {
  String? selectedOption;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 6),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade400),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(
          highlightColor: Colors.transparent,
          focusColor: Colors.transparent,
          splashColor: Colors.transparent,
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            value: selectedOption,
            hint: Text(widget.hint!, style: widget.textStyle),
            items: widget.options
                .map(
                  (option) => DropdownMenuItem(
                    value: option,
                    child: Text(option, style: widget.textStyle),
                  ),
                )
                .toList(),
            onChanged: (value) => setState(() => selectedOption = value),
            dropdownColor: widget.dropdownColor,
          ),
        ),
      ),
    );
  }
}
