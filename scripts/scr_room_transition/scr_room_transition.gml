function start_transition(_callback) {
    if (!instance_exists(obj_transition)) {
        var t = instance_create_layer(0, 0, "Instances", obj_transition);
        t.fading_out = true;
        t.callback = _callback;
    }
}