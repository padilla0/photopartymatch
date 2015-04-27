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
		
		private  var conn:SQLConnection;
		private  var _lp:Array; 
		
		public function DBConnection()
		{
			
				conn = new SQLConnection();
				var folder: File = File.applicationDirectory;
				var dbFolder: File = folder.resolvePath("db");		
				var dbFile: File = dbFolder.resolvePath("ppm_db.db3");
			//	var selectStmt:SQLStatement = new SQLStatement();
			//	selectStmt.sqlConnection = conn;
			
				//selectStmt.text = "select id_img from image"; 
				try {
					conn.open(dbFile, SQLMode.CREATE);
				
					//selectStmt.execute();	
					trace("conection ok");
				} catch (error: SQLError) {
					trace("Error message:", error.message);
					trace("Details:", error.details);
				}
				//var result: SQLResult = selectStmt.getResult();
			}
		
		public function insertIMG(imgName:Array):void{
			try {
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