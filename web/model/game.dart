part of model;

class Game {
  
  final num width;
  final num height;
  final num middleX;
  final num middleY;
  
  vec2 _ballVel;
  
  Rectangle _ball;
  Rectangle _racketP1;
  Rectangle _racketP2;
  
  Game(num width, num height) 
      : this.width = width,
        this.height = height,
        this.middleX = width / 2,
        this.middleY = height / 2 {
    
    _ballVel = new vec2(300.0, 300.0);
    
    _ball = new Rectangle(10, middleY, 8, 8);
    _racketP1 = new Rectangle(108 - 4, middleY - 13, 8, 26);
    _racketP2 = new Rectangle(width - 108 + 4, middleY - 13, 8, 26);
  }
  
  Rectangle get ball => _ball;
  Rectangle get racketP1 => _racketP1;
  Rectangle get racketP2 => _racketP2;

  void update(double dt) {
    _updateBall(dt);
  }
  
  void _updateBall(double dt) {
    vec2 newPos = _ball.position + _ballVel.scaled(dt);

    if (newPos.y < 0) {
      _ballVel = reflect(_ballVel, new vec2(0.0, 1.0));
    } else if (newPos.x > width) {
      _ballVel = reflect(_ballVel, new vec2(-1.0, 0.0));
    } else if (newPos.y > height) {
      _ballVel = reflect(_ballVel, new vec2(0.0, -1.0));
    } else if (newPos.x < 0) {
      _ballVel = reflect(_ballVel, new vec2(1.0, 0.0));
    } else {
      _ball.position = newPos;
    }
  }

}

