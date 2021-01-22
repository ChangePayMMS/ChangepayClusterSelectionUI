part of esamudaay_circles;

///
/// This widget builds the grid for the suggested(nearby circles)
///

class SuggestedNearbyCirclesView extends StatelessWidget {
  ///
  ///List of circles to be displayed in the grid
  ///
  final List<CircleTileType> suggestedCirclesList;

  ///
  /// If location is disabled/permission denied we don't show the grid
  /// but the button to enable it
  final bool isLocationDisabled;
  final Function(String) onSelectCircle;
  final VoidCallback onTapLocationAction;
  //final String circleTilePlaceholderImagePath;
  final String turnOnLocationLocalisedString;
  final String circleLocationLocalisedString;
  final String locationPointerImagePath;
  final String suggestedCircleLabelLocalisedString;
  final String nearbyCircleLabelLocalisedString;

  const SuggestedNearbyCirclesView(
      {Key key,
      this.suggestedCirclesList,
      //this.circleTilePlaceholderImagePath,
      this.onSelectCircle,
      this.onTapLocationAction,
      @required this.isLocationDisabled,
      @required this.turnOnLocationLocalisedString,
      @required this.circleLocationLocalisedString,
      @required this.locationPointerImagePath,
      @required this.suggestedCircleLabelLocalisedString,
      @required this.nearbyCircleLabelLocalisedString})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (!isLocationDisabled && suggestedCirclesList.isEmpty)
      return const SizedBox.shrink();
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15.0, left: 24.0),
            child: Text(
              suggestedCircleLabelLocalisedString,
              style: CustomTheme.of(context).textStyles.sectionHeading2,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 24),
            child: Text(
              nearbyCircleLabelLocalisedString,
              style: CustomTheme.of(context).textStyles.body2Faded,
            ),
          ),
          if (isLocationDisabled)
            LocationDisabledView(
              onTapLocationAction: onTapLocationAction,
              turnOnLocationLocalisedString: turnOnLocationLocalisedString,
              circleLocationLocalisedString: circleLocationLocalisedString,
              locationPointerImagePath: locationPointerImagePath,
            ),
          if (suggestedCirclesList.isNotEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: CircleTileGridView(
                tilesDataList: suggestedCirclesList,
                onTap: onSelectCircle,
                //circleTilePlaceholderImagePath: circleTilePlaceholderImagePath,
              ),
            )
        ],
      ),
    );
  }
}
