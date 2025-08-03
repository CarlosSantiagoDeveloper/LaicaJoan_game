// Only do this once per state change
if (obj_haunt_initiator_nightmare_1.Haunting) {
    if (!countH) {
        audio_stop_all();
        audio_play_sound(snd_haunt, 1, true); // loop = true
        countH = true;
        countN = false;
    }
} else {
    if (!countN) {
        audio_stop_all();
        audio_play_sound(snd_Nightmare_song, 1, true); // loop = true
        countN = true;
        countH = false;
    }
}