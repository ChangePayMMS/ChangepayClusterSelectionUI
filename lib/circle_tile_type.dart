part of esamudaay_circles;

class CircleTileType {
  final String imageUrl;
  final String circleName;
  final String circleDescription;
  final bool isSelected;
  final String circleCode;
  final String circleId;

  CircleTileType(
      {@required this.imageUrl,
      @required this.circleId,
      @required this.circleCode,
      @required this.circleName,
      @required this.circleDescription,
      @required this.isSelected});
}
