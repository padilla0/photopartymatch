package clases
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.net.FileFilter;
	import flash.net.FileReference;
	import flash.net.FileReferenceList;
	import flash.system.fscommand;

	public class Main extends MovieClip
	{
		var inCharge:Boolean ;
		var imagesFilter:FileFilter = new FileFilter("Images", "*.jpg;*.gif;*.png");
		var myFileReference:FileReferenceList = new FileReferenceList();	
		
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
			
			image_btn.addEventListener(MouseEvent.CLICK,cargar);
			
			 function cargar():void
			{
				myFileReference.addEventListener(Event.SELECT,selectHandler);
				myFileReference.browse([imagesFilter]);
									
			}
			 			 			 
			 function selectHandler(event:Event):void {
				 trace("selectHandler: " + myFileReference.fileList.length + " files");
				
				 var file:FileReference= new FileReference();
				 for (var i:uint = 0; i < myFileReference.fileList.length; i++) {
					 file = FileReference(myFileReference.fileList[i]);
					 trace(file.name);
					 
				 }
			 } 
				 
			exit_btn.addEventListener(MouseEvent.CLICK,function():void{ trace("EXIT");
				fscommand("quit");
			});
		}
	}
}