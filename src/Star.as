package  
{
	import org.flixel.*;
	
	public class Star extends FlxSprite
	{
		protected var _type:String;

		/**
		 * The time to add to the game when a bubble is collected
		 */
		public function get Type():String
		{
			return _type;
		}
		
		protected var _lifeTime:Number = 2; //the amount of time before the star exploded
		protected var _lifeTimer:FlxTimer;
		protected var _timerStarted:Boolean = false;
		
		/**
		 * Creates a star at the specified position.
		 * 
		 * @param	X				The initial X position of the sprite.
		 * @param	Y				The initial Y position of the sprite.
		 */
		public function Star(X:Number,Y:Number, type:String)
		{
			super(X, Y);
			_type = type;
			
			if (_type == "white")
			{
				loadGraphic(Assets.WHITESTAR_TEXTURE, false, false, 5, 5, false);
			}
			
			if (_type == "red")
			{
				loadGraphic(Assets.REDSTAR_TEXTURE, false, false, 5, 5, false);
				addAnimation("flicker", [0, 1], 4, true);
			}
			
			_lifeTimer = new Timer();
		}
		
		override public function update():void
		{
			if (_type == "red")
			{
				if (_timerStarted)
				{
					play("flicker");
					
					if (_lifeTimer.finished)
					{
						this.kill();
					}
				}
			}
		}
		
		public function startTimer():void
		{
			_lifeTimer.start(_lifeTime);
			_timerStarted = true;
		}
		
	}

}