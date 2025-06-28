import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ideasnconcepts/core/constants/colors.dart';
import 'package:ideasnconcepts/core/constants/styles.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.hintText,
    this.controller,
    this.validator,
    this.width,
    this.keyboardType,
    this.isDatePicker = false,
    this.onDateSelected,
    this.textCapitalization,
    this.inputFormatters,
    this.widget,
    this.onChanged,
  });
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final double? width;
  final TextInputType? keyboardType;
  final TextCapitalization? textCapitalization;
  final List<TextInputFormatter>? inputFormatters;
  final String? hintText;
  final Widget? widget;
  final bool isDatePicker;
  final Function(DateTime)? onDateSelected;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.sizeOf(context).width;
    final TextEditingController textController =
        controller ?? TextEditingController();

    return SizedBox(
      width: width != null ? w * width! : null,
      child: TextFormField(
        controller: textController,
        validator: validator,
        keyboardType: isDatePicker ? null : keyboardType,
        textCapitalization: textCapitalization ?? TextCapitalization.none,
        inputFormatters: inputFormatters,
        readOnly: isDatePicker,
        style: Styles.textStyle16(
          context,
        ).copyWith(color: kBlack, fontWeight: FontWeight.w600),
        decoration: InputDecoration(
          suffixIcon: widget,
          suffixIconConstraints: BoxConstraints(minWidth: w * 0.1),
          hintText: hintText,
          hintStyle: Styles.textStyle12(context).copyWith(color: kWarning),
          errorStyle: Styles.textStyle12(context).copyWith(color: kError),
          fillColor: kBeige,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide.none,
          ),
        ),
        onChanged: onChanged,
        onTap:
            isDatePicker
                ? () => _selectDate(context, textController, onDateSelected)
                : null,
      ),
    );
  }

  Future<void> _selectDate(
    BuildContext context,
    TextEditingController controller,
    Function(DateTime)? onDateSelected,
  ) async {
    final DateTime now = DateTime.now();

    final DateTime initialDate = DateTime(now.year - 10, now.month, now.day);

    final DateTime firstDate = DateTime(now.year - 120);

    final DateTime lastDate = DateTime(now.year - 10, now.month, now.day);

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: lastDate,
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: kBlack,
              onPrimary: kBeige,
              onSurface: kBlack,
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      String formattedDate =
          "${picked.day.toString().padLeft(2, '0')}/"
          "${picked.month.toString().padLeft(2, '0')}/"
          "${picked.year}";

      controller.text = formattedDate;

      if (onDateSelected != null) {
        onDateSelected(picked);
      }
    }
  }
}
