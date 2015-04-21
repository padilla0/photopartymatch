package clases
{
	import flash.display.MovieClip;
	import flash.events.MouseEvent;

	public class Main extends MovieClip
	{
		public function Main()
		{
			match_btn.addEventListener(MouseEvent.CLICK,function():void{ trace("match");
			/*ScreensManager.instance.showScreen("match")*/});
			charge_btn.addEventListener(MouseEvent.CLICK,function():void{ trace("charge");
			/*ScreensManager.instance.showScreen("charge")*/});
		}
	}
}