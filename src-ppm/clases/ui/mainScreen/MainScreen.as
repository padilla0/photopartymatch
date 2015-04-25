package clases.ui.mainScreen
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.system.fscommand;
	
	import clases.charge_btn;
	import clases.image_btn;
	import clases.match_btn;
	import clases.video_btn;
	
	import cu.edu.reduc.inf.greenled.lightScreensManager.ScreensManager;
	
	public class MainScreen extends Sprite
	{
		var inCharge:Boolean ;
		public function MainScreen()
		{
			super();
			inCharge=false;
			
			
			match_btn.addEventListener(MouseEvent.CLICK,function():void{ trace("MATCH");
				
				
				ScreensManager.instance.showScreen("match");
			
			});
			charge_btn.addEventListener(MouseEvent.CLICK,function():void{
				
				if (!inCharge){
					image_btn.visible=true;
					video_btn.visible=true;
					match_btn.visible=false;
					exit_btn.visible=false;
					inCharge=true;
				}else{
					image_btn.visible=false;
					video_btn.visible=false;
					match_btn.visible=true;
					exit_btn.visible=true;
					inCharge=false;
				}
				
				trace("CHARGE");
				
				
			});
			exit_btn.addEventListener(MouseEvent.CLICK,function():void{ trace("EXIT");
				fscommand("quit");
			});
		}
	}
}