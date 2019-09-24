package actions{
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.display.MovieClip;
	
	
	public class tiger extends MovieClip {
	    protected var posisiAsal = Point;
		
		public function tiger() {
			posisiAsal = new Point(x, y);
			buttonMode = true;
			addEventListener(MouseEvent.MOUSE_DOWN, down);
		}
		
		protected function down(e:MouseEvent): void{
			parent.addChild(this);
			startDrag();
			addEventListener(MouseEvent.MOUSE_UP, up);
		}
		
		protected function up(e:MouseEvent): void{
			stage.removeEventListener(MouseEvent.MOUSE_UP, up);
			stopDrag();
			
			if (dropTarget) {
				if (dropTarget.parent.name == "karnivora") {
					scaleX = scaleY = 0.8;
					alpha = 0.7;
					y = 200;
					x = 300;
					
					buttonMode = false;
					removeEventListener (MouseEvent.MOUSE_DOWN, down);
				}else {
					kembaliKeAsal();
				}
			}else {
				kembaliKeAsal();
			}
		}
		
		protected function kembaliKeAsal(): void {
			x = posisiAsal.x;
			y = posisiAsal.y;
		}
	}
}