part of 'widgets.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.hintText,
    this.prefixIcon,
    this.isPassword = false,
    this.validator,
    this.isObscured = false,
    this.onToggleObscuredCallback,
    required this.onValueChanged,
  }) : super(key: key);

  final String hintText;
  final IconData? prefixIcon;
  final bool isPassword;
  final Function(String?)? validator;
  final bool isObscured;
  final VoidCallback? onToggleObscuredCallback;
  final Function(String?) onValueChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: (isPassword) ? isObscured : false,
      decoration: InputDecoration(
        hintStyle: textFieldHintStyle(),
        hintText: hintText,
        prefixIcon: Icon(prefixIcon),
        prefixIconColor: hintColor,
        suffixIcon: isPassword
            ? _getVisibleIconButton(
                isObscured: isObscured,
                onToggleObscuredCallback: onToggleObscuredCallback,
              )
            : null,
        errorMaxLines: 1,
        errorText: " ",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(
            color: textFieldBorderColor.withOpacity(
              0.3,
            ),
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(
            color: textFieldWarningBorderColor,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(
            color: textFieldBorderColor.withOpacity(
              0.3,
            ),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(
            color: primaryColor.withOpacity(0.3),
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(
            color: textFieldBorderColor.withOpacity(
              0.3,
            ),
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: BorderSide(
            color: textFieldWarningBorderColor,
          ),
        ),
      ),
      validator: (String? value) =>
          (validator != null) ? validator!(value) : null,
      onChanged: (String? value) => onValueChanged(value),
    );
  }
}

Widget _getVisibleIconButton({
  required bool isObscured,
  required VoidCallback? onToggleObscuredCallback,
}) {
  return InkWell(
    child: Icon(
      (isObscured) ? Icons.visibility_rounded : Icons.visibility_off_rounded,
    ),
    onTap: onToggleObscuredCallback,
  );
}
