
	package commons;

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
		
		protected AssocArrayList statements;
		
		public String row_cols;
		public AssocArrayList rowValues;
		
		public DbMySql {
		
			connection = DriverManager.getConnection ( connectionUrl + dbName + "?useUnicode=yes&characterEncoding=UTF-8", userId, password );
		}
		
		public boolean update ( String query_name, String sql_update ) {
			
			statemens.add ( query_name, connection.createStatement() );
			return statements.giveMe( query_name).exequteUpdate ( sql_update );
		}
		
		public boolean select ( String query_name, String sql_select,  String row_cols ) {
			
			
		}
		
		
		public AssocArrayList giveSelectedRow ( ) {
		
		}
		
	}