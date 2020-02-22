import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;

class DAG_test {


	
	@Test
	public void testDAG_AddNode() {

		//A B
		//A C
		//B D
		//B E
		//C D
		//C E
		//C F
		
		tree aTree=new tree("A");
		//Test Tree initialization
		assertEquals(aTree.root.data,"A");
		Node b = new Node("B");
		Node c = new Node("C");
		Node d = new Node("D");
		Node e = new Node("E");
		Node f = new Node("F");
		//Test add node
		aTree.root.children.add(b);
		aTree.root.children.add(c);
		assertEquals(aTree.root.children.get(0).data,"B");
		
		//Test in case of child have multiple parent node.
		aTree.root.children.get(0).children.add(d);
		aTree.root.children.get(0).children.add(e);
		aTree.root.children.get(1).children.add(d);
		aTree.root.children.get(1).children.add(e);
		//Test d node value under b node 
		assertEquals(aTree.root.children.get(0).children.get(0).data,"D");
		//Test e node value under b node
		assertEquals(aTree.root.children.get(0).children.get(1).data,"E");
		//Test d node value under c node
		assertEquals(aTree.root.children.get(1).children.get(0).data,"D");
		//Test e node value under c node
		assertEquals(aTree.root.children.get(1).children.get(1).data,"E");
		aTree.root.children.get(1).children.add(f);
	}
	
/*
 * 						 A			
 * 					    /  \
 *                      B  C ---------------F
 * 					  /  \/ \
 * 					  |  /\ |
 * 				      | /  \|
 *                    D     E
 * 
 * A B
 * A C
 * B D
 * B E
 * C D
 * C E
 * C F
 */
	@Test
	public void testDAG_LCA() {
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
		//Test child nodes with multiple parent node
		assertEquals(aTree.lca(new Node("D"), new Node("E")),"B&C");
		//Test child nodes with one single parent node
		assertEquals(aTree.lca(new Node("C"), new Node("F")),"C");
		//Test child nodes which one is the other's parent node
		assertEquals(aTree.lca(new Node("A"), new Node("B")),"A");
		//Test three child
		assertEquals(aTree.lca(new Node("B"), new Node("D")),"B");
		assertEquals(aTree.lca(new Node("D"), new Node("B")),"B");
		assertEquals(aTree.lca(new Node(aTree.lca(new Node("C"), new Node("D"))), new Node("B")),"A");
		assertEquals(aTree.lca(new Node(aTree.lca(new Node("D"), new Node("C"))), new Node("B")),"A");
	}
	
	/*                         A
	 *                      B     C
	 *                     D  E  F  G
	 *                    H IJ 
	 * 
	 * 
	 */
	@Test
	public void testBinaryTree_LCA() {
		tree aTree = new tree("A");
		Node b = new Node("B");
		Node c = new Node("C");
		Node d = new Node("D");
		Node e = new Node("E");
		Node f = new Node("F");
		Node g = new Node("G");
		Node h = new Node("H");
		Node i = new Node("I");
		Node j = new Node("J");
		aTree.root.children.add(b);
		aTree.root.children.add(c);
		b.children.add(d);
		b.children.add(e);
		c.children.add(f);
		c.children.add(g);
		d.children.add(h);
		d.children.add(i);
		e.children.add(j);
		//Test child nodes in the same layer
		assertEquals(aTree.lca(new Node("D"), new Node("E")),"B");
		//Test child nodes in different layer
		assertEquals(aTree.lca(new Node("D"), new Node("J")),"B");
		//Test child nodes in different subtree
		assertEquals(aTree.lca(new Node("I"), new Node("C")),"A");
		//Test one node is the other node's parent
		assertEquals(aTree.lca(new Node("B"), new Node("D")),"B");
		assertEquals(aTree.lca(new Node("D"), new Node("B")),"B");
		assertEquals(aTree.lca(new Node("B"), new Node("A")),"A");
		assertEquals(aTree.lca(new Node("A"), new Node("B")),"A");
		//Test three node
		assertEquals(aTree.lca(new Node("H"), new Node("J")),"B");
		assertEquals(aTree.lca(new Node("B"), new Node("F")),"A");
		assertEquals(aTree.lca(new Node(aTree.lca(new Node("H"), new Node("J"))), new Node("F")),"A");
	}
}
