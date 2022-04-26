part of 'widgets.dart';

class FullWidthCustomButton extends StatelessWidget {
  const FullWidthCustomButton({
    Key? key,
    required this.text,
    this.textColor,
    this.textStyle,
    this.backgroundColor,
    this.onTap,
    this.height,
  }) : super(key: key);

  final String text;
  final Color? textColor;
  final TextStyle? textStyle;
  final Color? backgroundColor;
  final VoidCallback? onTap;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onTap,
      minWidth: 1.sw,
      height: height ?? 50.w,
      color: backgroundColor ?? primaryColor,
      elevation: 0,
      child: Text(
        text,
        style: textStyle ?? textButtonNormal(color: textColor ?? whiteColor),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.r),
      ),
    );
  }
}
