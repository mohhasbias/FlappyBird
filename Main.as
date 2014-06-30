package  {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	
	
	public class Main extends MovieClip {
		
		
		public function Main() {
			// constructor code
			addEventListener(Event.ENTER_FRAME, onEnterFrame);
			
			the_bird.gravity = 0;
			the_bird.y_speed = 0;
			
			stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeySpaceDown);
		}
		
		private function onKeySpaceDown(e:KeyboardEvent):void {	
			if( e.keyCode == Keyboard.SPACE){
				the_bird.gravity = 2;			
				the_bird.y_speed = -20;
			}
		}
		
		private function onEnterFrame(e:Event):void {
			the_bird.y_speed += the_bird.gravity;
			the_bird.y += the_bird.y_speed;
			
			if( the_bird.y < -50 ){
				the_bird.y = -50;
				the_bird.y_speed = 0;
			}
		}
	}
	
}
