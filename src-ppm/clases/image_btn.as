package clases
{
	import flash.display.DisplayObject;
	import flash.display.SimpleButton;
	
	public class image_btn extends SimpleButton
	{
		public function image_btn(upState:DisplayObject=null, overState:DisplayObject=null, downState:DisplayObject=null, hitTestState:DisplayObject=null)
		{
			super(upState, overState, downState, hitTestState);
			
		}
	}
}