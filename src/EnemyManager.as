package  
{
	import org.flixel.*;
	import flash.utils.getTimer;

	public class EnemyManager extends FlxGroup
	{
		private var lastReleased:int;
		private var releaseRate:uint = 200;

		public function EnemyManager(MaxNumberOfEnemies:uint)
		{
			super();

			for (var i:int = 0; i < MaxNumberOfEnemies; i++)
			{
				add(new Enemy);
			}
		}

		public function release():void
		{
			var enemy:Enemy = Enemy(getFirstAvailable());

			if (enemy)
			{
				enemy.launch();
			}
		}

		override public function update():void
		{
			super.update();

			if (getTimer() > lastReleased + releaseRate)
			{
				lastReleased = getTimer();

				release();
			}
		}

		public function bulletHitEnemy(bullet:FlxObject, enemy:FlxObject):void
		{
			bullet.kill();

			enemy.kill();
		}

	}

}