import java.util.*;
public class Node {
	public String data; 
    public ArrayList<Node> children;
    public Node(String data) 
    { 
        this.data = data; 
        this.children =  new ArrayList<Node>();
    }
    
}