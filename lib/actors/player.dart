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
  late final SpriteAnimation runningAnimation;
  final double stepTime = 0.05;
  final String character;

  Player({required this.character, super.position})
    : super(size: Vector2.all(32));

  @override
  FutureOr<void> onLoad() {
    _loadAllAnimtions();
    return super.onLoad();
  }

  void _loadAllAnimtions() {
    // Idle and running animation groups.
    idleanimation = _spriteAnimation('Idle', 11);
    runningAnimation = _spriteAnimation('Run', 12);

    animations = {
      PlayerState.idle: idleanimation,
      PlayerState.running: runningAnimation,
    };

    current = PlayerState.idle;
  }

  SpriteAnimation _spriteAnimation(String state, int amount) {
    return SpriteAnimation.fromFrameData(
      game.images.fromCache('Main Characters/$character/$state (32x32).png'),
      SpriteAnimationData.sequenced(
        amount: amount,
        stepTime: stepTime,
        textureSize: Vector2.all(32),
      ),
    );
  }
}
