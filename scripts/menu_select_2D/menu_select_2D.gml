function menu_select_2D(_var, _cols, _max, _wrap = true) {
  var col = _var mod _cols;
  var row = _var div _cols;
  var new_col = col;
  var new_row = row;

  if (button_pressed(KEY.LEFT)) { new_col-- }
  if (button_pressed(KEY.RIGHT)) { new_col++ }
  if (button_pressed(KEY.UP)) { new_row-- }
  if (button_pressed(KEY.DOWN)) { new_row++ }

  var rows = ceil((_max + 1) / _cols);
  if (_wrap) {
    if (new_col < 0) { new_col = _cols - 1 }
    if (new_col >= _cols) { new_col = 0 }
  } else
    new_col = clamp(new_col, 0, _cols - 1);

  if (_wrap) {
    if (new_row < 0) { new_row = rows - 1 }
    if (new_row >= rows) { new_row = 0 }
  } else
    new_row = clamp(new_row, 0, rows - 1);

  var cand = new_row * _cols + new_col;
  if (cand > _max) {
    if (_wrap) {
      if (button_pressed(KEY.LEFT)) { cand = new_row * _cols + (_cols - 1) }
      if (button_pressed(KEY.RIGHT)) { cand = new_row * _cols }

      if (button_pressed(KEY.UP)) {
        var last_row = _max div _cols
        cand = last_row * _cols + new_col
        if (cand > _max) cand -= _cols
      }

      if (button_pressed(KEY.DOWN)) {
        cand = new_col;
        if (cand > _max) { cand = _max }
      }

      if (cand > _max) cand = _max;
    } else
      cand = _var
  }
  return cand;
}