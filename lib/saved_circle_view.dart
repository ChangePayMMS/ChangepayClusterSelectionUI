part of esamudaay_circles;

///
///This is a grid view which shows the saved / profile circles in a grid layout
///

class SavedCirclesView extends StatelessWidget {
  ///
  ///List of saved circles to be shown in a grid view
  ///
  final List<CircleTileType> savedCirclesList;

  ///
  /// The function to be invoked when user taps on the circle tile
  ///
  final Function onTap;

  ///
  /// Function to be invoked when user taps on the delete icon button
  ///
  final Function onDelete;

  final String savedCircleLabelLocalisedString;

  //final String circleTilePlaceholderImagePath;

  const SavedCirclesView(
      {Key key,
      @required this.savedCirclesList,
      @required this.onDelete,
      //@required this.circleTilePlaceholderImagePath,
      @required this.onTap,
      @required this.savedCircleLabelLocalisedString})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (savedCirclesList.isEmpty) return SizedBox.shrink();
    debugPrint('Saved list ${savedCirclesList.toSet()}');
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 24),
            child: Text(
              savedCircleLabelLocalisedString,
              style: CustomTheme.of(context).textStyles.sectionHeading2,
            ),
          ),
          CircleTileGridView(
            tilesDataList: savedCirclesList,
            onDelete: onDelete,
            onTap: onTap,
            //circleTilePlaceholderImagePath: circleTilePlaceholderImagePath,
          )
        ],
      ),
    );
  }
}
