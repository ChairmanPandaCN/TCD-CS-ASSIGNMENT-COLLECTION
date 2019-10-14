import java.util.ArrayList;
public class Node {
	public int data; 
    public ArrayList<Node> descdant;
    public int depth;
    public boolean visit;
    public Node(int data) 
    { 
        this.data = data; 
        this.descdant = new ArrayList<Node>();
        this.depth =0;
        this.visit =false;
    } 
    
}
