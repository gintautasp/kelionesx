
	package commons;
	
	import java.sql.DriverManager;
	import java.sql.ResultSet;
	import java.sql.Statement;
	import java.sql.Connection;

	public class Crude {
		
		public String[] lent_lauk;
		public String name_db;
		public String passwd;
		public String serv; 
		public String lent;
		public String user;
		
		protected Connection connection;
		
		//private Connection connection = null;
		private Statement statement_take = null;
		private Statement statement_change = null;
		private ResultSet resultSet = null;
		private int resultSetChange;
		private String comma = "";

		public Crude() {
			
		}
		
		public Crude ( String lentele, String[] lent_laukai ) {
			
			lent = lentele;
			lent_lauk = lent_laukai;
			
		}
		
	/*	public Crude ( String name_database, String user_name, String password, String server, String lentele, String[] lent_laukai ) {
			
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
		
		public Connection getConnection(){
		
			return connection;
		 
		}*/
		
		public Integer papildyti1 ( String[] lent_lauk_reiksmes, String id_punkto, String id_keliones) {
			
			String sql_ins1 = "";
			String str_lauk = "";
			
			for ( int i = 0; i < lent_lauk.length-2; i++ ) {
			
				str_lauk = str_lauk + comma + "`" + lent_lauk [ i ] + "`";
				sql_ins1 =  sql_ins1 + comma  + "'" + lent_lauk_reiksmes [ i ] + "'";
				comma = ",";																													// sql_ins = sql_ins + "'" + Miestai.value + "'";
			}
			
			sql_ins1 = 
				"INSERT INTO `" + lent + "`"
				+ " ( " + str_lauk + ", `id_punkto`, `id_keliones` )"
				+ " VALUES ( "			
				+ sql_ins1 + ", '" + id_punkto + "', '" + id_keliones + "' "
				+ " )";

			System.out.println ( sql_ins1 );
			
			
			try {

				statement_change = connection.createStatement();
				resultSetChange = statement_change.executeUpdate(sql_ins1);			
				
			} catch ( Exception e ) {
				
				e.printStackTrace( System.out );
			}
			return resultSetChange;
		}
		
		public Integer papildyti2 ( String[] lent_lauk_reiksmes, String id_marsruto_atkarpos, String atkarpos_numeris, String id_keliones, String id_punkto2 ) {
			
			String sql_ins2 = "";
			String str_lauk = "";
		//	id_punkto2 = "1";
		//	id_marsruto_atkarpos = "1";
		//	Reik butinai paselektint kazka, nes kitaip buna 3_2 jei nepaselektini lieka vienas ir neina splitint
			if ( id_marsruto_atkarpos !=null ) {
				System.out.println("90:" + id_marsruto_atkarpos);	
				String[] arrOfStr = id_marsruto_atkarpos.split("_");
				id_marsruto_atkarpos = arrOfStr[0];
				id_punkto2 = arrOfStr[1];
				System.out.println("94:" + arrOfStr[0]);
				System.out.println("95:" + arrOfStr[1]);
				
			}                                         
			for ( int i = 0; i < lent_lauk.length -2; i++ ) {
			
				str_lauk = str_lauk + comma + "`" + lent_lauk [ i ] + "`";
				sql_ins2 =  sql_ins2 + comma  + "'" + lent_lauk_reiksmes [ i ] + "'";
				comma = ",";																													// sql_ins = sql_ins + "'" + Miestai.value + "'";
			}

		sql_ins2 = 
				"INSERT INTO `" + lent + "`"
				+ " ( " + str_lauk + " + `id_keliones` )"
				+ " VALUES ( "			
				+ " " + sql_ins2 + ", '" + atkarpos_numeris + "', '" + id_keliones + "' "
				+ " )";

			System.out.println ( sql_ins2 );
			
			
			try {

				statement_change = connection.createStatement();
				resultSetChange = statement_change.executeUpdate(sql_ins2);			
				
			} catch ( Exception e ) {
				
				e.printStackTrace( System.out );
			}
			return resultSetChange;
		}		
		
		public Integer update ( String[] lent_lauk_reiksmes, String id_iraso ) {
			
			String sql_upd = "";
			comma = ",";	

			sql_upd += "UPDATE `" + lent + "` SET " ;
			
				for ( int i = 0; i < lent_lauk.length; i++ ) {
				
				sql_upd += "`" + (  lent_lauk [ i ]  ) +"`";
				sql_upd += "='" + (  lent_lauk_reiksmes [ i ] ) + "'" + comma; 
				} 
				
				sql_upd = sql_upd.substring(0,sql_upd.length()- 1);
				
				sql_upd += " WHERE `" + lent + "`.`id`='"+ id_iraso +"'";
			
			System.out.println ( sql_upd );
			
			try {

				statement_change = connection.createStatement();
				resultSetChange = statement_change.executeUpdate(sql_upd);			
				
			} catch ( Exception e ) {
				
				e.printStackTrace( System.out );
			}
			return resultSetChange;
		}		
		
		public Integer delete ( String id_iraso ) {
			
			String sql_del = "";
			
			sql_del = "DELETE FROM `"+ lent +"` WHERE `"+ lent +"`.`id`='"+ id_iraso +"'";

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
				String sql ="SELECT * FROM `" + lent + "`  WHERE 1";

				resultSet = statement_take.executeQuery( sql );
			 
				while( resultSet.next() ){
					
					String rec_data = "";

					for ( int i = 0; i<lent_lauk.length; i++ ) {
			
						rec_data += " data-" + lent_lauk [ i ] + "=\"" + resultSet.getString ( lent_lauk [ i ] ) + "\"";
					}
						
					String id_rec = resultSet.getString ( "id" );
								
					String pav = resultSet.getString ( "pav" );
					
					lent += "<tr>";
		
					for ( int i = 0; i < lent_lauk.length; i++ ) {
				
						lent += "<td>" + resultSet.getString (  lent_lauk [ i ]  ) + "</td>";

					}
					lent += "<td><input type=\"button\" class=\"record_edit\" id=\"toEdit_" + id_rec + "\" data-id_rec=\"" + id_rec + "\"" + rec_data + " value=\"&#9998;\"></td>";
					lent += "<td><input type=\"button\" class=\"delete\" id=\"toDelete_" + id_rec + "\" data-id_rec=\"" + id_rec + "\" data-pav=\"" + pav + "\"  value=\"&#10006;\" onClick=\"iTrinima( " + id_rec + " )\"></td>";

					lent += "</tr>";

				}
				
			} catch( Exception e ) {
				
				e.printStackTrace( System.out );
			}				
			return lent;
		}
	}