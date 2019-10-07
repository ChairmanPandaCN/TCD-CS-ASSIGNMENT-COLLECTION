#include <iostream>			// cout
using namespace std;		// cout
struct node
{
	int data;
	struct node* left, * right;
};

/* Function to find LCA of n1 and n2. The function assumes that both
   n1 and n2 are present in BST */
struct node* lca(struct node* root, int n1, int n2)
{
	if (root == NULL)
		return NULL;

	// If both n1 and n2 are smaller than root, then LCA lies in left
	if (root->data > n1 && root->data > n2)
		return lca(root->left, n1, n2);

	// If both n1 and n2 are greater than root, then LCA lies in right
	if (root->data < n1 && root->data < n2)
		return lca(root->right, n1, n2);

	return root;
}

/* Helper function that allocates a new node with the given data.*/
struct node* newNode(int data)
{
	struct node* node = (struct node*)malloc(sizeof(struct node));
	node->data = data;
	node->left = node->right = NULL;
	return (node);
}

void check(const char* s, _int64 v, _int64 expected)
{
	cout << s << " = " << v;
	if (v == expected)
	{
		cout << " OK";
	}
	else
	{
		cout << " ERROR: should be " << expected;
	}
	cout << endl;
}

/* Driver program to test lca() */
int main()
{
	// Let us construct the BST shown in the above figure
	struct node* root = newNode(20);
	root->left = newNode(8);
	root->right = newNode(22);
	root->right->right = newNode(21);
	root->left->left = newNode(4);
	root->left->right = newNode(12);
	root->left->left = newNode(3);
	root->left->left->left = newNode(2);
	root->left->right->left = newNode(10);
	root->left->right->right = newNode(14);

	int n1 = 10, n2 = 14;
	struct node* t = lca(root, n1, n2);
	check("LCA of 10 and 14", t->data, 12);
	n1 = 14, n2 = 8;
	t = lca(root, n1, n2);
	check("LCA of 14 and 8", t->data, 8);

	n1 = 10, n2 = 22;
	t = lca(root, n1, n2);
	check("LCA of 10 and 22", t->data, 20);

	n1 = 4, n2 = 3;
	t = lca(root, n1, n2);
	check("LCA of 2 and 3", t->data, 3);

	n1 = 2, n2 = 21;
	t = lca(root, n1, n2);
	check("LCA of 2 and 21", t->data, 20);
	getchar();
	return 0;
}