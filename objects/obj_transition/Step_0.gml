if (fading_out) {
    alpha += transition_speed;
    if (alpha >= 1) {
        alpha = 1;
        fading_out = false;
        if (is_callable(callback)) {
            callback(); // call function (like room_goto)
        }
        fading_in = true;
    }
}
else if (fading_in) {
    alpha -= transition_speed;
    if (alpha <= 0) {
        alpha = 0;
        fading_in = false;
        instance_destroy(); // Done with transition
    }
}