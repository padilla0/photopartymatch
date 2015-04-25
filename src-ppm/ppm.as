package
{
	import flash.display.DisplayObjectContainer;
	import flash.display.Sprite;
	
	import clases.ui.chargeScreen.ChargeScreen;
	import clases.ui.mainScreen.MainScreen;
	import clases.ui.matchScreen.MatchScreen;
	
	import cu.edu.reduc.inf.greenled.lightScreensManager.ScreensManager;
	
	public class ppm extends Sprite
	{
		private var screensContainer:DisplayObjectContainer;
		public function ppm()
		{
			screensContainer = new Sprite ();
			addChild(screensContainer);
			ScreensManager.instance.screensContainer = screensContainer;
            ScreensManagerinstance.addScreen("main",MainScreen);
			ScreensManager.instance.addScreen("match",MatchScreen);
			ScreensManager.instance.addScreen("charge",ChargeScreen);
			ScreensManager.instance.showScreen("main");
		}
	}
}