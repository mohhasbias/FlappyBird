package  {

	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;


	public class Main extends MovieClip {

		public function Main() {
			var game_over:Boolean = false;
      var score:int = 0;

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

				if(!game_over ){
					if( the_bird.hitTestObject(pipe1.topPipe1) || the_bird.hitTestObject(pipe1.bottomPipe1) ){
							game_over = true;

							the_bird.y_speed = 0;

							pipe1.x_speed = 0;
					}

          if( the_bird.hitTestObject(pipe1.score_trigger)){
            trace("ouch");
            score++;
            trace(score);
            pipe1.score_trigger.y = pipe1.bottomPipe1.y;
          }
				}
			});

			stage.addEventListener(KeyboardEvent.KEY_DOWN, function(e:KeyboardEvent):void {
				if( !game_over && e.keyCode == Keyboard.SPACE ){
					/*the_bird.gravity = 2;
					the_bird.y_speed = -20;*/

					pipe1.x_speed = -5;
				}
			});

			pipe1.x_speed = 0;
			pipe1.addEventListener(Event.ENTER_FRAME, function(e:Event):void {
				moveThePipe(e.currentTarget);
			});
		}

		private function moveThePipe(the_pipe):void {
      var pipe_distance:int = 200;
      if( the_pipe.x + the_pipe.width < 0 ){
        the_pipe.x = the_pipe.x + 3*pipe_distance;
        the_pipe.score_trigger.y = the_pipe.bottomPipe1.y - the_pipe.score_trigger.height;
      }

			the_pipe.x += the_pipe.x_speed;
		}
	}

}
