package clases.ui.matchScreen
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.filesystem.File;
	import flash.globalization.NumberParseResult;
	import flash.net.FileReference;
	
	import clases.connection.DBConnection;
	
	import cu.edu.reduc.inf.greenled.lightScreensManager.ScreensManager;
	
	public class MatchScreen extends Sprite
	{
		private var appStorage:File = File.applicationStorageDirectory;
		private var selectR:Number;
		private var selectL:Number;
		private var db:DBConnection = new DBConnection();
		private	var id_list:Array = db.getIndex();
		private var name_list:Array = db.getNames();
		public function MatchScreen()
		{
			super();
			
			main_btn.addEventListener(MouseEvent.CLICK, goMainScreen);
			
			main_btn.addEventListener(MouseEvent.MOUSE_OVER , girar);
			main_btn.addEventListener(MouseEvent.MOUSE_OUT , restablecer);
				
			match_btn.addEventListener(MouseEvent.CLICK,matching);
			
		}
		
		private function matching(event:MouseEvent):void
		{
			selectR = myRandom(id_list.length);
			selectL = myRandom(id_list.length);
			imgLeft.source= appStorage.resolvePath("img/"+name_list[selectL]).url;
			imgRight.source=appStorage.resolvePath("img/"+name_list[selectR]).url;
		}
		
		private function myRandom(length:uint):Number
		{
			var aux:String = Math.random().toString().slice(2,3);
			var random:Number =  new Number(aux);
			trace(random);
			
			var selectR:Number;
			if (random<length)
				selectR=random;
			else
				selectR=random % length;
			
			return selectR;
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