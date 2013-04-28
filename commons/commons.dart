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

  bool colide(vec2 v) {
    return !(v.x < x || v.x > x + width || v.y < y || v.y > y + height);
  }
  
}

