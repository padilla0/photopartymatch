package clases.ui.chargeScreen
{
	import flash.desktop.NotificationType;
	import flash.display.NativeWindow;
	import flash.display.NativeWindowInitOptions;
	import flash.display.NativeWindowSystemChrome;
	import flash.display.NativeWindowType;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.FileListEvent;
	import flash.events.MouseEvent;
	import flash.filesystem.File;
	import flash.geom.Rectangle;
	import flash.net.FileFilter;
	import flash.net.FileReference;
	
	import clases.image_btn;
	import clases.connection.DBConnection;
	
	import cu.edu.reduc.inf.greenled.lightScreensManager.ScreensManager;
	
	public class ChargeScreen extends Sprite
	{
		
		private var db:DBConnection= new DBConnection();
		private	var id_list:Array = db.getIndex();
		private var file2:File;
		
		private var imgName:Array ;
		
		public function ChargeScreen()
		{
			main_btn.addEventListener(MouseEvent.CLICK, function():void{
				ScreensManager.instance.showScreen("main");
			});
			reset_img.addEventListener(MouseEvent.CLICK, resetImages);
			
			charge_btn.addEventListener(MouseEvent.CLICK,function():void{
				ScreensManager.instance.showScreen("main");
			});
			
			main_btn.addEventListener(MouseEvent.MOUSE_OVER , girar);
			main_btn.addEventListener(MouseEvent.MOUSE_OUT , restablecer);
			
			image_btn.addEventListener(MouseEvent.CLICK, cargar);
			
			chargeok.addEventListener(MouseEvent.CLICK, back);
			
			file2 =   File.documentsDirectory;
			if (id_list.length>1 || (id_list.length==1 && id_list[0]!=-1) ){
				reset_img.visible=true;
			}
		}
		private function resetImages(event:MouseEvent):void
		{
			db.resetImages();
			reset_img.visible=false;
		}
		private function back(event:MouseEvent):void
		{
			chargeok.visible=false;
			charge_btn.visible=true;
			image_btn.visible=true;
			video_btn.visible=true;
			id_list = db.getIndex();
			if (id_list.length>1){
				reset_img.visible=true;
			}
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
		imgName =  new Array();
			for (var i:uint = 0; i < event.files.length; i++) 
			{
				var tmp:File = event.files[i];
				var f:File = File.applicationStorageDirectory;
				var destination:FileReference = f.resolvePath("img/"+tmp.name);
				
				tmp.copyTo(destination,true);
				
				imgName[i]=tmp.name;
				
				
				
			}
			db.insertIMG(imgName);
			
			var comodindestino:FileReference = f.resolvePath("img/comodin.png");
			var aplicationFolder: File = File.applicationDirectory;
			var comodinsource: File = aplicationFolder.resolvePath("img/comodin.png");
			comodinsource.copyTo(comodindestino,true);
			
			notification();
		}
		
	 private function notification():void
	 {
		 charge_btn.visible=false;
		 chargeok.visible=true;
		 image_btn.visible=false;
		 video_btn.visible=false;
		
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