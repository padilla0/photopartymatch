package clases.ui.matchScreen
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
	import clases.ui.mainScreen.MainScreen;
	
	import cu.edu.reduc.inf.greenled.lightScreensManager.ScreensManager;
	
	public class MatchScreen extends Sprite
	{
		public function MatchScreen()
		{
			super();
			main_btn.addEventListener(MouseEvent.CLICK, goMainScreen);
			
			main_btn.addEventListener(MouseEvent.MOUSE_OVER , girar);
			main_btn.addEventListener(MouseEvent.MOUSE_OUT , restablecer);
		
			
		}
		
		
		
		private function goMainScreen(event:MouseEvent):void
		{
			ScreensManager.instance.showScreen("main");
		}
		
		private function girar(event:MouseEvent):void
		{
			main_btn.rotationY = main_btn.rotationY+5;
		}
		private function restablecer(event:MouseEvent):void
		{
			main_btn.rotationY = main_btn.rotationY-5;
		}
	}
}