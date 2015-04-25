package clases.ui.mainScreen
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.system.fscommand;
	
	import clases.charge_btn;
	import clases.match_btn;
	
	import cu.edu.reduc.inf.greenled.lightScreensManager.ScreensManager;
	
	public class MainScreen extends Sprite
	{
		public function MainScreen()
		{
			match_btn.addEventListener(MouseEvent.CLICK,function():void{ trace("MATCH");
				ScreensManager.instance.showScreen("match");
			});
			
			charge_btn.addEventListener(MouseEvent.CLICK,function():void{
				ScreensManager.instance.showScreen("charge");
			});
			
			exit_btn.addEventListener(MouseEvent.CLICK,function():void{ trace("EXIT");
				fscommand("quit");
			});
		}
	}
}