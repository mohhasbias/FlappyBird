package  {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	
	
	public class Main extends MovieClip {
		
		public function Main() {
			the_bird.gravity = 0;
			the_bird.y_speed = 0;
			
			the_bird.addEventListener(Event.ENTER_FRAME, function(e:Event):void {
				the_bird.y_speed += the_bird.gravity;
				the_bird.y += the_bird.y_speed;

				var y_min_pos = -35;
				if( the_bird.y < y_min_pos ){
					the_bird.y = y_min_pos;
					the_bird.y_speed = 0;
				}
			});
			
			stage.addEventListener(KeyboardEvent.KEY_DOWN, function(e:KeyboardEvent):void {
				if( e.keyCode == Keyboard.SPACE ){
					the_bird.gravity = 2;
					the_bird.y_speed = -20;
				}
			});
			
			topPipe1.x_speed = -5;
			topPipe1.addEventListener(Event.ENTER_FRAME, function(e:Event):void {
				moveThePipe(e.currentTarget);
			});
			
			bottomPipe1.x_speed = -5;
			bottomPipe1.addEventListener(Event.ENTER_FRAME, function(e:Event):void {
				moveThePipe(e.currentTarget);
			});
			
			topPipe2.x_speed = -5;
			topPipe2.addEventListener(Event.ENTER_FRAME, function(e:Event):void {
				moveThePipe(e.currentTarget);
			});
			
			bottomPipe2.x_speed = -5;
			bottomPipe2.addEventListener(Event.ENTER_FRAME, function(e:Event):void {
				moveThePipe(e.currentTarget);
			});
			
			topPipe3.x_speed = -5;
			topPipe3.addEventListener(Event.ENTER_FRAME, function(e:Event):void {
				moveThePipe(e.currentTarget);
			});
			
			bottomPipe3.x_speed = -5;
			bottomPipe3.addEventListener(Event.ENTER_FRAME, function(e:Event):void {
				moveThePipe(e.currentTarget);
			});
		}
		
		private function moveThePipe(the_pipe):void {
			the_pipe.x += the_pipe.x_speed;
		}
	}
	
}
