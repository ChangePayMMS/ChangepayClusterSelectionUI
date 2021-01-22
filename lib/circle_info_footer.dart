part of esamudaay_circles;

///
/// This footer is shown at the bottom of the circle screen. It provides
/// info regarding the circles. A brief definition of circles. Apart
/// from that this also has the embedded secret circles feature. Tapping on "eSamudaay Circles" thrice
/// makes you an advanced user and you can then
///

class CircleInfoFooter extends StatefulWidget {
  final Function onTapCallBack;
  final Future<bool> Function() isAdvancedUser;
  final String circleBrandingLocalisedText;
  final String circleInfo1LocalisedText;
  final String circleInfo2LocalisedText;
  final VoidCallback setCurrentUserAsAdvancedCallback;

  const CircleInfoFooter(
      {@required this.onTapCallBack,
      @required this.isAdvancedUser,
      @required this.circleBrandingLocalisedText,
      @required this.circleInfo1LocalisedText,
      @required this.circleInfo2LocalisedText,
      @required this.setCurrentUserAsAdvancedCallback});

  @override
  _CircleInfoFooterState createState() => _CircleInfoFooterState();
}

class _CircleInfoFooterState extends State<CircleInfoFooter> {
  bool _isAdvancedUser;
  int tapCount;

  @override
  void initState() {
    checkAdvancedUser();
    tapCount = 0;
    super.initState();
  }

  void checkAdvancedUser() async {
    _isAdvancedUser = await widget.isAdvancedUser();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 35),
      child: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          GestureDetector(
            onTap: secretCodeActionHandler,
            child: Text(
              widget.circleBrandingLocalisedText,
              style: CustomTheme.of(context).textStyles.topTileTitle.copyWith(
                  color: CustomTheme.of(context).colors.disabledAreaColor),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            widget.circleInfo1LocalisedText,
            style: CustomTheme.of(context).textStyles.sectionHeading1.copyWith(
                fontWeight: FontWeight.w400,
                color: CustomTheme.of(context).colors.disabledAreaColor),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            widget.circleInfo2LocalisedText,
            style: CustomTheme.of(context).textStyles.sectionHeading1.copyWith(
                color: CustomTheme.of(context).colors.disabledAreaColor,
                fontWeight: FontWeight.w400),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }

  void secretCodeActionHandler() async {
    if (_isAdvancedUser ?? false) {
      widget.onTapCallBack();
    } else {
      tapCount++;
      if (tapCount % 3 == 0) {
        widget.setCurrentUserAsAdvancedCallback();
        _isAdvancedUser = true;
        widget.onTapCallBack();
      }
    }
  }
}
