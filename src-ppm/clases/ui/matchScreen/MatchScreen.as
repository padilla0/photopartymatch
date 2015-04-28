package clases.ui.matchScreen
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.filesystem.File;
	import flash.net.FileReference;
	
	import clases.connection.DBConnection;
	
	import cu.edu.reduc.inf.greenled.lightScreensManager.ScreensManager;
	
	public class MatchScreen extends Sprite
	{
		public function MatchScreen()
		{
			super();
			main_btn.addEventListener(MouseEvent.CLICK, goMainScreen);
			
			main_btn.addEventListener(MouseEvent.MOUSE_OVER , girar);
			main_btn.addEventListener(MouseEvent.MOUSE_OUT , restablecer);
			
			var db:DBConnection = new DBConnection();
			
			var id_list:Array = db.getIndex();
			var name_list:Array = db.getNames();
			
			
			
			
			var appStorage:File = File.applicationStorageDirectory;
			
			
			
			imgLeft.source= appStorage.resolvePath("img/"+name_list[0]).url;
			imgRight.source=appStorage.resolvePath("img/"+name_list[1]).url;
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