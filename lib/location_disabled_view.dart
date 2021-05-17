part of esamudaay_circles;

///
///This view is shown when user does not allow location or location is disabled
///It shows info regarding why is location essential as well as a button to enable
///the same. Upon tapping, user is taken to app settings page where they can allow/enable location.
///

class LocationDisabledView extends StatelessWidget {
  ///
  /// This callback is invoked when user taps on the button to enable/allow location
  ///
  final VoidCallback onTapLocationAction;
  final String circleLocationLocalisedString;
  final String turnOnLocationLocalisedString;
  final String locationPointerImagePath;

  const LocationDisabledView(
      {Key? key,
      required this.onTapLocationAction,
      required this.circleLocationLocalisedString,
      required this.turnOnLocationLocalisedString,
      required this.locationPointerImagePath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Text(
              circleLocationLocalisedString,
              textAlign: TextAlign.center,
              style: EsamudaayTheme.of(context)
                  .textStyles
                  .sectionHeading2
                  .copyWith(
                      color: EsamudaayTheme.of(context).colors.disabledAreaColor),
            ),
          ),
          const SizedBox(
            height: 15.0,
          ),
          InkWell(
            onTap: onTapLocationAction,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              width: 234 / 375 * MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.0),
                border: Border.all(
                    width: 1.5,
                    color: EsamudaayTheme.of(context).colors.primaryColor),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    locationPointerImagePath,
                    color: EsamudaayTheme.of(context).colors.primaryColor,
                  ),
                  const SizedBox(
                    width: 5.0,
                  ),
                  Text(
                    turnOnLocationLocalisedString,
                    style: EsamudaayTheme.of(context).textStyles.sectionHeading1,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
