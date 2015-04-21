package
{
	import flash.display.DisplayObjectContainer;
	import flash.display.Sprite;
	
	import clases.Charge;
	
	import cu.edu.reduc.inf.greenled.lightScreensManager.ScreensManager;
	
	public class ppm extends Sprite
	{
		private var screenObjectContainer:DisplayObjectContainer;
		public function ppm()
		{
			screensContainer = new Sprite ();
			addChild(screensContainer);
			ScreensManager.instance.screensContainer = screensContainer;
            ScreensManager.instance.addScreen("main",Main);
			ScreensManager.instance.addScreen("match",Match);
			ScreensManager.instance.addScreen("Charge",Charge);
			ScreensManager.instance.showScreen("main");

		}
	}
}