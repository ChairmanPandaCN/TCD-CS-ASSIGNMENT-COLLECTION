import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;

class LCA_test {

	@Test
	public void testEmptyTree() {
		tree aTree = new tree();
		assertEquals(aTree.root,null,"The root value of empty binary tree is");
	}
	
	@Test
	public void testAddNode() {
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
//                30
//               /	\
//             20    60
//             /    /  \
//            10   50  65
//           /    /  \
//			5	 45   55	
//              /  \
//             35   48
//                   \
//                   49
		assertEquals(aTree.root.data,30);
		assertEquals(aTree.root.right.left.left.data,45);
		assertEquals(aTree.root.right.left.left.right.right.data,49);
	}
	
	@Test
	public void testLCAinEmptyList() {
//       30
//     /	\
//   20    60
//   /    /  \
//  10   50  65
// /    /  \
//5	 45   55	
//  /  \
// 35   48
//        \
//         49
		tree aTree=new tree();
		assertEquals(aTree.findLCA(1, 2),null);
	}

	@Test
	public void testLCA() {
//       30
//     /	\
//   20    60
//   /    /  \
//  10   50  65
// /    /  \
//5	  45   55	
//   /  \
// 35   48
//        \
//         49
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
		assertEquals(aTree.findLCA(5, 10).data,10);
		assertEquals(aTree.findLCA(5, 35).data,30);
		assertEquals(aTree.findLCA(5, 65).data,30);
		assertEquals(aTree.findLCA(35, 49).data,45);
		assertEquals(aTree.findLCA(60, 65).data,60);
	}
	@Test
	public void testLcaNonExistNode() {
//     30
//    /	\
//  20    60
//  /    /  \
// 10   50  65
///    /  \
//5	  45   55	
//  /  \
//35   48
//       \
//        49
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
		assertEquals(aTree.findLCA(1, 30),null);
		assertEquals(aTree.findLCA(5, 35).data,30);
		assertEquals(aTree.findLCA(30, 100),null);
		assertEquals(aTree.findLCA(200, 100),null);
	}
}
