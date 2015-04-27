package clases.ui.chargeScreen
{
	import flash.display.Sprite;
	import flash.events.FileListEvent;
	import flash.events.MouseEvent;
	import flash.filesystem.File;
	import flash.net.FileFilter;
	import flash.net.FileReference;
	import flash.net.FileReferenceList;
	
	import clases.image_btn;
	import clases.connection.DBConnection;
	
	import cu.edu.reduc.inf.greenled.lightScreensManager.ScreensManager;
	
	public class ChargeScreen extends Sprite
	{
		
		private var db:DBConnection;
	
		private var file2:File;
		
		private var imgName:Array = new Array();
		
		public function ChargeScreen()
		{
			main_btn.addEventListener(MouseEvent.CLICK, function():void{
				ScreensManager.instance.showScreen("main");
			});
			
			main_btn.addEventListener(MouseEvent.MOUSE_OVER , girar);
			main_btn.addEventListener(MouseEvent.MOUSE_OUT , restablecer);
			
			image_btn.addEventListener(MouseEvent.CLICK, cargar);
			
		
			
			file2 =   File.documentsDirectory;
		}
		
		private function cargar(event:MouseEvent):void
		{
			
			try
			{
				file2.browseForOpenMultiple("Select Files",[new FileFilter("only jpg and png images", "*.jpg;*.png")]);
				file2.addEventListener(FileListEvent.SELECT_MULTIPLE, filesSelected);
				
			}
			catch (error:Error)
			{
				trace("Failed:", error.message);
			}
			
		}
		
	 private function filesSelected(event:FileListEvent):void 
		{
		 db = new DBConnection();
			for (var i:uint = 0; i < event.files.length; i++) 
			{
				var tmp:File = event.files[i];
				var f:File = File.applicationStorageDirectory;
				var destination:FileReference = f.resolvePath("img/"+tmp.name);
				
				tmp.copyTo(destination,true);
				
				imgName[i]=tmp.name;
			}
			db.insertIMG(imgName);
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