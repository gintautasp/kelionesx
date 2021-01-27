
	package commons;

	public class CrudXY extends CrudX {
		
		public String lent;
		public String[] laukai;
		public String[] n_pav;
		public String sal;
		public int res_update;
		public boolean res_select;
		
		public CrudXY() {
		}
		
		public CrudXY ( String lentele, String[] laukeliai ) {
			
			super( String lentele, String[] laukeliai );
		}
		
		public QuerySaveResult save( String id_rec, fields_rec ) {
			
			QuerySaveResut qrs;

			if  ( (  id_rec == null ) || ( id_rec.equals ( "0" ) ) ) {																																	// Miestai miestas = new Miestai ( lent_miestu );
		
				qrs.query_save = sql_ins = this.insert ( fields_rec )
				
			} else {
			
				fields_rec [ 0 ] = id_rec;

				String salyga = " `id`=" + id_vart;
				qrs.query_save = this.update ( fields_rec, salyga );
								
				out.println ( sql_upd );				
			}			
			
		}
		
		
	}