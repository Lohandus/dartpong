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
  
  int _p1Movement = 0;
  int _p2Movement = 0;
  
  Game(num width, num height) 
      : this.width = width,
        this.height = height,
        this.middleX = width / 2,
        this.middleY = height / 2 {
    
    _ballVel = new vec2(400.0, 0.0);
    
    _ball = new Rectangle(middleX, middleY, 8, 8);
    _racketP1 = new Rectangle(108 - 4, middleY - 18, 8, 36);
    _racketP2 = new Rectangle(width - 108 + 4, middleY - 18, 8, 36);
  }
  
  Rectangle get ball => _ball;
  Rectangle get racketP1 => _racketP1;
  Rectangle get racketP2 => _racketP2;

  void update(double dt) {
    _updateRackets(dt);
    _updateBall(dt);
  }

  void _updateRackets(double dt) {
    if ((_p1Movement == RacketMovement.UP && _racketP1.position.y > 0) || 
        (_p1Movement == RacketMovement.DOWN && _racketP1.position.y + _racketP1.height < height)) {
      _racketP1.position.y += 300 * _p1Movement * dt;
    }
  }
  
  void _updateBall(double dt) {
    vec2 oldPos = _ball.position;
    _ball.position.add(_ballVel.scaled(dt));

    if (_ball.position.y < 0) {
      _ballVel.reflect(new vec2(0.0, 1.0));
      _ball.position = oldPos;
      
    } else if (_ball.position.x + _ball.width > width) {
      _ballVel.reflect(new vec2(-1.0, 0.0));
      _ball.position = oldPos;
      
    } else if (_ball.position.y + _ball.height > height) {
      _ballVel.reflect(new vec2(0.0, -1.0));
      _ball.position = oldPos;
      
    } else if (_ball.position.x < 0) {
      _ballVel.reflect(new vec2(1.0, 0.0));
      _ball.position = oldPos;
      
    } else if (_ball.collide(_racketP1)) {
      _rebate(_racketP1, 1);
      _ball.position = oldPos;
    
    } else if (_ball.collide(_racketP2)) {
      _rebate(_racketP2, -1);
      _ball.position = oldPos;
    }
  }
  
  void _rebate(Rectangle racket, num direction) {
    var ballY = _ball.position.y + _ball.height / 2;
    var racketY = racket.position.y + racket.height / 2;
    var deflection = (ballY - racketY) / (racket.height / 2);
    var angle = radians(45.0) * deflection * direction;
    
    _ballVel = new vec2(1.0 * direction, 0.0).scaled(_ballVel.length);
    rotateVec2(_ballVel, angle);
  }

  void setP1Movement(int movement) {
    _p1Movement = movement;
  }
  
  void setP2Movement(int movement) {
    _p2Movement = movement;
  }

}

class RacketMovement {
  static const int UP = -1;
  static const int NONE = 0;
  static const int DOWN = 1;
}

