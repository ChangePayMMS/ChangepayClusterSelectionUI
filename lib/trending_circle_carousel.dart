part of esamudaay_circles;

class TrendingCirclesCarouselView extends StatelessWidget {
  final List<CircleTileType> trendingCirclesList;
  final Function(String) onTap;
  //final String circleTilePlaceholderImagePath;
  final String trendingCirclesLabelLocalisedString;

  const TrendingCirclesCarouselView(
      {Key? key,
      required this.trendingCirclesList,
      required this.onTap,
      //@required this.circleTilePlaceholderImagePath,
      required this.trendingCirclesLabelLocalisedString})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (trendingCirclesList.isEmpty) return SizedBox.shrink();
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 23),
          child: Text(
            trendingCirclesLabelLocalisedString,
            style: EsamudaayTheme.of(context).textStyles.sectionHeading2,
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 163.8 / 375 * MediaQuery.of(context).size.width + 20,
          child: ListView.separated(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 23),
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final CircleTileType circle = trendingCirclesList[index];
                return CircleTileWidget(
                  imageUrl: circle.imageUrl,
                  onTap: () {
                    onTap(circle.circleCode);
                  },
                  isSelected: circle.isSelected,
                  onDelete: null,
                  circleName: circle.circleName,
                  circleDescription: circle.circleDescription,
                  //circleTilePlaceholderImagePath: null,
                );
              },
              separatorBuilder: (_, __) => const SizedBox(
                    width: 20,
                  ),
              itemCount: trendingCirclesList.length),
        ),
        const SizedBox(
          width: 20,
        ),
      ],
    );
  }
}
