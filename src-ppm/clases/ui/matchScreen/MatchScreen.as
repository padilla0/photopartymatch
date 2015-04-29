package clases.ui.matchScreen
{
	import com.greensock.easing.SlowMo;
	
	import flash.display.Loader;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.display3D.IndexBuffer3D;
	import flash.events.MouseEvent;
	import flash.filesystem.File;
	import flash.globalization.NumberParseResult;
	import flash.net.FileReference;
	import flash.net.NetConnection;
	import flash.sampler.NewObjectSample;
	
	import clases.connection.DBConnection;
	
	import cu.edu.reduc.inf.greenled.lightScreensManager.ScreensManager;
	
	import flashx.textLayout.conversion.FormatDescriptor;
	
	public class MatchScreen extends Sprite
	{
		private var appStorage:File = File.applicationStorageDirectory;
		private var selectR:Number;
		private var selectL:Number;
		private var db:DBConnection = new DBConnection();
		private	var id_list:Array = db.getIndex();
		private var name_list:Array = db.getNames(id_list);
		private var winners:Array = new Array();
		private var taked:Number = -1;
	
		
		public function MatchScreen()
		{
			super();
			
			main_btn.addEventListener(MouseEvent.CLICK, goMainScreen);
			
			main_btn.addEventListener(MouseEvent.MOUSE_OVER , girar);
			main_btn.addEventListener(MouseEvent.MOUSE_OUT , restablecer);	
		
			
			imgLeft.addEventListener(MouseEvent.CLICK, winnerL);
			imgRight.addEventListener(MouseEvent.CLICK, winnerR);
			
			///
			trace("id list "+id_list);
			trace("name list "+name_list);
			if (id_list.length!=1){
			selectL = myRandom(id_list.length,false);
			imgLeft.source= appStorage.resolvePath("img/"+name_list[selectL]).url;
			
			
			selectR = myRandom(id_list.length,true);
			imgRight.source=appStorage.resolvePath("img/"+name_list[selectR]).url;
			}else
			{
				imgLeft.visible=false;
				imgRight.visible=false;
				winner_lb.visible=true;
				trace(name_list[0]);
				imgWinner.source = appStorage.resolvePath("img/"+name_list[0]).url;
			
				match_btn.visible=false;
				
			}
			
		}
		private function winnerL( event:MouseEvent):void
		{
			db.insertBattle(id_list[selectL],id_list[selectR],id_list[selectL]);
			winners.push(id_list[selectL]);
			rounds();
		}
		private function winnerR( event:MouseEvent):void
		{
			db.insertBattle(id_list[selectL],id_list[selectR],id_list[selectR]);
			winners.push(id_list[selectR]);
			rounds();
		}
		private function rounds():void
		{
			nextR.visible=false;
			trace("lista de winners "+winners);
			update();
			
			
				if (id_list.length!=0)
					matching();
				else{
					
					db.insertBattle(-1,-1,-1);
					nextR.visible=true;
					trace("NEXT ROUND");
					id_list=winners;
					name_list=db.getNames(id_list);
					winners= new Array();
					if (name_list.length==1){
						trace("WINNER is"+name_list[0]);
						imgLeft.visible=false;
						imgRight.visible=false;
						match_btn.visible=false;
						nextR.visible=false;
						winner_lb.visible=true;
						imgWinner.source= appStorage.resolvePath("img/"+name_list[0]).url;
						imgWinner.visible=true;
					}
					else
						matching();
				}
			
			
		}
		
		private function matching():void
		{
			trace(name_list);
			
			selectL = myRandom(id_list.length,false);
			imgLeft.source= appStorage.resolvePath("img/"+name_list[selectL]).url;
			
			
			
			selectR = myRandom(id_list.length,true);
			imgRight.source=appStorage.resolvePath("img/"+name_list[selectR]).url;
			
			
		}
		
		private function myRandom(length:uint,b:Boolean):Number
		{
			var select:Number;
			

			while(true)	{		
				var aux:String = Math.random().toString().slice(2,3);
				var random:Number =  new Number(aux);
			if (random<length)
				select=random;
			else
				select=random % length;
			
			if (!b || select!=taked ||length==1)
				break;
			}
			if (!b)
				taked=select;
	
		
			
			trace("random select = "+select);
			return select;
		}
		
		private function update():void
		{
			
			id_list=id_list.filter(compare);
			
			name_list=name_list.filter(compare);	
			
		}
	
		private function compare(element:*, index:int, arr:Array):Boolean {
			
				
				return (index != selectL && index!=selectR);
				
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