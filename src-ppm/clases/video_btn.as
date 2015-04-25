package clases
{
	import flash.display.DisplayObject;
	import flash.display.SimpleButton;
	
	public class video_btn extends SimpleButton
	{
		public function video_btn(upState:DisplayObject=null, overState:DisplayObject=null, downState:DisplayObject=null, hitTestState:DisplayObject=null)
		{
			super(upState, overState, downState, hitTestState);
		}
	}
}