/*
  Created by: Matt Breckon and Dean Way
  File name: Main.java
  To run: 
    $ java Main programs/file_name.cm
*/
   
import java.io.*;
   
class Main {
  static public void main(String argv[]) {    
    /* Start the parser */
    try {
      parser p = new parser(new Lexer(new FileReader(argv[0])));
      Object result = p.parse().value;      
    } catch(Exception e) {
      /* do cleanup here -- possibly rethrow e */
      e.printStackTrace();
    }
  }
}