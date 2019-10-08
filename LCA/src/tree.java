
public class tree {
	// Root of the Binary Tree
	public Node root;

	public tree() {
		this.root=null;
	}

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

	private Node insert(Node root, int value) {
		if (root == null) {
			return new Node(value);
		}
		if (value < root.data) {
			root.left = insert(root.left, value);
		} else {
			root.right = insert(root.right, value);
		}
		return root;
	}
	
	// A utility function to search a given key in BST 
	private Node search(Node root, int data) 
	{ 
	    
	    if (root==null || root.data==data) 
	        return root; 
	 
	    if (root.data > data) 
	        return search(root.left, data); 
	  
	    return search(root.right, data); 
	} 
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
