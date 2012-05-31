package  
{
	import org.flixel.*;
	
	public class Registry 
	{
		public static var player:Player;
		public static var playerBullets:BulletManager;
		
		public static function erase():void
		{
			player = null;
			playerBullets = null;
		}
		
	}

}