import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app_eyepax_practical/core/util/app_colors.dart';

import '../../../core/util/enums.dart';

///Created By Isuru B. Ranapana
/// 2022-05-29 00:29

class CommonAppTextField extends StatefulWidget {
  final TextEditingController controller;
  final Widget? icon;
  final Widget? prefixWidget;
  Widget? action;
  final String? hint;
  final String? label;
  final Color? labelColor;
  final Color? hintColor;
  final ValidationType validationType;

  // final bool isEditable;
  final bool isObscure;

  CommonAppTextField(
      {required this.controller,
      this.prefixWidget,
      this.label,
      this.icon,
      this.action,
      this.hint,
      this.labelColor,
      this.hintColor,
      // this.isEditable = false,
      this.isObscure = false,
      required this.validationType});

  @override
  State<CommonAppTextField> createState() => _CommonAppTextFieldState();
}

class _CommonAppTextFieldState extends State<CommonAppTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.label != null
            ? Wrap(
                children: [
                  const SizedBox(
                    width: 18,
                  ),
                  Text(
                    widget.label!,
                    style: TextStyle(
                        fontSize: 15,
                        color: widget.labelColor ?? AppColors.appColorBlack,
                        fontWeight: FontWeight.w700),
                  ),
                ],
              )
            : const SizedBox.shrink(),
        widget.label != null
            ? const SizedBox(
                height: 2,
              )
            : const SizedBox.shrink(),
        Stack(
          alignment: Alignment.topRight,
          children: [
            Container(
              height: 40.h,
              child: TextFormField(
                validator: (text) {
                  if (widget.validationType == ValidationType.EMAIL) {
                    if (text == null || text.isEmpty) {
                      return 'Email cannot be empty';
                    } else if (validateEmail(text)) {
                      return null;
                    } else {
                      return "Incorrect Email Address";
                    }
                  } else if (widget.validationType == ValidationType.NORMAL) {
                    if (text == null || text.isEmpty) {
                      return 'Field cannot be empty';
                    } else if (validateNormal(text)) {
                      return null;
                    } else {
                      return "Incorrect Input";
                    }
                  } else if (widget.validationType == ValidationType.PW) {
                    if (text == null || text.isEmpty) {
                      return 'Password cannot be empty';
                    } else if (validatePW(text)) {
                      return null;
                    } else {
                      return "Incorrect Password Format";
                    }
                  } else if (widget.validationType == ValidationType.MOBILE) {
                    if (text == null || text.isEmpty) {
                      return 'Mobile Number cannot be empty';
                    } else if (validateMobile(text)) {
                      return null;
                    } else {
                      return "Incorrect Mobile Number";
                    }
                  }
                  if (text == null || text.isEmpty || (text.length < 2)) {
                    return 'Text is empty';
                  }
                  return null;
                },
                controller: widget.controller,
                obscureText: widget.isObscure,
                textInputAction: TextInputAction.done,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
                decoration: InputDecoration(
                    prefix: widget.prefixWidget,
                    contentPadding: const EdgeInsets.all(16),
                    hintText: widget.hint,
                    counterText: "",
                    prefixIcon: widget.icon,
                    prefixIconConstraints: const BoxConstraints(
                      minWidth: 55,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100),
                      borderSide: const BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                        color: AppColors.colorSecondary,
                      ),
                    ),
                    suffixIcon: widget.action,
                    filled: true,
                    hintStyle: TextStyle(
                        color: widget.hintColor ?? AppColors.appGrayColor,
                        fontSize: 14),
                    fillColor: AppColors.appColorWhite),
              ),
            ),
          ],
        ),
      ],
    );
  }

  bool validateEmail(String value) {
    RegExp regex = new RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
    return (!regex.hasMatch(value)) ? false : true;
  }

  bool validateNormal(String text) {
    RegExp regex = new RegExp(r"^[0-9a-zA-Z].*");
    return (!regex.hasMatch(text)) ? false : true;
  }

  bool validatePW(String text) {
    RegExp regex = new RegExp(r'^[a-zA-Z0-9].*');
    return (!regex.hasMatch(text)) ? false : true;
  }

  bool validateMobile(String text) {
    RegExp regex = new RegExp(r'^(?:[+0]9)?[0-9]{10}$');
    return (!regex.hasMatch(text)) ? false : true;
  }
}
