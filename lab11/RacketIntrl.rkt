#lang slideshow

#|
Powershell tutorial file
Author: M. J. O'Neill
Purpose: Provide a quick introduction to PS for the professional that may be
required to maintain inherited code

Download: https://racket-lang.org/download/ 

Official Reference Site: https://docs.racket-lang.org/reference/index.html

PLT (forerunner) created by Matthias Felleisen in the 1990s. Renamed as Racket in 2010.

Philosophy: https://felleisen.org/matthias/manifesto/The_Principles_of_Racket.html


Programming Aids
    - IDE: DrRacket
    - Processing Directives: none
    - Error Handling: Call with exception handler
    - Interpeter mode available? Racket REPL

Getting started
    - Comments: Single line – semicolon, Multiline - #| and |#
    - Grouping code () or []   https://docs.racket-lang.org/guide/syntax-overview.html
    - Cheat Sheet: https://docs.racket-lang.org/racket-cheat/index.html?q=%23#%28part._top%29
|#

;-----Output (print, write, display)
#|
(displayln '|direct approach:|)
"Hello world"
(newline )
(newline )
(displayln "don't forget the parenthesis!")
print "printing Hello world"
(newline )
(newline )
(displayln '|print/write/display|)
(print "printing Hello world")
(write "writing Hello world")
(display "displaying Hello world")
(newline )
(newline )
(displayln '|with line feed:|)
(println "printing (LF)Hello world")
(writeln "writing (LF) Hello world")
(displayln "displaying (LF)Hello world")
(newline )
(newline )
|#
;-----Declaring variables https://docs.racket-lang.org/guide/define.html
#|
(define vUniversity "CSU" )
vUniversity
(newline )

(define-values (x y z) (values 1 2 3))
(display "z value is:  " )
(displayln z )

|#
;-----Input (note syntax of assigning variable)https://docs.racket-lang.org/reference/Byte_and_String_Input.html 
#|

(displayln "input Name:")
(define vName (read))
(displayln vName)
(newline )
(newline )

|#

;-----Boolean https://docs.racket-lang.org/guide/booleans.html
#|
; #t is the Racket true boolean
(boolean? #t)

; #f is the Racket false boolean
 (boolean? #f)

;an example of a boolean expression

(= 2 (+ 1 1))

;https://docs.racket-lang.org/reference/if.html#%28form._%28%28lib._racket%2Fprivate%2Fletstx-scheme..rkt%29._and%29%29
;is "no" a boolean?
 (boolean? "no")

;can you make a boolean using "no"?
 (if "no" 1 0)


;-----logical operations 

;logical AND
(and (= 2 (+ 1 1)) (= 2 (+ 1 2)))

;logical OR
(or (= 2 (+ 1 1)) (= 2 (+ 1 2)))

;Ternary Operator (AKA immediate IF)
(if (positive? 1) "positive" "not positive")

(if (positive? -1) "positive" "not positive")

;"operations that depend on a boolean value typically treat anything other than #f as true."   https://docs.racket-lang.org/reference/booleans.html

(and "Fred" 12)
(or "Fred" 12)
(and #t 12)
(or #f 12)
(newline )
(newline )
|#
;String Manipulation https://docs.racket-lang.org/reference/strings.html
#|
;double quotes do not support string interpolation
(define vString " in a string")
"you cant put a variable in a vString"
(newline )

;string concantenation:
(string-join '("Racket" "is" "hard"))

;double quotes vs single quotes https://docs.racket-lang.org/guide/quote.html
;'Hello World!' ;does not work
;'Hello World!' ;does not work
(println '|printing (LF)Hello world|)
(writeln '|writing (LF) Hello world|)
(displayln '|displaying (LF)Hello world|)

;search https://docs.racket-lang.org/reference/strings.html#%28def._%28%28lib._racket%2Fstring..rkt%29._string-contains~3f%29%29
(string-prefix? "Racket" "R")

(string-prefix? "Jacket" "R")


(string-suffix? "Racket" "et")


(string-contains? "Racket" "ack")
(newline )
(newline )

;replace
(string-replace "Scripting is hard!" "hard" "challenging")
(newline )
(newline )

;regular expressions https://docs.racket-lang.org/guide/regexp.html
(regexp-match-positions #rx"bats" "belfry")  ;we have no bats in our belfry
(regexp-match-positions #rx"bats|bel" "belfry") ;we do have a "bel"
(newline )
(newline )

|#
#|
;Read/write text file
; source: https://docs.racket-lang.org/guide/ports.html
(with-output-to-file "hello.txt" #:exists 'replace
    (lambda () (printf "Hello world! I'm Racket and I approved this text file")))
 (define in (open-input-file "hello.txt"))
 (read-line in)
;"Hello world! I'm Racket and I approved this text file"

;this will get you started on your lab:
(current-directory)

(current-directory "/home/instructor/CSCI-301-Fall-2022/lab11/")

(current-directory)

(define bowlerList (file->lines "Scramble.txt"))

;print to console to verify (comment out once verified)
bowlerList

;print to console to verify (comment out once verified)
bowlerList

(newline )
(newline )
|#
#|
(displayln "simple functions")
;source: https://sodocumentation.net/racket/topic/1935/functions

(define (ItsHard course) (string-append course " is hard!"))
(ItsHard "Physics")
(newline )

;higher order functions: https://sodocumentation.net/racket/topic/4433/higher-order-functions

;map https://docs.racket-lang.org/guide/Lists__Iteration__and_Recursion.html
(displayln "list functions")
(map ItsHard (list "Physics" "Calculus" "English" "PE" "Lunch"))
:'("Physics is hard!" "Calculus is hard!" "English is hard!" "PE is hard!" "Lunch is hard!")
(newline )
(newline )

; lambda function
(map (lambda (c)
         (string-append c " is hard!"))
       (list "Basket Weaving" "Recess" "Vacation"))
;'("Basket Weaving is hard!" "Recess is hard!" "Vacation is hard!")
|#

;decision structures
#|

;If statement (supports REGEX)
;source: https://docs.racket-lang.org/reference/if.html#%28form._%28%28quote._~23~25kernel%29._if%29%29 https://docs.racket-lang.org/reference/regexp.html 
(if (regexp-match #rx"a|b" "cat") "yes" "no")
;"yes"
(if (regexp-match #rx"d|e|f" "cat") "yes" "no")


;also has switch statement called "con"
;source (example is from source): https://docs.racket-lang.org/guide/conditionals.html#%28part._cond%29
(define (got-milk? lst)
  (cond
    [(null? lst) #f]
    [(eq? 'milk (car lst)) #t]
    [else (got-milk? (cdr lst))])) ;note recursion
 
 (got-milk? '(apple banana))
;#f

(got-milk? '(apple milk banana))
;#t
|#
;iterations - already seen FOR
#|
;for source (example is from the source): https://docs.racket-lang.org/guide/for.html
(for ([i '(1 2 3)])
    (display i))
;123
(newline )
(for ([i "abc"])
    (printf "~a..." i))
;a...b...c...
(newline )
(for ([i 4])
    (display i))
;0123
|#

;sequence constructors source (example is from the source): https://docs.racket-lang.org/guide/for.html
#|
(for ([i 3])
    (display i))
;012
(newline )
(for ([i (in-range 3)])
    (display i))

(newline )
|#
#|
;for and for* source (example is from the source): https://docs.racket-lang.org/guide/for.html
(newline )
(for ([i (in-range 1 4)]
        [chapter '("Intro" "Details" "Conclusion")])
    (printf "Chapter ~a. ~a\n" i chapter))
(newline )
(for ([i (in-naturals 1)]
        [chapter '("Intro" "Details" "Conclusion")])
    (printf "Chapter ~a. ~a\n" i chapter))
(newline )
(for* ([book '("Guide" "Reference")]
         [chapter '("Intro" "Details" "Conclusion")])
    (printf "~a ~a\n" book chapter))
(newline )
(newline )
|#
;complex data structures: pairs, lists, vectors, arrays, hash tables

;pairs source:https://docs.racket-lang.org/guide/pairs.html
#|
(cons 1 2)
;'(1 . 2)
(newline )
(cons (cons 1 2) 3)
;'((1 . 2) . 3)
(newline )
(car (cons 1 2))
;1
(newline )
(cdr (cons 1 2))
;2
(newline )
(pair? (cons 1 2))
;#t
(newline )
(newline )
|#
;lists source:
#|
null
;'()

(cons 0 (cons 1 (cons 2 null)))
;'(0 1 2)

(list? null)
;#t

(list? (cons 1 (cons 2 null)))
;#t

(list? (cons 1 2))
;#f
' ("eeny" "meeny" "miney")

(remove-duplicates '(a b b a))
;'(a b)
(newline )
(newline )
|#
#|
; Arrays source: https://docs.racket-lang.org/math/array_quick.html ;a little beyond the scope of this class
(require math/array)
  (array #[0 1 2 3 4]) ;a 1 x 5 array
;(array #[0 1 2 3 4])

(array #[#['first 'row 'data] #['second 'row 'data]])
;(array #[#['first 'row 'data] #['second 'row 'data]])

;vector source: https://docs.racket-lang.org/guide/vectors.html ;a little beyond the scope of this class
(require racket/vector)
(vector-split-at #(1 2 3 4 5) 2)
;'#(1 2)
;'#(3 4 5)

;hash table source: https://docs.racket-lang.org/guide/hash-tables.html
(define h (make-hash))
(hash-set! h 'a 5)
(hash-set! h 'b 6)
h 

(hash-update! h 'a add1)
h
;'#hash((a . 6)) 

(hash-update! h 'a add1)
h
;#hash((a . 6))
(newline )
(newline )
|#

;gotchas and quirks source: https://docs.google.com/document/d/1jGtldEcm_qPoHGknJOkWj1D4-doyBjDivaV_Vn7_Hxk/edit#!
;don't forget the parenthesis
;don't forget the semicolon (# is a list)
