import 'package:ny_cricket_app/app/utils/helpers/exporter.dart';

class CricketAppTextFormField extends StatefulWidget {
  const CricketAppTextFormField({
    super.key,
    required this.context,
    this.validator,
    this.width,
    this.alignment,
    this.textStyle,
    this.isObscure = false,
    this.isCapitalized = false,
    this.maxLines = 1,
    this.isLabelEnabled = true,
    this.readOnly = false,
    this.controller,
    this.inputAction,
    this.focusNode,
    this.label,
    this.hint = "",
    this.onTap,
    this.prefix,
    this.maxLength,
    this.suffixIcon,
    this.autofillHints,
    this.inputFormatters,
    this.prefixIcon,
    this.onFieldSubmitted,
    this.onChanged,
    this.textInputAction,
    this.textInputType,
    this.hintStyle,
    this.hintText,
    this.obscureText = false,
    this.suffix,
    this.fillColor,
    this.filled = false,
    this.borderDecoration,
    this.enabled = true,
    this.labelText,
    this.required = false,
    this.autovalidateMode,
    this.onSaved,
    this.lableStyle,
    this.initialValue,
    this.contentPadding,
    this.height,
  });

  final BuildContext context;
  final Alignment? alignment;
  final double? width;
  final double? height;
  final TextInputAction? inputAction;
  final TextEditingController? controller;
  final String? label;
  final String hint;
  final bool isObscure;
  final bool isCapitalized;
  final TextStyle? textStyle;
  final int maxLines;
  final int? maxLength;
  final ValueChanged<String>? onChanged;
  final bool obscureText;
  final bool isLabelEnabled;
  final String? Function(String?)? validator;
  final Function(String)? onFieldSubmitted;
  final bool readOnly;
  final Widget? suffixIcon;
  final String? hintText;
  final TextStyle? lableStyle;
  final TextStyle? hintStyle;
  final Widget? prefix;
  final Widget? prefixIcon;
  final void Function()? onTap;
  final Iterable<String>? autofillHints;
  final FocusNode? focusNode;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputAction? textInputAction;
  final TextInputType? textInputType;
  final Widget? suffix;
  final Color? fillColor;
  final bool? filled;
  final InputBorder? borderDecoration;
  final bool? enabled;
  final String? labelText;
  final bool? required;
  final AutovalidateMode? autovalidateMode;
  final String? initialValue;
  final void Function(String?)? onSaved;
  final EdgeInsetsGeometry? contentPadding;

  @override
  _CricketAppTextFormFieldState createState() =>
      _CricketAppTextFormFieldState();
}

class _CricketAppTextFormFieldState extends State<CricketAppTextFormField> {
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = widget.focusNode ?? FocusNode();
    _focusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChange);
    if (widget.focusNode == null) {
      _focusNode.dispose();
    }
    super.dispose();
  }

  void _onFocusChange() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return widget.alignment != null
        ? Align(
            alignment: widget.alignment ?? Alignment.center,
            child: _textFormFieldWidget,
          )
        : _textFormFieldWidget;
  }

  Widget get _textFormFieldWidget => SizedBox(
        width: widget.width ?? double.maxFinite,
        child: TextFormField(
          focusNode: _focusNode,
          enabled: widget.enabled,
          onSaved: widget.onSaved,
          initialValue: widget.initialValue,
          onChanged: widget.onChanged,
          obscureText: widget.obscureText,
          inputFormatters: widget.inputFormatters,
          autofillHints: widget.autofillHints,
          onTap: widget.onTap,
          maxLines: widget.maxLines,
          maxLength: widget.maxLength,
          onFieldSubmitted: widget.onFieldSubmitted,
          controller: widget.controller,
          readOnly: widget.readOnly,
          style: widget.textStyle ??
              Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(fontSize: 16.0.sp),
          textCapitalization: widget.isCapitalized
              ? TextCapitalization.words
              : TextCapitalization.none,
          textInputAction: widget.textInputAction,
          keyboardType: widget.textInputType,
          decoration: _decoration,
          validator: widget.validator,
          enableSuggestions: true,
          cursorOpacityAnimates: true,
          autovalidateMode:
              widget.autovalidateMode ?? AutovalidateMode.disabled,
        ),
      );

  InputDecoration get _decoration => InputDecoration(
        labelText: widget.labelText,
        labelStyle: widget.lableStyle ?? Theme.of(context).textTheme.bodySmall,
        alignLabelWithHint: true,
        hintText: widget.hintText ?? widget.hint,
        hintStyle: widget.hintStyle ??
            Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontSize: 16.0.sp,
                fontWeight: FontWeight.w400,
                color: Theme.of(context).hintColor),
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.suffixIcon,
        prefix: widget.prefix,
        floatingLabelBehavior: widget.isLabelEnabled
            ? FloatingLabelBehavior.always
            : FloatingLabelBehavior.never,
        isDense: true,
        fillColor: _focusNode.hasFocus
            ? Colors.transparent
            : ThemeData().customColors.textfieldfillcolor,
        filled: true,
        counter: const Offstage(),
        border: widget.borderDecoration,
        enabledBorder: widget.borderDecoration,
        focusedBorder: widget.borderDecoration,
      );
}
