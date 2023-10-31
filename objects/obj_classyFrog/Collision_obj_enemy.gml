// knocks the player back upon collision with an enemy

if (y < other.y)
{
    vSpeed = -10
}
else
{
    if (other.x > x)
    {
        hSpeedCarry = -5;
    }
    if (other.x < x)
    {
        hSpeedCarry = 5;
    }
}
if !ifhit {
	audio_play_sound(snd_knockback,0,false)
	ifhit = true
}


