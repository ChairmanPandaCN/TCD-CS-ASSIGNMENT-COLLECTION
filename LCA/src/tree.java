public class tree {
	// Root of the Binary Tree
	public Node root;
	public String [] branch;
	public tree(String value) {
		this.root= new Node(value);
	}

	public void dfs(Node root) {
		for(int i=0;i<root.children.size();i++) {
			dfs(root.children.get(0));
		}
		
	}

}