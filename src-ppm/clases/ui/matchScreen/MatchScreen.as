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
		}
		private function goMainScreen(event:MouseEvent):void
		{
			ScreensManager.instance.showScreen("main");
		}
	}
}