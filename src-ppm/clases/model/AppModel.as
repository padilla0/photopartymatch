package clases.model
{
	public class AppModel
	{
		private static var _instance:AppModel;
		
		private var _imagesPath:String;
		private var images:Array;
		
		public function AppModel(se:SE){
			images = new Array ();
		}

		public static function get instance():AppModel
		{
			if (_instance == null) _instance = new AppModel (new SE());
			return _instance;
		}

		public function get imagesPath():String
		{
			return _imagesPath;
		}

		public function set imagesPath(value:String):void
		{
			_imagesPath = value;
		}
	}
}
class SE {}