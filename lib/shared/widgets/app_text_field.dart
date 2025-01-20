import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/config/theme/context_theme.dart';
import '../utils/validators.dart';

class AppTextField extends StatefulWidget {
  const AppTextField({
    super.key,
    required this.controller,
    this.keyboardType,
    this.isOptional = false,
    this.readOnly = false,
    this.isOutlined = false,
    this.labelText,
    this.hintText,
    this.onTap,
    this.maxLines = 1,
    this.textColor,
    this.suffixIcon,
    this.fillColor,
    this.borderColor,
  });

  /// Controllers:
  final TextEditingController controller;

  /// Others:
  final TextInputType? keyboardType;
  final String? labelText;
  final String? hintText;
  final bool isOptional;
  final bool readOnly;
  final bool isOutlined;
  final Function? onTap;
  final int maxLines;
  final Color? textColor;
  final Widget? suffixIcon;
  final Color? fillColor;
  final Color? borderColor;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: widget.textColor ??
                    (widget.readOnly ? context.hintColor : null),
              ),
          onTap: () => widget.onTap?.call(),
          keyboardType: widget.keyboardType,
          controller: widget.controller,
          obscureText: widget.keyboardType == TextInputType.visiblePassword
              ? isObscure
              : false,
          onFieldSubmitted: (text) => _validate(text),
          validator: (text) => _validate(text),
          readOnly: widget.readOnly,
          maxLines: widget.maxLines,
          cursorColor: widget.textColor,
          decoration: InputDecoration(
              labelText: widget.labelText != null
                  ? widget.labelText! + (widget.isOptional ? "" : "*")
                  : null,
              labelStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: context.hintColor,
                  ),
              suffixIcon: widget.keyboardType == TextInputType.visiblePassword
                  ? IconButton(
                      padding: EdgeInsets.all(4.r),
                      constraints: const BoxConstraints(),
                      onPressed: () => setState(() => isObscure = !isObscure),
                      icon: Icon(
                        isObscure
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                        color: context.hintColor,
                      ),
                    )
                  : widget.suffixIcon,
              hintText: widget.hintText,
              hintStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: context.hintColor,
                  ),
              enabledBorder: widget.isOutlined ? buildOutlinedBorder() : null,
              border: widget.isOutlined ? buildOutlinedBorder() : null,
              focusedBorder: widget.isOutlined ? buildOutlinedBorder() : null,
              errorBorder: widget.isOutlined ? buildOutlinedBorder() : null,
              focusedErrorBorder:
                  widget.isOutlined ? buildOutlinedBorder() : null,
              fillColor: widget.fillColor,
              filled: widget.fillColor != null,
              contentPadding: EdgeInsets.symmetric(horizontal: 8.w)),
        )
      ],
    );
  }

  String? _validate(String? text) {
    /// Mandatory:
    if (!widget.isOptional && (text == null || text.isEmpty)) {
      return "${widget.labelText} ${"is_required".tr()}";
    }

    /// Data:
    if (widget.keyboardType != null) {
      switch (widget.keyboardType) {
        // Email
        case TextInputType.emailAddress:
          if (!Validators.isEmailValid(widget.controller.text)) {
            return "invalid_email".tr();
          }
        case TextInputType.visiblePassword:
          if (!Validators.isPasswordValid(widget.controller.text)) {
            return "invalid_password".tr();
          }
      }
    }
    return null;
  }

  InputBorder buildOutlinedBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(
        color: widget.borderColor ?? context.hintColor,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
