import java.util.ArrayList;
public class tree {
	// Root of the Binary Tree
	public Node root;
	
	public ArrayList<Node> leftArray = new ArrayList<Node>();
	public ArrayList<Node> rightArray = new ArrayList<Node>();
	
	public tree() {
		this.root=null;
	}
/*
	public Node findLCA(int n1, int n2) {
		if(search(root, n1)==null||search(root, n2)==null) {
			return null;
		}
		return lca(root, n1, n2);
	}
	
	private Node lca(Node root, int n1, int n2) {
		// Base case
		if (root == null)
			return null;

		if(root.data>n1&&root.data>n2)
			return lca(root.left,n1,n2);
		if(root.data<n1&&root.data<n2)
			return lca(root.right,n1,n2);
		
		return root;
		}
	
	public void insert(int value) {
		root=insert(root, value);
	}
*/
	private Node insert(Node parent,Node child, int value) {
		if (parent == null) {
			return new Node(value);
		}
		
		return root;
	}
	
	// A utility function to search a given key in BST 

	private boolean search(Node parent, int data) 
	{ 
	    if(parent==null) {
	    	return false;
	    }
	    if(parent.data==data) {
	    	return true;
	    }
	    for(int i=0;i<parent.descdant.size();i++) {
	    	if(parent.descdant.get(i).data==data) {
	    		return true;
	    	}
	    }
	    
	}
*/ 
/*
	public static void main(String[] args) {
		tree aTree=new tree();
		aTree.insert(30);
		aTree.insert(20);
		aTree.insert(10);
		aTree.insert(5);
		aTree.insert(60);
		aTree.insert(65);
		aTree.insert(50);
		aTree.insert(55);
		aTree.insert(45);
		aTree.insert(35);
		aTree.insert(48);
		aTree.insert(49);
		System.out.println("The root value is "+aTree.root.data);
	}
*/
}
