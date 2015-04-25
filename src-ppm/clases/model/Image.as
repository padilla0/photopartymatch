package clases.model
{
	public class Image
	{
		private var _path:String;
		private var _score:uint;

		public function get path():String
		{
			return _path;
		}

		public function set path(value:String):void
		{
			_path = value;
		}

		public function get score():uint
		{
			return _score;
		}

		public function set score(value:uint):void
		{
			_score = value;
		}
	}
}