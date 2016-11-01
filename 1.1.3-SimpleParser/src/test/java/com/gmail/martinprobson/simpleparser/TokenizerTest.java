package com.gmail.martinprobson.simpleparser;

import static org.junit.Assert.*;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;

/**
 * Junit tester for Tokenizer class.
 * 
 * @author martinr
 *
 */
public class TokenizerTest {

	@Test
	public void testIterator() {
		String[] expChars = {"(","+","(","*","10","(","-","10","5",")","34",")","20",")"};
		List<Token> expResult = new ArrayList<Token>();
		for (String s : expChars) { 
			if ((s.length() == 1) && !(s.matches("[0-9]"))) 
				expResult.add(new Token(s.charAt(0)));
			else
				expResult.add(new Token(Token.Type.NUMBER,s));
		}
		Tokenizer tok = new Tokenizer("(+ (* 10 (- 10 5) 34) 20)");
		for (Token t : expResult) {
			assertEquals(t.toString(),tok.nextToken().toString());
		}
	}

	@Test
	public void testIterator2() {
		String[] expChars = {"(","*","(","+","2","(","*","4","6",")",")","(","+","3","5","7",")",")"};
		List<Token> expResult = new ArrayList<Token>();
		for (String s : expChars) { 
			if ((s.length() == 1) && !(s.matches("[0-9]"))) 
				expResult.add(new Token(s.charAt(0)));
			else
				expResult.add(new Token(Token.Type.NUMBER,s));
		}
		Tokenizer tok = new Tokenizer("(* (+ 2 (* 4 6))(+ 3 5 7))");
		for (Token t : expResult) {
			assertEquals(t.toString(),tok.nextToken().toString());
		}
	}
	
	
	@Test
	public void testGetRemaining() {
		Tokenizer tok = new Tokenizer("(+ (* 10 (- 10 5) 34) 20)");
		tok.nextToken(); tok.nextToken();
		assertEquals(tok.getRemaining()," (* 10 (- 10 5) 34) 20)");
	}

}
