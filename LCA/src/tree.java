import java.util.*;

/*
 * 
 *  The LCA is defined to follow 2 criteria:
 * 		1.A LCA w of nodes u and v in a DAG is an ancestor of both u and v where w has no descendants that are also ancestors of both u and v. 
 *      2.Compare with other ancestors, #(edges of w to u) + #(edges of w to v) is the lowest figure.
 */
public class tree {
	public Node root;
	public static ArrayList<ArrayList<String>> branch;
	private static Stack<String> stack;
	private static HashMap<String, Integer> lcaTable;

	public tree(String value) {
		branch = new ArrayList<ArrayList<String>>();
		lcaTable = new HashMap<String, Integer>();
		stack = new Stack<String>();
		this.root = new Node(value);
	}

	private static void dfs(Node root) {
		// if not reach the branch end 	
		if (root.children.size() != 0) {
			stack.add(root.data);
			//add an ancestor to family book 
			for (int i = 0; i < root.children.size(); i++) {
		    // this family spread out,reach every sub-family,starting recursion
				dfs(root.children.get(i));
			// try another family branch	
				stack.pop();
			}
		} else {
			//Reach the child who doesnt have child/children yet.
			stack.add(root.data);
			//Add this family branch to the list
			ArrayList<String> tmp = new ArrayList<String>(stack);
			branch.add(tmp);
		}
	}

	public static void findAncestor(Node root, Node a, Node b) {
		dfs(root);
		ArrayList<Integer> alist = new ArrayList<Integer>();
		ArrayList<Integer> blist = new ArrayList<Integer>();
		for (int i = 0; i < branch.size(); i++) {
			if (branch.get(i).contains(a.data)) {
				alist.add(i);
				// System.out.println(a.data + " + " + i + " A");
			}
			if (branch.get(i).contains(b.data)) {
				blist.add(i);
				// System.out.println(b.data + " + " + i + " B");
			}
		}
		/*
		 * 
		 *  Something magic happens here.
		 */
		for (int i = 0; i < alist.size(); i++) {
			//Iterate every branch contains a.data
			int distance =branch.get(alist.get(i)).indexOf(a.data);
			//Mark the index of a.data in each branch,for future comparison with predecessors of a.data in each branch.
			for (int j = branch.get(alist.get(i)).indexOf(a.data); j >= 0; j--) {
			//Iterate every predecessor for a.data in each branch	
				for (int k = 0; k < blist.size(); k++) {
				//Iterate every branch contains b.data
					if (branch.get(blist.get(k)).contains(branch.get(alist.get(i)).get(j))) {
					//if the branch which contains b.data also contains one of the a.data 's predecessors 
						if (lcaTable.containsKey(branch.get(alist.get(i)).get(j))
								&& lcaTable.get(branch.get(alist.get(i)).get(j)) > distance - j) {
						// find out an common ancestor which is close to child than we expect
							lcaTable.put(branch.get(alist.get(i)).get(j), distance - j);
						} else {
						// find an common ancestor ,add to the table	
							lcaTable.put(branch.get(alist.get(i)).get(j), distance - j);
						}
					}
				}
			}
		}
	}
	private String lca(Node a,Node b) {
		findAncestor(this.root, a, b);
		String LCA ="";
		ArrayList<String> lcaList=new ArrayList<String>();
		int close=Integer.MAX_VALUE ;
		for (int value : lcaTable.values()) {
		    if(close>value) {
		    	close=value;
		    }
		}
		for (HashMap.Entry<String, Integer> entry : lcaTable.entrySet()) {
		    String key = entry.getKey();
		    Integer value = entry.getValue();
		    if(value==close) {
		    	lcaList.add(key);
		    }
		}
		int i=0;
		while(i<lcaList.size()-1) {
			LCA+=lcaList.get(i);
			LCA+="&";
			i++;
		}
		LCA+=lcaList.get(i);
		return LCA;
	}

	public static void main(String[] args) {
		///*
		tree aTree = new tree("A");
		Node b = new Node("B");
		Node c = new Node("C");
		Node d = new Node("D");
		Node e = new Node("E");
		Node f = new Node("F");
		aTree.root.children.add(b);
		aTree.root.children.add(c);
		aTree.root.children.get(0).children.add(d);
		aTree.root.children.get(0).children.add(e);
		aTree.root.children.get(1).children.add(d);
		aTree.root.children.get(1).children.add(e);
		aTree.root.children.get(1).children.add(f);
		findAncestor(aTree.root, new Node("D"), new Node("E"));
		System.out.println("The following branches constitute the tree : ");
		for (int i = 0; i < branch.size(); i++) {
			System.out.println(branch.get(i).toString());
		}
		System.out.println(lcaTable.toString());
		System.out.println(aTree.lca(new Node("D"), new Node("E")));
		//*/
		/*
		tree aTree = new tree("A");
		Node b = new Node("B");
		Node c = new Node("C");
		Node d = new Node("D");
		Node e = new Node("E");
		Node f = new Node("F");
		aTree.root.children.add(b);
		aTree.root.children.add(c);
		aTree.root.children.get(0).children.add(d);
		aTree.root.children.get(0).children.add(f);
		aTree.root.children.get(0).children.get(0).children.add(e);
		aTree.root.children.get(1).children.add(f);
		aTree.root.children.get(1).children.add(e);
		*/
		//System.out.println(aTree.lca(new Node("E"),new Node("F")));
		//lca(aTree.root, new Node("B"), new Node("D"));
		
		
		// System.out.println(branch[0]);
		// System.out.println(aTree.root.children.get(0).children.size());
		// System.out.println(aTree.root.children.get(1).children.size());
	}

}