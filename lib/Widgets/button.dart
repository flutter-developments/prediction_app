import 'package:flutter/material.dart';
import 'package:girafee/utils/app_colors.dart';
import 'package:girafee/utils/styles.dart';
import 'package:google_fonts/google_fonts.dart';

class Button extends StatelessWidget {
  final String? buttonText;
  final Color? buttonColor;
  final VoidCallback? onTap;
  final TextStyle? buttonTextStyle;
  final double? widthPercent;

  Button({
    this.buttonText,
    this.buttonColor,
    this.onTap,
    this.buttonTextStyle,
    this.widthPercent,
  });
  @override
  Widget build(BuildContext context) {
    double width;
    width = MediaQuery.of(context).size.width;
    return MaterialButton(
      onPressed: onTap,
      color: buttonColor,
      disabledColor: Colors.transparent,
      elevation: 0,
      shape: StadiumBorder(),
      minWidth: width * widthPercent!,
      height: 48,
      child: Text(
        buttonText!,
        style: GoogleFonts.poppins(
            textStyle: buttonTextStyle!.copyWith(fontWeight: FontWeight.bold)),
      ),
    );
  }
}

class ButtonWithProgressIndicator extends StatefulWidget {
  final String buttonText;
  final Color? buttonColor;
  final TextStyle? buttonTextStyle;
  final Future<void> Function()? onTap;

  final EdgeInsets? padding;

  final double elevation;

  ButtonWithProgressIndicator({
    required this.buttonText,
    required this.onTap,
    this.buttonColor = AppColors.greenColor,
    this.buttonTextStyle,
    this.elevation = 2.0,
    this.padding,
  });

  @override
  _ButtonWithProgressIndicatorState createState() =>
      _ButtonWithProgressIndicatorState();
}

class _ButtonWithProgressIndicatorState
    extends State<ButtonWithProgressIndicator> {
  bool isCallbackExecuting = false;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: widget.padding,
      onPressed: widget.onTap == null ? null : progressIndicatorCallback,
      color: widget.buttonColor,
      disabledColor: Colors.grey,
      elevation: widget.elevation,
      shape: StadiumBorder(),
      height: 48,
      child: AnimatedContainer(
        duration: Duration(seconds: 1),
        child: isCallbackExecuting
            ? CircularProgressIndicator.adaptive(
                valueColor: AlwaysStoppedAnimation(Colors.white),
              )
            : Text(
                widget.buttonText,
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                    textStyle: widget.buttonTextStyle
                        ?.copyWith(fontWeight: FontWeight.bold)),
              ),
      ),
    );
  }

  progressIndicatorCallback() async {
    if (isCallbackExecuting) return;
    setState(() => isCallbackExecuting = true);
    try {
      if (widget.onTap != null) {
        await widget.onTap!();
      }
    } finally {
      setState(() => isCallbackExecuting = false);
    }
  }
}

class ButtonWithoutFixedWidth extends StatelessWidget {
  final String buttonText;
  final Color buttonColor;
  final VoidCallback? onTap;
  final TextStyle buttonTextStyle;
  final bool bold;

  final double elevation;

  ButtonWithoutFixedWidth({
    required this.buttonText,
    required this.onTap,
    this.buttonColor = AppColors.yellowColor,
    this.buttonTextStyle = TextStyles.buttonFontText,
    this.elevation = 0,
    this.bold = true,
  });
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onTap,
      color: buttonColor,
      disabledColor: Colors.grey,
      elevation: elevation,
      shape: StadiumBorder(),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Text(
          buttonText,
          style: GoogleFonts.poppins(
            textStyle: bold
                ? buttonTextStyle.copyWith(
                    fontWeight: FontWeight.bold,
                  )
                : buttonTextStyle,
          ),
        ),
      ),
    );
  }
}
