package com.gmail.martinprobson.simpleparser;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class Token {

	private final String value;
	private final Type   type;
	
	/*
	 * Constructors
	 */
	public Token(Type t, String value) {
		this.value = value;
		this.type  = t;
	}
	
	public Token(Type t) {
		this(t,null);
	}
	
	public Token(Character c) {
		this(Type.createFrom(c),c.toString());
	}
	
	/*
	 * Access 
	 */
	public Type getType() {
		return type;
	}
	
	public String getValue() {
		return value;
	}
	
	/*
	 * toString()
	 */
	public String toString() {
		return "Type: " + type + " Value: " + value;
	}
	
	public enum Type {
		RIGHT_PARENTHESIS(')'),
		LEFT_PARENTHESIS('('),
		OPERATOR('*','/','-','+'),
		DIGIT('0','1','2','3','4','5','6','7','8','9'),
		NUMBER(),
		SPACE(' '),
		INVALID();

		private List<Character> types;
		
		private Type() {
			this.types = new ArrayList<Character>();
		}

		private Type(Character... types) {
			this.types = Arrays.asList(types);
		}
		
		public static Type createFrom(char c) throws IllegalArgumentException {
			for (Type t: values()) {
				if (t.types.contains(c)) {
					return t;
				}
			}
		    throw new IllegalArgumentException("Invalid type: " + c);
		}
	}
	

}