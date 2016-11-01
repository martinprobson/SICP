package com.gmail.martinprobson.simpleparser;

public class TokenTree {
	
	public static TreeNode BuildExpression(Tokenizer input) {
		Token tok = null;
		TreeNode root = null;
		while ((tok = input.nextToken()) != null) {
			switch (tok.getType()) {
			case OPERATOR:
				root = new TreeNode(tok);
				break;
			case NUMBER:
				TreeNode t = new TreeNode(tok);
				root.add(t);
				break;
			case RIGHT_PARENTHESIS:
				return root;
			case LEFT_PARENTHESIS:
				if (root == null) {
					root = BuildExpression(input);
				} else {
					root.add(BuildExpression(input));
				}
				break;
			}
		}
		return root;
	}
	
	
	public static void main(String[] args) {
		TreeNode t = BuildExpression(new Tokenizer("(* (+ 2 (* 4 6))(+ 3 5 7))"));
//		TreeNode t = BuildExpression(new Tokenizer("(+ 1 2)"));
//		TreeNode t = BuildExpression(new Tokenizer("(+ 1 (+ 2 3))"));
		TreeVis.showTree(t);
	}

}
