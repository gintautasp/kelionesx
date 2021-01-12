
	import java.sql.DriverManager;
	import java.sql.ResultSet;
	import java.sql.Statement;
	import java.sql.Connection;

	class DbMySql {
	
		public String driverName = "com.mysql.jdbc.Driver";
		public String connectionUrl = "jdbc:mysql://localhost:3306/";
		public String dbName = "keliones";
		public String userId = "root";
		public String password = "";
		
		public Connection connection;
		
		public DbMySql {
		
			connection = DriverManager.getConnection ( connectionUrl + dbName + "?useUnicode=yes&characterEncoding=UTF-8", userId, password );
		}
		
		
		
	}