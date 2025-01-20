import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/config/theme/context_theme.dart';
import '../utils/validators.dart';

class AuthTextField extends StatefulWidget {
  final String hint;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final Function(String?)? onSubmitted;
  final bool isOptional;

  const AuthTextField(
      {super.key,
      required this.hint,
      required this.controller,
      this.keyboardType,
      this.isOptional = false,
      this.onSubmitted});

  @override
  State<AuthTextField> createState() => _AuthTextFieldState();
}

class _AuthTextFieldState extends State<AuthTextField> {
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: TextFormField(
            controller: widget.controller,
            textInputAction: widget.onSubmitted != null
                ? TextInputAction.done
                : TextInputAction.next,
            onFieldSubmitted: widget.onSubmitted,
            keyboardType: widget.keyboardType,
            validator: _validate,
            obscureText: widget.keyboardType == TextInputType.visiblePassword
                ? isObscure
                : false,
            style: context.bodyMedium?.apply(color: context.onSecondary),
            decoration: InputDecoration(
              hintText: widget.hint,
              hintStyle: context.bodyMedium?.apply(color: context.hintColor),
              fillColor: context.surface,
              filled: true,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: context.surface),
                borderRadius: BorderRadius.circular(10),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: context.surface),
                borderRadius: BorderRadius.circular(10),
              ),
              errorBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: context.error),
                borderRadius: BorderRadius.circular(10),
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
                  : null,
            ),
          ),
        ),
      ],
    );
  }

  String? _validate(String? text) {
    /// Mandatory:
    if (!widget.isOptional && (text == null || text.isEmpty)) {
      return "${widget.hint} ${"is_required".tr()}";
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

  @override
  void dispose() {
    super.dispose();
  }
}
