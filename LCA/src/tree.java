import java.util.*;

public class tree {
	// Root of the Binary Tree
	public Node root;
	// public String[] branch;
	public static ArrayList<ArrayList<String>> branch;
	// public static String [] branch;
	private static Stack<String> stack;
	private static HashMap<String, Integer> lcaTable;

	public tree(String value) {
		// this.depth = 0;
		// this.branchNumber = 0;
		branch = new ArrayList<ArrayList<String>>();
		lcaTable = new HashMap<String, Integer>();
		stack = new Stack<String>();
		this.root = new Node(value);
	}

	private static void dfs(Node root) {
		if (root.children.size() != 0) {
			stack.add(root.data);
			for (int i = 0; i < root.children.size(); i++) {
				// System.out.println(depth);
				dfs(root.children.get(i));
				stack.pop();
			}
		} else {
			stack.add(root.data);
			ArrayList<String> tmp = new ArrayList<String>(stack);
			branch.add(tmp);
		}
	}

	public static void lca(Node root, Node a, Node b) {
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
		for (int i = 0; i < alist.size(); i++) {
			int distance =branch.get(alist.get(i)).indexOf(a.data);
			for (int j = branch.get(alist.get(i)).indexOf(a.data); j >= 0; j--) {
				System.out.println(branch.get(alist.get(i)).get(j));
				// System.out.println(branch.get(alist.get(i)).get(j));
				for (int k = 0; k < blist.size(); k++) {
					System.out.println(branch.get(blist.get(k)).toString());
					if (branch.get(blist.get(k)).contains(branch.get(alist.get(i)).get(j))) {
						System.out.println("yyy");
						if (lcaTable.containsKey(branch.get(alist.get(i)).get(j))
								&& lcaTable.get(branch.get(alist.get(i)).get(j)) > distance - j) {
							lcaTable.put(branch.get(alist.get(i)).get(j), distance - j);
						} else {
							lcaTable.put(branch.get(alist.get(i)).get(j), distance - j);
						}
					}
				}
			}
		}
	}

	public static void main(String[] args) {
		
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
		lca(aTree.root, new Node("D"), new Node("E"));
		
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
		lca(aTree.root, new Node("D"), new Node("F"));
		*/
		for (int i = 0; i < branch.size(); i++) {
			for (int j = 0; j < branch.get(i).size(); j++) {
				System.out.print(branch.get(i).get(j));
			}
			System.out.println();
		}
		System.out.println(lcaTable.toString());
		// System.out.println(branch[0]);
		// System.out.println(aTree.root.children.get(0).children.size());
		// System.out.println(aTree.root.children.get(1).children.size());
	}

}