import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:game_app/levels/level.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Flame.device.fullScreen();
  Flame.device.setLandscape();
  final game = PixelAdventure();

  runApp(GameWidget(game: game));
}

class PixelAdventure extends FlameGame {
  @override
  // for specifiy the color
  Color backgroundColor() => const Color(0xFF211F30);
  late final CameraComponent cam;
  @override
  final world = Level(levelName: 'level-02');

  @override
  Future<void> onLoad() async {
    await super.onLoad();

    // load all the images.
    await images.loadAllImages();

    cam = CameraComponent.withFixedResolution(
      world: world,
      width: 640,
      height: 400,
    );
    cam.viewfinder.anchor = Anchor.topLeft;
    addAll([cam, world]);
  }
}
