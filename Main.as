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
					if( the_bird.hitTestObject(topPipe1) || the_bird.hitTestObject(bottomPipe1) ||
						the_bird.hitTestObject(topPipe2) || the_bird.hitTestObject(bottomPipe2) ||
						the_bird.hitTestObject(topPipe3) || the_bird.hitTestObject(bottomPipe3) ){
							game_over = true;

							the_bird.y_speed = 0;

							topPipe1.x_speed = 0;
							bottomPipe1.x_speed = 0;
							topPipe2.x_speed = 0;
							bottomPipe2.x_speed = 0;
							topPipe3.x_speed = 0;
							bottomPipe3.x_speed = 0;

              score_trigger.x_speed = 0;
					}

          if( the_bird.hitTestObject(score_trigger)){
            trace("ouch");
            score++;
            trace(score);
            score_trigger.y = bottomPipe1.y;
          }
				}
			});

			stage.addEventListener(KeyboardEvent.KEY_DOWN, function(e:KeyboardEvent):void {
				if( !game_over && e.keyCode == Keyboard.SPACE ){
					the_bird.gravity = 2;
					the_bird.y_speed = -20;

					topPipe1.x_speed = -5;
					bottomPipe1.x_speed = -5;

					topPipe2.x_speed = -5;
					bottomPipe2.x_speed = -5;

					topPipe3.x_speed = -5;
					bottomPipe3.x_speed = -5;

          score_trigger.x_speed = -5;
				}
			});

			topPipe1.x_speed = 0;
			topPipe1.addEventListener(Event.ENTER_FRAME, function(e:Event):void {
				moveThePipe(e.currentTarget);
			});

			bottomPipe1.x_speed = 0;
			bottomPipe1.addEventListener(Event.ENTER_FRAME, function(e:Event):void {
				moveThePipe(e.currentTarget);
			});

			topPipe2.x_speed = 0;
			topPipe2.addEventListener(Event.ENTER_FRAME, function(e:Event):void {
				moveThePipe(e.currentTarget);
			});

			bottomPipe2.x_speed = 0;
			bottomPipe2.addEventListener(Event.ENTER_FRAME, function(e:Event):void {
				moveThePipe(e.currentTarget);
			});

			topPipe3.x_speed = 0;
			topPipe3.addEventListener(Event.ENTER_FRAME, function(e:Event):void {
				moveThePipe(e.currentTarget);
			});

			bottomPipe3.x_speed = 0;
			bottomPipe3.addEventListener(Event.ENTER_FRAME, function(e:Event):void {
				moveThePipe(e.currentTarget);
			});

      score_trigger.x_speed = 0;
      var min_x:int = int.MAX_VALUE;
      score_trigger.addEventListener(Event.ENTER_FRAME, function(e:Event):void {
        if( score_trigger.x + score_trigger.width < 0 ){
          score_trigger.y = bottomPipe1.y - score_trigger.height;
        }

        moveThePipe(e.currentTarget);
      })
		}

		private function moveThePipe(the_pipe):void {
      var pipe_distance:int = 200;
      if( the_pipe.x + the_pipe.width < 0 ){
        the_pipe.x = the_pipe.x + 3*pipe_distance;
      }

			the_pipe.x += the_pipe.x_speed;
		}
	}

}
