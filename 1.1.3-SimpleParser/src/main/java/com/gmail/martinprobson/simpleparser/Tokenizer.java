package com.gmail.martinprobson.simpleparser;

import java.util.regex.Matcher;
import java.util.regex.Pattern;


//TODO Should implement iterator
public class Tokenizer {
	private String expression;
	private int position;
	private static final Pattern pattern = Pattern.compile("(\\d+)");

	public Tokenizer(String expression) {
		this.expression = expression;
		this.position = 0;
	}

	public Token nextToken() {
		
		boolean stop = false;
		Token returnToken = null; 
		
		
		while ((stop == false) && (position < expression.length()) ) {
			char nextChar = expression.charAt(position);
			position = position + 1;
			Token tok = new Token(nextChar);
			switch (tok.getType()) {
			case RIGHT_PARENTHESIS:
			case LEFT_PARENTHESIS:
			case OPERATOR:
				stop = true;
				returnToken = tok;
				break;

			case SPACE:
				break;
				
			case INVALID:
				System.err.println("ERROR");
				System.exit(2);
				break;
				
			case DIGIT:
				Matcher matcher = pattern.matcher(expression.substring(position - 2));
				if (matcher.find() == true) {
					String number = matcher.group(0);
					if (number == null) {
						System.err.println("Number error!");
						System.exit(2);
					} else {
						returnToken = new Token(Token.Type.NUMBER,number);
						position = position + matcher.end() - 2;
						stop = true;
					}
				}
				break;
				
			default:
				System.err.println("ERROR");
				System.exit(2);
				break;
			}

		}
		return returnToken;
	}

	public String getRemaining() {
		return expression.substring(position);
	}

}
