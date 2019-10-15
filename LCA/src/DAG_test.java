import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;

class DAG_test {

//A B
//A C
//B D
//B E
//C D
//C E
//C F
	
	@Test
	public void testAddNode() {
		
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
		assertEquals(aTree.root.children.get(0).children.get(0).data,"D");
		assertEquals(aTree.root.children.get(0).children.get(1).data,"E");
		assertEquals(aTree.root.children.get(1).children.get(0).data,"D");
		assertEquals(aTree.root.children.get(1).children.get(1).data,"E");
		aTree.root.children.get(1).children.add(f);
	}

}
