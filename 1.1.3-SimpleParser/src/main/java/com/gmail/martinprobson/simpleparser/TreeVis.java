package com.gmail.martinprobson.simpleparser;


import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.UIManager;

import javax.swing.JTree;
import javax.swing.tree.TreeSelectionModel;
import javax.swing.event.TreeSelectionEvent;
import javax.swing.event.TreeSelectionListener;

import java.awt.GridLayout;

@SuppressWarnings("serial")
public class TreeVis extends JPanel
                      implements TreeSelectionListener {
    private JTree tree;

    //Optionally play with line styles.  Possible values are
    //"Angled" (the default), "Horizontal", and "None".
    private static boolean playWithLineStyle = false;
    private static String lineStyle = "Horizontal";
    
    //Optionally set the look and feel.
    private static boolean useSystemLookAndFeel = false;

    public TreeVis(TreeNode root) {
        super(new GridLayout(1,0));


        //Create a tree that allows one selection at a time.
        tree = new JTree(root);
        tree.getSelectionModel().setSelectionMode
                (TreeSelectionModel.SINGLE_TREE_SELECTION);

        //Listen for when the selection changes.
        tree.addTreeSelectionListener(this);

        if (playWithLineStyle) {
            System.out.println("line style = " + lineStyle);
            tree.putClientProperty("JTree.lineStyle", lineStyle);
        }

        //Create the scroll pane and add the tree to it. 
        JScrollPane treeView = new JScrollPane(tree);

        //Add the split pane to this panel.
        add(treeView);
    }
    
        
    /**
     * Create the GUI and show it.  For thread safety,
     * this method should be invoked from the
     * event dispatch thread.
     */
    private static void createAndShowGUI(TreeNode root) {
        if (useSystemLookAndFeel) {
            try {
                UIManager.setLookAndFeel(
                    UIManager.getSystemLookAndFeelClassName());
            } catch (Exception e) {
                System.err.println("Couldn't use system look and feel.");
            }
        }

        //Create and set up the window.
        JFrame frame = new JFrame("TreeDemo");
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

        //Add content to the window.
        frame.add(new TreeVis(root));

        //Display the window.
        frame.pack();
        frame.setVisible(true);
    }

    public static void showTree(final TreeNode root) {
        //Schedule a job for the event dispatch thread:
        //creating and showing this application's GUI.
    	javax.swing.SwingUtilities.invokeLater(new Runnable() {
    	    public void run() {
    	        createAndShowGUI(root);
    	    }
    	});
    }


	@Override
	public void valueChanged(TreeSelectionEvent e) {
		// TODO Auto-generated method stub
		
	}
	
	public static void main(String[] args) {
		TreeNode root = new TreeNode(new Token('('));
		root.add(new TreeNode(new Token('+')));
		root.add(new TreeNode(new Token('+')));
		TreeNode branch = new TreeNode(new Token('*'));
		root.add(branch);
		root.add(new TreeNode(new Token('+')));
		branch.add((new TreeNode(new Token('('))));
		branch.add(new TreeNode(new Token('+')));
		branch.add(new TreeNode(new Token('+')));
		branch.add(new TreeNode(new Token('+')));
		branch.add(new TreeNode(new Token('+')));
		
		showTree(root);
	}
}

