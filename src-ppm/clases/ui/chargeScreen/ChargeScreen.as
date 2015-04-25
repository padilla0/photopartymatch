package clases.ui.chargeScreen
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.net.FileFilter;
	import flash.net.FileReference;
	import flash.net.FileReferenceList;
	
	import clases.image_btn;
	
	import cu.edu.reduc.inf.greenled.lightScreensManager.ScreensManager;
	
	public class ChargeScreen extends Sprite
	{
		private var myFileReference:FileReferenceList;
		
		public function ChargeScreen()
		{
			main_btn.addEventListener(MouseEvent.CLICK, function():void{
				ScreensManager.instance.showScreen("main");
			});
			
			image_btn.addEventListener(MouseEvent.CLICK, cargar);
			
			myFileReference = new FileReferenceList ();
		}
		
		private function cargar(event:MouseEvent):void
		{
			myFileReference.addEventListener(Event.SELECT,selectHandler);
			myFileReference.browse([new FileFilter("Images", "*.jpg;*.png")]);
		}
		
		private function selectHandler(event:Event):void {
			trace("selectHandler: " + myFileReference.fileList.length + " files");
			
			var file:FileReference= new FileReference();
			for (var i:uint = 0; i < myFileReference.fileList.length; i++) {
				file = FileReference(myFileReference.fileList[i]);
				trace(file.name);
			}
		} 
	}
}