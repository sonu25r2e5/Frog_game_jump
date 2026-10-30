import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame_tiled/flame_tiled.dart';
import 'package:game_app/actors/player.dart';

class Level extends World {
  // late  Tile/
  final String levelName;
  Level({required this.levelName});

  // level tiles.
  late TiledComponent level;

  @override
  FutureOr<void> onLoad() async {
    level = await TiledComponent.load('$levelName.tmx', Vector2.all(16));
    add(level);
    // create a spwan player
    final spawnPointsLayer = level.tileMap.getLayer<ObjectGroup>('Spawnpoints');
    // move through all of the object

    for (final spawnpoint in spawnPointsLayer!.objects) {
      // each spawn points if couldn't exitst we get null
      switch (spawnpoint.class_) {
        case 'Player':
          final player = Player(
            character: 'Mask Dude',
            position: Vector2(spawnpoint.x, spawnpoint.y),
          );
          add(player);
          break;
        default:
      }
    }
    await super.onLoad();
  }
}
