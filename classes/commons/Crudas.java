
	package commons;
	
	import java.sql.DriverManager;
	import java.sql.ResultSet;
	import java.sql.Statement;
	import java.sql.Connection;

	public class Crudas {
		
		public String[] lent_lauk;
		public String name_db;
		public String passwd;
		public String serv; 
		public String lent;
		public String user;
		
		private Connection connection = null;
		private Statement statement_take = null;
		private Statement statement_change = null;
		private ResultSet resultSet = null;
		private int resultSetChange;
		private String comma = "";

		public Crudas() {
			
		}
		
		public Crudas ( String name_database, String user_name, String password, String server, String lentele, String[] lent_laukai ) {
			
			name_db = name_database;
			user = user_name;
			passwd = password;
			serv = server;
			lent = lentele;
			lent_lauk = lent_laukai;
			
			try {
			
				connection = DriverManager.getConnection ( serv + name_db + "?useUnicode=yes&characterEncoding=UTF-8", user, password );
				
			} catch( Exception e ) {
				
				e.printStackTrace( System.out );
				
			}
		}
		
		public Integer ivesti ( String[] lent_lauk_reiksmes ) {
			
			String sql_ins = "";
			String str_lauk = "";

			
			for ( int i = 0; i < lent_lauk.length; i++ ) {
			
				str_lauk = str_lauk + comma + "`" + lent_lauk [ i ] + "`";
				sql_ins =  sql_ins + comma  + "'" + lent_lauk_reiksmes [ i ] + "'";
				comma = ",";																													// sql_ins = sql_ins + "'" + Miestai.value + "'";
			}
			
			sql_ins = 
				"INSERT INTO `" + lent + "`"
				+ " ( " + str_lauk + " )"
				+ " VALUES ( "			
				+ sql_ins
				+ " )";

			System.out.println ( sql_ins );
			
			
			try {

				statement_change = connection.createStatement();
				resultSetChange = statement_change.executeUpdate(sql_ins);			
				
			} catch ( Exception e ) {
				
				e.printStackTrace( System.out );
			}
			return resultSetChange;
		}
		
		public Integer update ( String[] lent_lauk_reiksmes, String id_irasymas) {
			
			String sql_upd = "";
			comma = ",";	

			sql_upd += "UPDATE `" + lent + "` SET " ;
			
				for ( int i = 0; i < lent_lauk.length; i++ ) {
				
				sql_upd += "`" + (  lent_lauk [ i ]  ) +"`";
				sql_upd += "='" + (  lent_lauk_reiksmes [ i ] ) + "'" + comma; 
				} 
				
				sql_upd = sql_upd.substring(0,sql_upd.length()- 1);
				
				sql_upd += " WHERE `" + lent + "`.`id` ='"+ id_irasymas +"'";
			
			System.out.println ( sql_upd );
			
			try {

				statement_change = connection.createStatement();
				resultSetChange = statement_change.executeUpdate(sql_upd);			
				
			} catch ( Exception e ) {
				
				e.printStackTrace( System.out );
			}
			return resultSetChange;
		}	

		public Integer delete ( String id_irasymas ) {
			
			String sql_del = "";
			
			sql_del = "DELETE FROM `"+ lent +"` WHERE `"+ lent +"`.`id`='"+ id_irasymas +"'";

			System.out.println ( sql_del );
			
			
			try {

				statement_change = connection.createStatement();
				resultSetChange = statement_change.executeUpdate(sql_del);			
				
			} catch ( Exception e ) {
				
				e.printStackTrace( System.out );
			}
			return resultSetChange;
		}			
		
		
		public String lentele()  {
			
			try {
			
				statement_take = connection.createStatement();		
				String sql ="SELECT *, `punktai`.`pav` AS `pavadinimas`, `antras`.`pav` AS `pavadinimas2` FROM `marsrutu_atkarpos`"
							+ " LEFT JOIN `punktai` ON ( `punktai`.`id` = `marsrutu_atkarpos`.`id_punkto1` ) "
							+ " LEFT JOIN `punktai` AS `antras` ON ( `antras`.`id` = `marsrutu_atkarpos`.`id_punkto2` ) "
							+ "	WHERE 1";

				resultSet = statement_take.executeQuery( sql );
			 
				while( resultSet.next() ){
					
					String rec_data = "";

					for ( int i = 0; i<lent_lauk.length; i++ ) {
			
						rec_data += " data-" + lent_lauk [ i ] + "=\"" + resultSet.getString ( lent_lauk [ i ] ) + "\"";
					}
						
					String id_rec = resultSet.getString ( "id" );
					
					String id_marsrutu_atkarpos = resultSet.getString ( "id" );
								
					String pav = resultSet.getString ( "pav" );
					
					lent += "<tr>";
		
					for ( int i = 0; i < lent_lauk.length - 2; i++ ) {
				
						lent += "<td>" + resultSet.getString (  lent_lauk [ i ]  ) + "</td>";

					}
					lent += "<td> " + resultSet.getString ("pavadinimas") + "</td>";
					lent += "<td>" + resultSet.getString ("pavadinimas2") + "</td>";
					lent += "<td><input type=\"button\" class=\"record_edit\" id=\"toEdit_" + id_marsrutu_atkarpos + "\" data-id_marsrutu_atkarpos=\"" + id_marsrutu_atkarpos + "\"" + rec_data + " value=\"&#9998;\"></td>";
					lent += "<td><input type=\"button\" class=\"delete\" id=\"toDelete_" + id_rec + "\" data-id_rec=\"" + id_rec + "\" data-pav=\"" + pav + "\"  value=\"&#10006;\" onClick=\"Trinti( " + id_rec + " )\"></td>";

					lent += "</tr>";

				}
				
			} catch( Exception e ) {
				
				e.printStackTrace( System.out );
			}				
			return lent;
		}
	}