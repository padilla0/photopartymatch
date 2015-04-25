package clases
{
	import flash.display.SimpleButton;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.net.FileReference;
	import flash.net.FileReferenceList;

	public class Charge 
	{
		public function Charge()
		{
			var btnImagen:SimpleButton;
			
			btnImagen.addEventListener(MouseEvent.CLICK,cargarImagenes);
		}
		
		public function cargarImagenes():void
		{
				
			var imagesFilter:FileFilter = new FileFilter("Images", "*.jpg;*.gif;*.png");
			var myFileReference:FileReferenceList = new FileReferenceList();
			myFileReference.browse([imagesFilter]);
			
			
				
			}
		
		}
	}
