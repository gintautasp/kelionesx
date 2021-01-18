
	package commons;

	public class Crudx extends DbMySql {
		
		public String lent;
		public String[] laukai;
		public String[] n_pav;
		public String sal;
		public int res_update;
		public boolean res_select;
		
		public Crudx() {
		}
		
		public Crudx ( String lentele, String[] laukeliai ) {
			
			super();
			
			lent = lentele;
			laukai = laukeliai;
		}
		
		public String delete ( String id_trinamo ) {
			
			String sql_delete = "DELETE"

						+ " FROM" 
							+ " `" + lent + "` " 
					;
			sql_delete 	+= " WHERE `id`=" + id_trinamo
					;
			
			res_update = update ( "delete", sql_delete ); 

			return sql_delete;
		}
		
		public String select ( String by ) {
			
			String comma = "";
			String sql_sel = "SELECT ";
								
			for ( int i = 0; i < laukai.length; i++ ) {
				
				sql_sel += comma + " `" + laukai [ i ] + "` ";
				comma = ",";
			}
			
			sql_sel 	+= " FROM" 
					+ " `" + lent + "` "  
					+ " WHERE "
							+ "1"
							+  by
				;
			res_select = select ( "select", sql_sel, laukai );
			
			return sql_sel;
		}
		
		public String insert ( String[] values ) {
			
			String[] reiksmes = values;
			String sql_insert = "INSERT INTO " + " `" + lent + "` ( ";
			String comma = "";
			
			for ( int i = 1; i < laukai.length; i++ ) {
				
				sql_insert += comma  + " `" + laukai [ i ] + "` ";
				comma = ",";																													// sql_ins = sql_ins + "'" + Miestai.value + "'";
			}
			
			comma = "";
			sql_insert += ") VALUES ( ";
			
			for ( int i = 1; i < reiksmes.length; i++ ) {

				sql_insert += comma + " '" + reiksmes[i] + "' ";
				comma = ",";	
				
			}
			sql_insert += " )";
			
			res_update = update ( "insert", sql_insert );

			return sql_insert;
		}
		
		public String update ( String[] values, String by ) {
			
			String[] reiksmes = values;
			String sql_update = "UPDATE" + " `" + lent + "` SET\n ";
			String comma = "";
			
			for ( int i = 0; i < laukai.length; i++ ) {
				
				sql_update += comma  + " `" + laukai [ i ] + "`='" + reiksmes [ i ] + "'\n";
				comma = ",";																													// sql_ins = sql_ins + "'" + Miestai.value + "'";
			}
			
			sql_update += " WHERE " + by;
			
			res_update = update ( "update", sql_update );			
			
			return sql_update;
		}
		
	}