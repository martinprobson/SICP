
Simple Tokenizer and Parser written in Java that will build a TokenTree
from simple Lisp like expressions such as: -
```Scheme
(+ 2 (* 2 (- 1 5)))
```

Note that parser is very basic - only deals with +,-,\*,/ and positive integers.


To run use Maven:-
```
mvn install exec:java
```

Based on Section 1.1.3 Evaluating Expressions in 
['Structure and Interpretation of Computer Programs'](https://mitpress.mit.edu/sicp/full-text/book/book-Z-H-1.html)


TODO: Rewrite this code in Scheme.

