package com.gmail.martinprobson.simpleparser;

import static org.junit.Assert.*;

import org.junit.Test;

/**
 * Junit tester for Token class.
 * 
 * @author martinr
 *
 */

public class TokenTest {

	@Test
	public void testTokenTypeString() {
		Token t = new Token(Token.Type.RIGHT_PARENTHESIS,")");
		assertEquals(t.toString(),"Type: RIGHT_PARENTHESIS Value: )");
		t = new Token(Token.Type.LEFT_PARENTHESIS,"(");
		assertEquals(t.toString(),"Type: LEFT_PARENTHESIS Value: (");		
		t = new Token(Token.Type.OPERATOR,"+");
		assertEquals(t.toString(),"Type: OPERATOR Value: +");		
		t = new Token(Token.Type.DIGIT,"0");
		assertEquals(t.toString(),"Type: DIGIT Value: 0");		
		t = new Token(Token.Type.NUMBER,"12345");
		assertEquals(t.toString(),"Type: NUMBER Value: 12345");		
		t = new Token(Token.Type.SPACE," ");
		assertEquals(t.toString(),"Type: SPACE Value:  ");		
	}

	@Test
	public void testTokenType() {
		Token t = new Token(Token.Type.RIGHT_PARENTHESIS);
		assertEquals(t.toString(),"Type: RIGHT_PARENTHESIS Value: null");
		t = new Token(Token.Type.LEFT_PARENTHESIS);
		assertEquals(t.toString(),"Type: LEFT_PARENTHESIS Value: null");		
		t = new Token(Token.Type.OPERATOR);
		assertEquals(t.toString(),"Type: OPERATOR Value: null");		
		t = new Token(Token.Type.DIGIT);
		assertEquals(t.toString(),"Type: DIGIT Value: null");		
		t = new Token(Token.Type.NUMBER);
		assertEquals(t.toString(),"Type: NUMBER Value: null");		
		t = new Token(Token.Type.SPACE);
		assertEquals(t.toString(),"Type: SPACE Value: null");		
	}

	@Test
	public void testTokenCharacter() {
		Token t = new Token(')');
		assertEquals(t.toString(),"Type: RIGHT_PARENTHESIS Value: )");
		t = new Token('(');
		assertEquals(t.toString(),"Type: LEFT_PARENTHESIS Value: (");		
		t = new Token('+');
		assertEquals(t.toString(),"Type: OPERATOR Value: +");		
		t = new Token('6');
		assertEquals(t.toString(),"Type: DIGIT Value: 6");		
		t = new Token(' ');
		assertEquals(t.toString(),"Type: SPACE Value:  ");	
	}
	
	@Test(expected = IllegalArgumentException.class)
	public void testIllegalArgumentException() {
		new Token('Z');
	}

	@Test
	public void testGetType() {
		Token t = new Token(Token.Type.RIGHT_PARENTHESIS);
		assertEquals(t.getType(),Token.Type.RIGHT_PARENTHESIS);
		t = new Token(Token.Type.LEFT_PARENTHESIS);
		assertEquals(t.getType(),Token.Type.LEFT_PARENTHESIS);		
		t = new Token(Token.Type.OPERATOR);
		assertEquals(t.getType(),Token.Type.OPERATOR);		
		t = new Token(Token.Type.DIGIT);
		assertEquals(t.getType(),Token.Type.DIGIT);		
		t = new Token(Token.Type.NUMBER);
		assertEquals(t.getType(),Token.Type.NUMBER);		
		t = new Token(Token.Type.SPACE);
		assertEquals(t.getType(),Token.Type.SPACE);		
	}

	@Test
	public void testGetValue() {
		Token t = new Token(Token.Type.RIGHT_PARENTHESIS,")");
		assertEquals(t.getValue(),")");
		t = new Token(Token.Type.LEFT_PARENTHESIS,"(");
		assertEquals(t.getValue(),"(");		
		t = new Token(Token.Type.OPERATOR,"+");
		assertEquals(t.getValue(),"+");		
		t = new Token(Token.Type.DIGIT,"0");
		assertEquals(t.getValue(),"0");		
		t = new Token(Token.Type.NUMBER,"12345");
		assertEquals(t.getValue(),"12345");		
		t = new Token(Token.Type.SPACE," ");
		assertEquals(t.getValue()," ");		
		t = new Token(Token.Type.NUMBER);
		assertNull(t.getValue());		

	}

}
