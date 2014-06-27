package  {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	
	
	public class Main extends MovieClip {
		
		
		public function Main() {
			// constructor code
			addEventListener(Event.ENTER_FRAME, onEnterFrame);
			
			the_bird.gravity = 0;
			the_bird.y_speed = 0;
		}
		
		private function onEnterFrame(e:Event):void {
			the_bird.gravity = 2;
			
			the_bird.y_speed += the_bird.gravity;
			the_bird.y += the_bird.y_speed;
		}
	}
	
}
