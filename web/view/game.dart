part of view;

class Game {
  
  final CanvasRenderingContext2D _context;
  final Model.Game _model;
  
  Game(this._context, this._model);
  
  void draw() {
    _drawBackground();
    _drawBall();
    _drawRect(_model.racketP1, '#fff');
    _drawRect(_model.racketP2, '#fff');
  }
  
  void _drawBackground() {
    _drawRectFromValues(0, 0, _model.width, _model.height, '#000');
    
    for (int p = 7; p < _model.height; p += 17)
      _drawRectFromValues(_model.middleX - 1, p, 2, 8, '#fff');
  }

  void _drawBall() {
    _drawRect(_model.ball, '#fff');
  }

  void _drawRect(Rectangle r, String color) {
    _drawRectFromValues(r.x, r.y, r.width, r.height, color);
  }

  void _drawRectFromValues(num x, num y, num width, num height, String color) {
    _context.fillStyle = color;
    
    _context.beginPath();
    _context.rect(x, y, width, height);
    _context.fill();
    _context.closePath();
  }

}