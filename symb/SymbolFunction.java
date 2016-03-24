package symb;
import java.util.List;

public class SymbolFunction extends Symbol {
  
  private List<SymbolInt> parameters;
  private String returnType;

  public SymbolFunction(String id, int addr, List<SymbolInt> parameters, String returnType) {
    super(id, addr);
    this.parameters = parameters;
    this.returnType = returnType;
  }

  @Override
  public String getType(){
    return Symbol.FUNC_TYPE;
  }

  public String getReturnType(){
    return this.returnType;
  }

  public List<SymbolInt> getParameters(){
    return this.parameters;
  }
}