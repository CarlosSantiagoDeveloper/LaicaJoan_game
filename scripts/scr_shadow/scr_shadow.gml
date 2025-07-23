function ProjectShadow(buffer, x1, y1, x2, y2, lx, ly) {
    var dx1 = x1 - lx;
    var dy1 = y1 - ly;
    var dx2 = x2 - lx;
    var dy2 = y2 - ly;

    var scale = 2000;
    var ex1 = x1 + dx1 * scale;
    var ey1 = y1 + dy1 * scale;
    var ex2 = x2 + dx2 * scale;
    var ey2 = y2 + dy2 * scale;

    var color = c_white; // white for subtract
    var alpha = 1;

    // Triangle 1
    vertex_position(buffer, x1, y1);
    vertex_color(buffer, color, alpha);
    vertex_position(buffer, ex1, ey1);
    vertex_color(buffer, color, alpha);
    vertex_position(buffer, ex2, ey2);
    vertex_color(buffer, color, alpha);

    // Triangle 2
    vertex_position(buffer, x1, y1);
    vertex_color(buffer, color, alpha);
    vertex_position(buffer, ex2, ey2);
    vertex_color(buffer, color, alpha);
    vertex_position(buffer, x2, y2);
    vertex_color(buffer, color, alpha);
}

function SignTest(x1,y1,x2,y2,lx,ly){
return ((x2 - x1) * (ly - y1) - (y2 - y1) * (lx - x1)) < 0;
}