package clases
{
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.system.fscommand;

	public class Main extends MovieClip
	{
		var inCharge:Boolean ;
		
		
		public function Main()
		{
			inCharge=false;
			
			
			match_btn.addEventListener(MouseEvent.CLICK,function():void{ trace("MATCH");
			
			
			/*ScreensManager.instance.showScreen("match")*/});
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