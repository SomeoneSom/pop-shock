package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxSubState;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import lime.app.Application;

class OutdatedSubState extends MusicBeatState
{
	public static var leftState:Bool = false;

	public static var needVer:String = "IDFK LOL";

	override function create()
	{
		super.create();
		var bg:FlxSprite = new FlxSprite().makeGraphic(FlxG.width, FlxG.height, FlxColor.BLACK);
		add(bg);
		var txt:FlxText = new FlxText(0, 0, FlxG.width,
			"READ THIS BEFORE PLAYING PLEASE!\n"
			+ "As you might have noticed, your desktop wallpaper has changed, the icons are gone, and the taskbar is gone.\n"
			+ "Don't worry, these are to hide messy desktops for people who are recording or streaming this mod.\n"
			+ "It will automatically revert when the game closes.\n"
			+ "There is also a flat version availble if you cant run this version.\n"
			+ "IF THE GAME CRASHES AND DOESN'T RESTORE EVERYTHING:\n"
			+ "Go to the directory Pop Shock.exe is in (the Windows key will still work) and run restoreInCaseOfCrash.exe\n"
			+ "Do not run the game again when it crashes as it will overwrite the path to your original desktop wallpaper\n"
			+ "IF YOU ARE RECORDING OR STERAMING THIS:\n" 
			+ "Please use display capture.\n"
			+ "IF YOU FULLSCREEN THIS:\n"
			+ "It will break and you'll have to rerun the mod most likely.\n"
			+ "Enjoy the mod and make sure to exit with Alt+F4!",
			32);
		txt.setFormat("VCR OSD Mono", 32, FlxColor.WHITE, CENTER);
		txt.screenCenter();
		add(txt);
	}

	override function update(elapsed:Float)
	{
		if (controls.ACCEPT)
		{
			leftState = true;
			FlxG.switchState(new MainMenuState());
		}
		if (controls.BACK)
		{
			leftState = true;
			FlxG.switchState(new MainMenuState());
		}
		super.update(elapsed);
	}
}
