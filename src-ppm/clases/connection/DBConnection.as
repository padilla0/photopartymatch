package clases.connection
{
	import com.greensock.loading.ImageLoader;
	
	import flash.data.SQLConnection;
	import flash.data.SQLMode;
	import flash.data.SQLResult;
	import flash.data.SQLStatement;
	import flash.errors.SQLError;
	import flash.filesystem.File;
	
	import clases.model.Image;

	public class DBConnection
	{
		
		private  var conn:SQLConnection = new SQLConnection();
		private  var _lp:Array; 
		
		private var folder: File = File.applicationDirectory;
		private var dbFolder: File = folder.resolvePath("db");		
		private var dbFile: File = dbFolder.resolvePath("ppm_db.db3");
		
		public function DBConnection()
		{
			/* var conn = new SQLConnection();
			
				var folder: File = File.applicationDirectory;
				var dbFolder: File = folder.resolvePath("db");		
				var dbFile: File = dbFolder.resolvePath("ppm_db.db3");*/
			//	var selectStmt:SQLStatement = new SQLStatement();
			//	selectStmt.sqlConnection = conn;
			
				//selectStmt.text = "select id_img from image"; 
				/*try {
					conn.open(dbFile, SQLMode.CREATE);
				
					//selectStmt.execute();	
					trace("conection ok");
				} catch (error: SQLError) {
					trace("Error message:", error.message);
					trace("Details:", error.details);
				}*/
				//var result: SQLResult = selectStmt.getResult();
			}
		
		public function insertIMG(imgName:Array):void{
			try {
				
				try {
					conn.open(dbFile, SQLMode.CREATE);
					
					//selectStmt.execute();	
					trace("conection ok");
				} catch (error: SQLError) {
					trace("Error message:", error.message);
					trace("Details:", error.details);
				}
				
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
		
			conn.open(dbFile);
			var list:Array = new Array();
			try {
				var selectStmt:SQLStatement = new SQLStatement();
				
				selectStmt.sqlConnection = conn;
				
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
				
				
			} catch (error: SQLError) {
				trace("Error message:", error.message);
				trace("Details:", error.details);
			}
			return  list;
		}
		
		
		public function getNames():Array
		{
			//conn.open(dbFile);
			var list:Array = new Array();
			try {
				var selectStmt:SQLStatement = new SQLStatement();
				
				selectStmt.sqlConnection = conn;
				
				selectStmt.text = "select image_name from image ";
				
				selectStmt.execute();
				
				var result:SQLResult = selectStmt.getResult();
				if (result != null)
				{
					var numRows:int = result.data.length;
					for (var i:int = 0; i < numRows; i++)
					{
						var row: Object = result.data[i];
						list.push(row.image_name);
						
					}
					if (!result.complete)
					{
						selectStmt.next();
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