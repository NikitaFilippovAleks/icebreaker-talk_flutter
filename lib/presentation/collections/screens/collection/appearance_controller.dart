import 'dart:async';

class CollectionAppearanceController {
  static final CollectionAppearanceController _instance =
      CollectionAppearanceController._internal();
  factory CollectionAppearanceController() => _instance;
  CollectionAppearanceController._internal();

  final StreamController<bool> _controller = StreamController<bool>.broadcast();
  Stream<bool> get animationStream => _controller.stream;

  void startTransition() {
    _controller.add(false);
  }

  void endTransition() {
    _controller.add(true);
  }

  void dispose() {
    _controller.close();
  }
}
