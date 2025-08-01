draw_self()
draw_text(x,y-50,climb)
if(instance_exists(final)){
	draw_line(x,y,final.x,final.y)
}
if(instance_exists(start)){
	draw_line(x,y,start.x,start.y)
}