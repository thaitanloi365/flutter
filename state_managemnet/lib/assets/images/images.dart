class Images {
  static final Images _images = new Images._();
  Images._();
  factory Images() {
    return _images;
  }

  static final String _root = "packages/state_managemnet/assets/images";
  final String splashScreen = "$_root/splashScreen.png";
}