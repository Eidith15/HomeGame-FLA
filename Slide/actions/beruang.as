package  actions{
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.display.MovieClip;
	
	
	public class beruang extends MovieClip {
	    protected var posisiAsal = Point;
		
		public function beruang() {
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
				if (dropTarget.parent.name == "omnivora") {
					scaleX = scaleY = 0.8;
					alpha = 0.8;
					y = 200;
					x = 445;
					
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