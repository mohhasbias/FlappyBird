package  {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	
	
	public class Main extends MovieClip {
		
		
		public function Main() {
			// constructor code
			addEventListener(Event.ENTER_FRAME, onEnterFrame);

			// bird initial movement
			the_bird.gravity = 0;
			the_bird.y_speed = 0;
			
			// pipe initial movement
			pipe1.x_speed = 0;
			pipe2.x_speed = 0;
			pipe3.x_speed = 0;
			
			stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeySpaceDown);
		}
		
		private function onKeySpaceDown(e:KeyboardEvent):void {	
			if( e.keyCode == Keyboard.SPACE){
				// bird movement
				the_bird.gravity = 2;			
				the_bird.y_speed = -20;
				
				// pipe movement
				pipe1.x_speed = -5;
				pipe2.x_speed = -5;
				pipe3.x_speed = -5;
			}
		}
		
		private function onEnterFrame(e:Event):void {
			// bird movement
			the_bird.y_speed += the_bird.gravity;
			the_bird.y += the_bird.y_speed;
			
			if( the_bird.y < -50 ){
				the_bird.y = -50;
				the_bird.y_speed = 0;
			}
			
			// pipe movement
			pipe1.x += pipe1.x_speed;
			pipe2.x += pipe1.x_speed;
			pipe3.x += pipe1.x_speed;
			
			// pipe cycle
			var pipe_distance:int = 200;
			if( pipe1.x + pipe1.width < 0 ){
				pipe1.x = pipe3.x + pipe_distance;
			}
			if( pipe2.x + pipe2.width < 0 ){
				pipe2.x = pipe1.x + pipe_distance;
			}
			if( pipe3.x + pipe3.width < 0 ){
				pipe3.x = pipe2.x + pipe_distance;
			}
			
			// check collision
			if( the_bird.hitTestObject(pipe1) ){
				stage.removeEventListener(KeyboardEvent.KEY_DOWN, onKeySpaceDown);
				pipe1.x_speed = pipe2.x_speed = pipe3.x_speed = 0;
			}
		}
	}
	
}
