package clases
{
	import flash.display.DisplayObject;
	import flash.display.SimpleButton;
	
	public class match_btn extends SimpleButton
	{
		public function match_btn(upState:DisplayObject=null, overState:DisplayObject=null, downState:DisplayObject=null, hitTestState:DisplayObject=null)
		{
			super(upState, overState, downState, hitTestState);
		}
	}
}