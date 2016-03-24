package symb;

public class SymbolInt extends Symbol {
  
  public SymbolInt(String id, int addr) {
    super(id, addr);
  }

  @Override
  public String getType(){
    return Symbol.INT_TYPE;
  }

  @Override
  public String toString() {
    String s = "int " + this.getId();
    return s;
  }
}