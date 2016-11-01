# SICP Notes

## 1.1 The Elements of Programming

Every powerful programming language supports combining simple ideas into more complex ideas, using three major means: -
- **Primitive Expression** - which represent the simplest entities the language is concerned with.
- **Means of combination** - by which compound elements are build from simpler ones.
- **Means of abstraction** - compound elements can be combined, named and manipulated as units.


The Scheme dialect of Lisp is made up of a list of expressions, within parenthesis to denote *procedure application*. These are called 	*combinations*. For example: -
```Scheme
(+ 1 2)
```
represents the combination, denoted by parenthesis that consists of the procedure '+' applied to the operands 1 and 2.

### 1.1.5 The Substitution Model for Procedure Application

Consider: -
```Scheme
(define (sum-of-squares a b)
    (+ (square a) (square b)))
(define (square a)
    (* a a))
(define (f a)
    (sum-of-squares (+ a 1) (* a 2)))
```

Evaluating the combination: -
```Scheme
(f 5)
```

#### Applicative-order evaluation
Evaluate the arguments and then apply: -
```Scheme
(sum-of-squares (+ 5 1) (* 5 2))
(+ (square 6) (square 10)
(+ (* 6 6) (* 10 10))
(+ 36 100)
136
```

Normal order evaluation
Fully expand and then reduce: -
```Scheme
(sum-of-squares (+ 5 1) (* 5 2))
(+ (* (+ 5 1) (+ 5 1)) (* (* 5 2) (* 5 2))))
```
reduces to: -
```Scheme
(+ (* 6 6) (* 10 10))
(+ 36 100)
136
```

### Exercise 1.5
Ben Bitdiddle has invented a test to determine whether the interpreter he is faced with is using applicative-order evaluation or normal-order evaluation. He defines the following two procedures: 
```Scheme
; Note following procedure with enter infinite loop when called
(define (p) (p))	

(define (test x y)
  (if (= x 0)
      0
      y))
```
Then he evaluates the expression: -
```Scheme
(test 0 (p))
```
With normal order evaluation, the number 0 will be returned as the result. This is because the procedure call (p) is not evaluated first.
With applicative evaluation, an infinite loop is caused, and no result is printed.


### 1.1.8 Procedures as Black-Box Abstractions
One detail of a procedure's implementation that should not matter to the user of a procedure is 
the choice of names for the procedures formal parameters.

Consider: -
```Scheme
(define (square x) 
	(* x x))
(define (good-enough? guess x)
	(< (abs (- (square x) guess)) 0.001))
```
The `x` declared as the formal parameter to the square procedure must be different to the `x` in the 
`good-enough?` procedure. `x`  must be local to both procedures.
A formal parameter has a very special role in a procedure definition, 
in that it doesn't matter what name the formal parameter has. 
Such a name is called a *bound variable*, and we say that the procedure definition *binds* its formal parameters.
The meaning of the procedure definition is unchanged if the name of the bound variable is 
changed throughout the definition. 
If a variable is not bound we say that it is *free*. This also introduces the concept of *scope*, the scope of x in the square procedure above is obviously the procedure definition itself.
In the `good-enough?` procedure definition above, *guess* and *x* are bound variables and *abs*, *square*, *<*,
 and *–* are free variables.

### Exercise 1.6
If the `new-if` procedure is used instead of the built-in if procedure in the square root calculation method: -
```Scheme
(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
          guess
          (sqrt-iter (improve guess x)
                     x)))
```
Then the code will enter an infinite loop when executed.
This is because the new-if procedure is not special form.
The built-in If procedure will not evaluate the 'else' condition if the predicate is found to be true.
This is not the case for the new-if procedure, `sqrt-iter` will be evaluated before the call to new-if.


## 1.2 Procedures and the Processes They Generate

### 1.2.1 Linear Recursion and Iteration
Consider the factorial function, n!, defined by: -
```
n! = n . (n – 1)  . (n – 2) . (n – 3) …..3 . 2 . 1
```
#### Linear Recursive Process
```Scheme
;
; A linear recursive version of factorial function
;
(define (factorial n)
  (if (= n 1)
      1
      (* n (factorial (- n 1)))
      )
  )
```
For `(factorial 6)`, we can trace the procedure using the substitution model:-
```Scheme
(factorial 6)
(* 6 (factorial 5))
(* 6 (* 5 (factorial 4)))
(* 6 (* 5 (* 4 (factorial 3))))
(* 6 (* 5 (* 4 (* 3 (factorial 2)))))
(* 6 (* 5 (* 4 (* 3 (* 2 (factorial 1))))))
(* 6 (* 5 (* 4 (* 3 (* 2 1)))))
(* 6 (* 5 (* 4 (* 3 2))))
(* 6 (* 5 (* 4 6)))
(* 6 (* 5 24))
(* 6 120)
720
```
The substitution model reveals a shape of *expansion* followed by *contraction*.
This is because the process builds up a chain of *deferred* operations.
The contraction occurs as the operations are actually performed.
This type of process, characterized by a chain of deferred operations,
is known as a *recursive process*.
Carrying out this procedure requires the interpreter to keep track of the operations to be performed later on.
The length of the chain of deferred multiplications is proportional to n,
hence called a *linear recursive process*.

#### Linear Iterative Process
```Scheme
;
; A linear iterative process for factorials
;
(define (factorialI n) 
  (fact-iter 1 1 n))

(define (fact-iter product counter max-count)
  (if (> counter max-count)
      product
      (fact-iter (* counter product)
                 (+ counter 1)
                 max-count)))

(factorialI 6)
```
For `(factorial 6)`, we can trace the procedure using the substitution model:-
```Scheme
(factorialI 6)
(fact-iter 1 1 6)
(fact-iter 1 2 6)
(fact-iter 2 3 6)
(fact-iter 6 4 6)
(fact-iter 24 5 6)
(fact-iter 120 6 6)
(fact-iter 720 7 6)
720
```
By contrast, the second process does not grow and shrink.
At each step, all we need to keep track of, for any n , 
are the current values of the variables product, counter, and max-count.
We call this an iterative process.
In general, an iterative process is one whose state can be summarized by a fixed number of state variables,
together with a fixed rule that describes how the state variables should be updated as
the process moves from state to state
and an (optional) end test that specifies conditions
under which the process should terminate.
In computing n! , the number of steps required grows linearly with n.
Such a process is called a *linear iterative process*. 
**Important: Note that we are talking about processes here, not procedures.
A procedure can be defined in a recursive manner
(such as fact-iter above) but it does not result in a recursive process.** 
We will see that any iterative process can be implemented in a machine with just a set of registers, a recursive process requires a machine with an auxiliary memory called a *stack.*

Every powerful programming language supports combining simple ideas into more complex ideas, using three major means: -
