//

import 'dart:async';

import 'package:flame/components.dart';
import 'package:game_app/main.dart';

//
enum PlayerState { idle, running, walking, run, jump }

class Player extends SpriteAnimationGroupComponent
    with HasGameReference<PixelAdventure> {
  // swithicng the
  late final SpriteAnimation idleanimation;
  final double stepTime = 0.05;

  @override
  FutureOr<void> onLoad() {
    // TODO: implement onLoad
    _loadAllAnimtions();
    return super.onLoad();
  }

  void _loadAllAnimtions() {
    idleanimation = SpriteAnimation.fromFrameData(
      game.images.fromCache('Main Characters/Ninja Frog/Idle (32x32).png'),
      SpriteAnimationData.sequenced(
        amount: 11,
        stepTime: stepTime,
        textureSize: Vector2.all(16),
      ),
    );

    animations = {PlayerState.idle: idleanimation};

    // set current animations nothign at all .
    current = PlayerState.idle;
  }
}
