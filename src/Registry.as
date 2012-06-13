package  
{
	import org.flixel.*;
	
	public class Registry 
	{
		public static var player:Player;
		public static var playerBullets:BulletManager;
		public static var enemies:EnemyManager;
		public static var powerups:PowerupManager;
		
		public static function erase():void
		{
			player = null;
			playerBullets = null;
			enemies = null;
			powerups = null;
		}
		
	}

}