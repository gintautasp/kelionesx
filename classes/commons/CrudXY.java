
	package commons;

	public class CrudXY extends CrudX {
		
		public CrudXY() {
		}
		
		public CrudXY ( String lentele, String[] laukeliai ) {
			
			super( String lentele, String[] laukeliai );
		}
		
		public QuerySaveResult save ( String id_rec, String[] fields_rec ) {
			
			QuerySaveResut qrs;

			if  ( (  id_rec == null ) || ( id_rec.equals ( "0" ) ) ) {																																	// Miestai miestas = new Miestai ( lent_miestu );
		
				qrs = this.insert ( fields_rec )
				
			} else {
			
				fields_rec [ 0 ] = id_rec;

				String salyga = " `id`=" + id_rec;
				
				qrs = this.update ( fields_rec, salyga );
			}			
			return qrs;
		} 
		
		public String jsTrynimui ( String pav_iraso ) {
			
			String js_funkcja_i_trynima = "function iTrinima ( id_rec ) {\n\n"
			
				+ "mygtukasEdit = document.getElementById ( 'toEdit_' + id_rec );\n\n";

				+ "pav =  mygtukasEdit.dataset.pav;\n\n";
				
				+ "var r = confirm( 'Ar norite pasalinti " + pav_iraso + " ' + pav + '?' );\n\n";
				
				+ "alert( r )\n\n";
				+ "alert ( r == true )\n\n";
				
				+ "if ( r == true ) {\n\n";

				+	"alert( id_rec + '1' )\n";
				+	"document.getElementById ( 'm_del' ).value = id_rec\n";
				+	"alert( id_rec  + '2' )\n";
				+	"forma_del = document.getElementById ( 'del_rec' )\n";
				+	"alert( forma_del );\n";
				+	"forma_del.submit();\n";
				+	"}\n";
			+ "}\n";
			
			return js_funkcja_i_trynima;
		}
	}