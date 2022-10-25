import 'dart:ui';

import 'package:flame/collisions.dart'; // 追加
import 'package:flame/components.dart';
import 'package:flame/experimental.dart';

import '../../constants/constants.dart';

class Paddle extends RectangleComponent with CollisionCallbacks, DragCallbacks {
  // 修正
  Paddle({required this.draggingPaddle})
      : super(
          size: Vector2(kPaddleWidth, kPaddleHeight),
          paint: Paint()..color = kPaddleColor,
        );

  final void Function(DragUpdateEvent event) draggingPaddle;

  @override
  Future<void>? onLoad() {
    // メソッド追加
    final paddleHitbox = RectangleHitbox(
      size: size,
    );

    add(paddleHitbox);

    return super.onLoad();
  }

  @override
  void onDragUpdate(DragUpdateEvent event) {
    draggingPaddle(event);
    super.onDragUpdate(event);
  }
}
