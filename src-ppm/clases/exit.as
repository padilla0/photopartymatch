package clases
{
	import flash.display.DisplayObject;
	import flash.display.SimpleButton;
	
	public class exit extends SimpleButton
	{
		public function exit(upState:DisplayObject=null, overState:DisplayObject=null, downState:DisplayObject=null, hitTestState:DisplayObject=null)
		{
			super(upState, overState, downState, hitTestState);
		}
	}
}