library commons;

import 'package:vector_math/vector_math.dart';

class Rectangle {
  vec2 position;
  num width;
  num height;

  Rectangle(num x, num y, num width, num height)
      : this.position = new vec2(x.toDouble(), y.toDouble()),
        this.width = width,
        this.height = height;
  
  num get x => position.x;
  num get y => position.y;

  bool contains(vec2 p) {
    return !(x > p.x || x + width < p.x || y > p.y || y + height < p.y);
  }
  
  bool collide(Rectangle other) {
    return !(x > other.x + other.width || x + width < other.x || y > other.y + other.height || y + height < other.y);
  }
  
}

