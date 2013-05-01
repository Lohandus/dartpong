library commons;

import 'package:vector_math/vector_math.dart';


vec2 reflect(vec2 v, vec2 normal) {
  return v - normal.scaled(2 * normal.dot(v));
}

class Rectangle {
  num x;
  num y;
  num width;
  num height;
  
  Rectangle(this.x, this.y, this.width, this.height);

  bool contains(vec2 p) {
    return !(x > p.x || x + width < p.x || y > p.y || y + height < p.y);
  }
  
  bool collide(Rectangle other) {
    return !(x > other.x + other.width || x + width < other.x || y > other.y + other.height || y + height < other.y);
  }
  
}

