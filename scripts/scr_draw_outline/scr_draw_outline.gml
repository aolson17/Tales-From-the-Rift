///@param x
///@param y
///@param text
///@param text_color
///@param outline_color
///@param alpha

var text_x = argument0
var text_y = argument1
var text = argument2
var text_color = argument3
var outline_color = argument4
var alpha = argument5

var prev_alpha = draw_get_alpha()
draw_set_alpha(alpha)

var prev_color = draw_get_color()
draw_set_color(outline_color)

draw_text(text_x+1,text_y,text)
draw_text(text_x-1,text_y,text)
draw_text(text_x,text_y+1,text)
draw_text(text_x,text_y-1,text)
draw_text(text_x+1,text_y+1,text)
draw_text(text_x-1,text_y+1,text)
draw_text(text_x+1,text_y-1,text)
draw_text(text_x-1,text_y-1,text)

draw_set_color(text_color)

draw_text(text_x,text_y,text)

draw_set_color(prev_color)

draw_set_alpha(prev_alpha)