package com.gmail.martinprobson.simpleparser;

import javax.swing.tree.DefaultMutableTreeNode;

public class TreeNode extends DefaultMutableTreeNode {

	public TreeNode(Token t) {
		super((Object) t);
	}
	
	public static void main(String[] args) {
		TreeNode root = new TreeNode(new Token('1'));
		root.add(new TreeNode(new Token('2')));
		root.add(new TreeNode(new Token('3')));
		TreeNode t = new TreeNode(new Token('4'));
		root.add(t);
		t.add(new TreeNode(new Token('2')));
		t.add(new TreeNode(new Token('3')));
		
		TreeVis.showTree(root);
	}
	
	private static final long serialVersionUID = 1L;

}
