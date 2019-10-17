import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;

class DAG_test {


	
	@Test
	public void testAddNode() {

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
	public void test_LCA() {
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
		assertEquals(aTree.lca(new Node(aTree.lca(new Node("C"), new Node("D"))), new Node("B")),"A");
		assertEquals(aTree.lca(new Node(aTree.lca(new Node("D"), new Node("C"))), new Node("B")),"A");
	}

}
