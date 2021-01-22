import 'package:circles/themes/custom_theme.dart';
import 'package:flutter/material.dart';

///
/// This widget is the builder for the bottom sheet to be shown when
/// adding a circle using its code
///

class SecretCircleBottomSheet extends StatefulWidget {
  ///
  /// Function to be invoked when user taps on the add circle button
  ///
  final Function(String) onAddCircle;

  final String circleEnterCodeLocalisedString;

  const SecretCircleBottomSheet(
      {Key key,
      @required this.onAddCircle,
      @required this.circleEnterCodeLocalisedString})
      : super(key: key);

  @override
  _SecretCircleBottomSheetState createState() =>
      _SecretCircleBottomSheetState();
}

class _SecretCircleBottomSheetState extends State<SecretCircleBottomSheet> {
  TextEditingController _textEditingController = TextEditingController();

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _textEditingController
      ..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: MediaQuery.of(context).size.width,

        ///
        /// By using MediaQuery we build the widget everytime when insets change
        /// This helps in expanding/contracting when keyboards shows/hides respectively
        ///
        height: 180 / 595 * MediaQuery.of(context).size.height +
            MediaQuery.of(context).viewInsets.bottom,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: CustomTheme.of(context).colors.backgroundColor),
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
        child: Column(
          children: [
            TextField(
              controller: _textEditingController,
              decoration: InputDecoration(
                hintText: widget.circleEnterCodeLocalisedString,
                hintStyle: CustomTheme.of(context)
                    .themeData
                    .textTheme
                    .subtitle1
                    .copyWith(
                        color:
                            CustomTheme.of(context).colors.disabledAreaColor),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: CustomTheme.of(context).colors.shadowColor16),
                  borderRadius: BorderRadius.circular(5),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: CustomTheme.of(context).colors.secondaryColor),
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            InkWell(
              onTap: () {
                if (_textEditingController.text.isEmpty) return;
                Navigator.pop(context);
                widget.onAddCircle(_textEditingController.text.toUpperCase());
              },
              child: Container(
                height: 42 * MediaQuery.of(context).size.height / 667,
                decoration: BoxDecoration(
                  color: _textEditingController.text.isNotEmpty
                      ? CustomTheme.of(context).colors.secondaryColor
                      : CustomTheme.of(context).colors.disabledAreaColor,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Center(
                  child: Icon(
                    Icons.add,
                    color: CustomTheme.of(context).colors.backgroundColor,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
