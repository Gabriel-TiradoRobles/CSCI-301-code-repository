#lang slideshow

; Print out current dir
; (current-directory)
; (current-directory "/home/instructor/CSCI-301-Fall-2022/lab11/")

(define bowlerList (file->lines "Scramble.txt"))

(define bowlers (remove-duplicates bowlerList))
(set! bowlers (sort bowlers string<?))

(with-output-to-file "sortedList.txt" #:exists 'replace
    (lambda () 
			(for ([i bowlers])
				(displayln i))
		))

;print to console to verify (comment out once verified)
; bowlerList