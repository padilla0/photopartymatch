package clases.connection
{
	import flash.data.SQLConnection;
	import flash.data.SQLMode;
	import flash.data.SQLResult;
	import flash.data.SQLStatement;
	import flash.errors.SQLError;
	import flash.filesystem.File;

	public class DBConnection
	{
		
		private  var conn:SQLConnection = new SQLConnection();
		private  var _lp:Array; 
		
		private var folder: File = File.applicationDirectory;
		private var dbFolder: File = folder.resolvePath("db");		
		private var dbFile: File = dbFolder.resolvePath("ppm_db.db3");
		
		public function DBConnection()
		{
			try {
				conn.open(dbFile, SQLMode.CREATE);
				
			
				trace("conection ok");
				
				if(isEmpty())
					initBattle();
				if(isEmptyI())
					initImage();
			} catch (error: SQLError) {
				trace("Error message:", error.message);
				trace("Details:", error.details);
			}
			
			}
		
		public function isEmptyI():Boolean
		{
			var selectStmt:SQLStatement = new SQLStatement();
			
			selectStmt.sqlConnection = conn;
			selectStmt.text="select id_img from image";
			selectStmt.execute();
			var r:SQLResult = selectStmt.getResult();
			
			if (r.data != null)
				return false;
			else
				return true;
		}
		public function resetImages():void
		{
			var deleteStmt:SQLStatement = new SQLStatement();
			deleteStmt.sqlConnection = conn;
			deleteStmt.text="delete from image ";
			deleteStmt.execute();
		}
		private function isEmpty():Boolean
		{
			var selectStmt:SQLStatement = new SQLStatement();
			
			selectStmt.sqlConnection = conn;
			selectStmt.text="select winner from battle";
			selectStmt.execute();
			var r:SQLResult = selectStmt.getResult();
			
			if (r.data != null)
			 	return false;
			else
				return true;
		}
		private function initBattle():void
		{
			var insertStmt:SQLStatement = new SQLStatement();
			
			insertStmt.sqlConnection = conn;
			insertStmt.text = "INSERT INTO battle(idL, idR, winner)"
				+ "VALUES (-1,-1,-1)";
			insertStmt.execute();
		}
		private function initImage():void
		{
			var insertStmt:SQLStatement = new SQLStatement();
			
			insertStmt.sqlConnection = conn;
			insertStmt.text = "INSERT INTO image(id_img, image_name)"
				+ "VALUES (-1,'database_empty.png')";
			insertStmt.execute();
		}
		
		public function insertIMG(imgName:Array):void{
			try {
				
				var deleteStmt:SQLStatement = new SQLStatement();
				deleteStmt.sqlConnection = conn;
				deleteStmt.text="delete from image where id_img=-1";
				deleteStmt.execute();
			
				var insertStmt:SQLStatement = new SQLStatement();
			
				insertStmt.sqlConnection = conn;
				for(var i:int=0;i<imgName.length;i++){
					
						insertStmt.text = "INSERT INTO image(image_name)"
							+ "VALUES (?)";
						insertStmt.parameters[0] = imgName[i];
						
						insertStmt.execute();
						trace("new image name inserted");
					}
				
			} catch (error: SQLError) {
				trace("Error message:", error.message);
				trace("Details:", error.details);
			}
		}
		
		public function getIndex():Array
		{
		
			
			var list:Array = new Array();
			var lastRound:Array = new Array();
			try {
				var selectStmt:SQLStatement = new SQLStatement();
				var inRound:Boolean = false;
				selectStmt.sqlConnection = conn;
				//////
			selectStmt.text =  "select winner from battle";
				
				selectStmt.execute();
				var r:SQLResult = selectStmt.getResult();
			
				if (r!=null){
					var numRow:int = r.data.length;
					
					for (var j:int = numRow-1; j >= 0; j--) 
					{
						
						var row0:Object = r.data[j];
						if (row0.winner!=-1 && inRound==false)
							break;
						else if (row0.winner == -1 && inRound==true){
							trace("last Round = "+lastRound);
							return lastRound;
						}else if (row0.winner==-1 && inRound==false)
							inRound=true;
						else if (row0.winner != -1 && inRound==true)
							lastRound.push(row0.winner);
					}
					
				}
				
				//////
				selectStmt.text = "select id_img from image ";
					
				selectStmt.execute();
				
				var result:SQLResult = selectStmt.getResult();
				if (result != null)
				{
					
					var numRows:int = result.data.length;
					
					for (var i:int = 0; i < numRows; i++)
					{
						var row: Object = result.data[i];
						
							list.push(row.id_img);
						
					}
					if (!result.complete)
					{
						selectStmt.next();
					}
				}
				
				trace("index de las fotos recogido");
				trace("list = "+list);
			
				
				
				
				
			} catch (error: SQLError) {
				trace("Error message:", error.message);
				trace("Details:", error.details);
			}
			return list;
		}
		
		public function insertBattle(idl:int, idr:int, w:int):void
		{
				try{
					var insertStmt:SQLStatement = new SQLStatement();
					
					insertStmt.sqlConnection = conn;
			
						
						insertStmt.text = "INSERT INTO battle(idL, idR, winner)"
							+ "VALUES (?,?,?)";
						insertStmt.parameters[0] = idl;
						insertStmt.parameters[1] = idr;
						insertStmt.parameters[2] = w;
						insertStmt.execute();
						trace("new battle inserted");
					
					
				} catch (error: SQLError) {
					trace("Error message:", error.message);
					trace("Details:", error.details);
				}
		}
		
		
		public function getNames(id_list:Array):Array
		{
			//conn.open(dbFile);
			var list:Array = new Array();
			try {
				var selectStmt:SQLStatement = new SQLStatement();
				
				selectStmt.sqlConnection = conn;
				
				for (var j:int = 0; j < id_list.length; j++) 
				{
					selectStmt.text = "select image_name from image  where image.id_img=?";
					selectStmt.parameters[0] = id_list[j];
					selectStmt.execute();
					var result:SQLResult = selectStmt.getResult();
					if (result != null)
					{
							var row: Object = result.data[0];
							list.push(row.image_name);
					}
				}
				
				
		
				trace("nombres de las fotos recogido");
				
				
			} catch (error: SQLError) {
				trace("Error message:", error.message);
				trace("Details:", error.details);
			}
			return  list;
		}
		
		
		
		public function get lp():Array
		{
			return _lp;
		}
		
		public function set lp(value:Array):void
		{
			_lp = value;
		}
			
	}
}