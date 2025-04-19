import 'dart:async';

import 'package:flame/components.dart';
import 'package:pixel_adventure/pixel_adventure.dart';

enum PlayerState { idle, running }

class Player extends SpriteAnimationGroupComponent with HasGameRef<PixelAdventure>{
  late final SpriteAnimation idleAnimation;
  final double stepTime = 0.05;

  @override
  FutureOr<void> onLoad() {
    _loadAllAnimation();
    return super.onLoad();
  }

  void _loadAllAnimation() {
    idleAnimation = SpriteAnimation.fromFrameData(
      game.images.fromCache('Main Characters/Ninja Frog/Idle (32x32).png'), 
      SpriteAnimationData.sequenced(
        amount: 11, 
        stepTime: stepTime, 
        textureSize: Vector2.all(32)
      ),
    );
    //List of animation
    animations = { PlayerState.idle: idleAnimation };

    //Set current animation
    current = PlayerState.idle;
  }
  

}

