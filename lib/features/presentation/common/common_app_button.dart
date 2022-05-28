import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app_eyepax_practical/core/util/app_colors.dart';
import 'package:news_app_eyepax_practical/core/util/enums.dart';

///Created By Isuru B. Ranapana
/// 2022-05-28 18:52

class AppButton extends StatefulWidget {
  final String buttonText;
  final Function onTapButton;
  final double width;
  final ButtonStatus buttonStatus;
  final ButtonType buttonType;
  final Widget? prefixIcon;
  final bool enableBorder;
  final Color buttonColor;
  final Color textColor;
  final double textLeftPadding;
  final double textRightPadding;
  final double fontSize;
  final bool isTextPadding;
  final bool isTextBold;


  AppButton(
      {
        required this.buttonText,
        required this.onTapButton,
        this.width = 0,
        this.prefixIcon,
        this.enableBorder = false,
        this.buttonColor = AppColors.colorPrimary,
        this.textColor = AppColors.appColorWhite,
        this.buttonStatus = ButtonStatus.ENABLED,
        this.buttonType = ButtonType.SOLID,
        this.textLeftPadding=0,
        this.textRightPadding=0, this.fontSize=16, this.isTextPadding=true, this.isTextBold = true});

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      child: Container(
        padding: widget.isTextPadding?EdgeInsets.symmetric(vertical: 14.h):EdgeInsets.symmetric(vertical: 0),
        width: widget.width == 0 ? 30.w : widget.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(50.h)),
          color: widget.buttonType == ButtonType.OUTLINE
              ? AppColors.colorPrimary
              : widget.buttonStatus == ButtonStatus.ENABLED
              ? widget.buttonColor
              : widget.buttonColor.withAlpha(150),
          border: Border.all(
              color: widget.buttonType == ButtonType.OUTLINE
                  ? AppColors.appBorderColor
                  : widget.enableBorder
                  ? AppColors.appBorderColor
                  : widget.buttonColor,
              width: 2),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset(2, 2), // changes position of shadow
            ),
          ],
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              widget.prefixIcon ?? const SizedBox.shrink(),
              widget.prefixIcon != null
                  ? SizedBox(
                width: 5.w,
              )
                  : const SizedBox.shrink(),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(right: widget.textRightPadding,left: widget.textLeftPadding),
                  child: Center(
                    child: Text(
                      widget.buttonText,
                      style: TextStyle(
                          color: widget.buttonStatus == ButtonStatus.ENABLED
                              ? widget.textColor
                              : widget.textColor.withAlpha(180),
                          fontWeight: widget.isTextBold?FontWeight.bold:FontWeight.normal,
                          fontSize: widget.fontSize),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      onTap: () {
        if (widget.buttonStatus == ButtonStatus.ENABLED) {
          if (widget.onTapButton != null) {
            widget.onTapButton();
          }
        }
      },
    );
  }
}
