// generated by "sampctl package generate"

#include "a_samp.inc"
#include "AntiJC.inc"
#include "rAgc.inc"
#include "Opba.inc"
#define ManualUse
#include "rAct.inc"
#include "rEac.inc"
#include "rAmc.inc"
#include "rAntiBuggers.inc"

#include "rAsc.inc"
#include "rED.inc"
#include "rVM.inc"
#include "rAcs.inc"
#include "AFkill.inc"
#include "AntiFC.inc"

#include "AntiSpam.inc"
#include "AntiSba.inc"
#include "Flaggers.inc"

#tryinclude "zcmd.inc"

main() {
	CreateVehicle(561, 0.0, 0.0, 0.0, 0.0, 0, 0, 0);
}
new Test_String[80];

public OnPlayerFakeKill(playerid, spoofedid, spoofedreason, faketype)
{
	format(Test_String, sizeof(Test_String), "ID %d just spoof killed ID %d reason %d type %d", playerid, spoofedid, spoofedreason, faketype);
	SendClientMessageToAll(-1, Test_String);
	print(Test_String);
	return 1;
}

public OnPlayerFakeConnect(playerid)
{
	format(Test_String, sizeof(Test_String), "ID %d is fake connecting!", playerid);
	SendClientMessageToAll(-1, Test_String);
	print(Test_String);
	return 1;
}

public OnPlayerJetpackCheat(playerid)
{
	format(Test_String, sizeof(Test_String), "ID %d is using jetpack cheats!", playerid);
	SendClientMessageToAll(-1, Test_String);
	print(Test_String);
	return 1;
}

public OnPlayerSpamChat(playerid)
{
	format(Test_String, sizeof(Test_String), "ID %d is spamming chat!", playerid);
	SendClientMessageToAll(-1, Test_String);
	print(Test_String);
	return 1;
}

public OnPlayerGunCheat(playerid, weaponid, ammo, hacktype)
{
	format(Test_String, sizeof(Test_String), "ID %d just used weapon cheats weapon %d ammo %d type %d!", playerid, weaponid, ammo, hacktype);
	SendClientMessageToAll(-1, Test_String);
	print(Test_String);
	return 1;
}

public OnPlayerSpeedCheat(playerid, speedtype)
{
	format(Test_String, sizeof(Test_String), "ID %d just speed cheats type !", playerid, speedtype);
	SendClientMessageToAll(-1, Test_String);
	print(Test_String);
	return 1;
}

public OnPlayerBreakAir(playerid, breaktype)
{
	format(Test_String, sizeof(Test_String), "ID %d used airbreak/teleport cheats type %d !", playerid, breaktype);
	SendClientMessageToAll(-1, Test_String);
	print(Test_String);
	return 1;
}

public OnPlayerSpamCars(playerid, number)
{
	format(Test_String, sizeof(Test_String), "ID %d used car spammed %d vehicles !", playerid, number);
	SendClientMessageToAll(-1, Test_String);
	print(Test_String);
	return 1;
}

public OnPlayerCarTroll(playerid, vehicleid, trolledid, trolltype)
{
	if(trolledid == INVALID_PLAYER_ID)
		format(Test_String, sizeof(Test_String), "ID %d used car troll cheats vehicle %d type %d !", playerid, vehicleid, trolltype);
	else
		format(Test_String, sizeof(Test_String), "ID %d used car troll cheats on ID %d vehicle %d type %d !", playerid, trolledid, vehicleid, trolltype); 
	SendClientMessageToAll(-1, Test_String);
	print(Test_String);
	return 1;
}

public OnPlayerCashCheat(playerid, oldcash, newcash, amount)
{
	format(Test_String, sizeof(Test_String), "ID %d used money cheats for %d !", playerid, amount);
	SendClientMessageToAll(-1, Test_String);
	print(Test_String);
	return 1;
}

public OnPlayerCarSwing(playerid, vehicleid)
{
	format(Test_String, sizeof(Test_String), "ID %d used car swing cheats vehicle %d !", playerid, vehicleid);
	SendClientMessageToAll(-1, Test_String);
	print(Test_String);
	return 1;
}

public OnPlayerParticleSpam(playerid, vehicleid)
{
	format(Test_String, sizeof(Test_String), "ID %d used car particle spam cheats vehicle %d !", playerid, vehicleid);
	SendClientMessageToAll(-1, Test_String);
	print(Test_String);
	return 1;
}

public OnVehicleModEx(playerid, vehicleid, componentid, illegal)
{
	if(illegal)
	{
		format(Test_String, sizeof(Test_String), "ID %d used car mod cheats component %d vehicle %d !", playerid, componentid, vehicleid);
		SendClientMessageToAll(-1, Test_String);
		print(Test_String);
	}
	return 1;
}

public OnPlayerSlide(playerid, weaponid, Float:speed)
{
	format(Test_String, sizeof(Test_String), "ID %d is slide bugging weapon %d !", playerid, weaponid);
	SendClientMessageToAll(-1, Test_String);
	print(Test_String);
	return 1;
}

public OnPlayerLagout(playerid, lagtype, ping)
{
	format(Test_String, sizeof(Test_String), "ID %d is lagging type %d ping %d !", playerid, lagtype, ping);
	SendClientMessageToAll(-1, Test_String);
	print(Test_String);
	return 1;
}

public OnPlayerBugAttempt(playerid, bugcode)
{
	format(Test_String, sizeof(Test_String), "ID %d is using bug cheats type %d!", playerid, bugcode);
	SendClientMessageToAll(-1, Test_String);
	print(Test_String);
	return 1;
}

/* Easy dialog by Emmet_ Example: */
#if defined CMD
CMD:weapons(playerid, params[])
{
    Dialog_Show(playerid, WeaponMenu, DIALOG_STYLE_LIST, "Weapon Menu", "9mm\nSilenced 9mm\nDesert Eagle\nShotgun\nSawn-off Shotgun\nCombat Shotgun", "Select", "Cancel");
    return 1;
}
#endif

Dialog:WeaponMenu(playerid, response, listitem, inputtext[])
{
    if (response)
    {
        new str[64];
        format(str, 64, "You have selected the '%s'.", inputtext);

        GivePlayerWeapon(playerid, listitem + 22, 500);
        SendClientMessage(playerid, -1, str);
    }
    return 1;
}

public OnDialogPerformed(playerid, dialog[], response, success)
{
    if (!strcmp(dialog, "WeaponMenu") && IsPlayerInAnyVehicle(playerid))
    {
        SendClientMessage(playerid, -1, "You must be on-foot to spawn a weapon.");
        return 0;
    }
    return 1;
}
/* Easy dialog by Emmet_ Example ^ */
