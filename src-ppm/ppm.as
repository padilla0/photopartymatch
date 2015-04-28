package
{
	import flash.display.DisplayObjectContainer;
	import flash.display.Sprite;
	
	import clases.ui.chargeScreen.ChargeScreen;
	import clases.ui.mainScreen.MainScreen;
	import clases.ui.matchScreen.MatchScreen;
	import clases.ui.notificationScreen.NotificationScreen;
	
	import cu.edu.reduc.inf.greenled.lightScreensManager.ScreensManager;
	
	public class ppm extends Sprite
	{
		private var screensContainer:DisplayObjectContainer;
		public function ppm()
		{
			screensContainer = new Sprite ();
			addChild(screensContainer);
			ScreensManager.instance.screensContainer = screensContainer;
            ScreensManager.instance.addScreen("main",MainScreen);
			ScreensManager.instance.addScreen("match",MatchScreen);
			ScreensManager.instance.addScreen("charge",ChargeScreen);
			ScreensManager.instance.addScreen("notification",NotificationScreen);
			ScreensManager.instance.showScreen("main");
		}
	}
}