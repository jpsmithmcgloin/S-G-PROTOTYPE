// Input

key_left = keyboard_check(vk_right);
key_right = keyboard_check(vk_left);
key_jump = keyboard_check(vk_space);

// Movement
var move = key_left-key_right;

hsp = move * walksp;

vsp = vsp + grv;

// Jumping
if (place_meeting(x,y+1,O_Platform)) and (key_jump)
{
	vsp = -7;	
}

// Boundries
if (place_meeting(x-2,y,O_WallR) and (global.Pick_Up_Key = true))
{
		vsp = -10
}

if (place_meeting(x,y+1,O_WallR))
{
	hsp = -1;	
}

if (place_meeting(x,y+1,O_WallL))
{
	hsp = 1;
}


// Horizontal collision

if (place_meeting(x+hsp,y,O_Platform))
{
	while (!place_meeting(x+sign(hsp),y,O_Platform))
	{
		x = x + sign(hsp);	
	}
	hsp = 0;
	
}
x = x + hsp;

// Vertical collision
if (place_meeting(x,y+vsp,O_Platform))
{
	while (!place_meeting(x,y+sign(vsp),O_Platform))
	{
		y = y + sign(vsp);	
	}
	vsp = 0;
}
y = y +vsp;

// Spikes (Instant Death Objects (IDO))
if (place_meeting(x,y,O_Spikes1))
{
	// Display Death Message
	vsp = -10;	
}


