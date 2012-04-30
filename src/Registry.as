package  
{
	import org.flixel.*;
	
	public class Registry 
	{
		public static var player:Player;
		public static var enemies:EnemyManager;
		
		public static function erase():void
		{
			player = null;
		}
		
	}

}