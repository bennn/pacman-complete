#lang racket

;; (require 2htdp/image 2htdp/universe)
(require
 2htdp/image
 (only-in racket/draw
          read-bitmap)
)

;; =============================================================================
;; === constants

(define board-width 256)
(define board-height 256)
(define board (empty-scene board-width board-height))

(define sprite-width 12)
(define sprite-height sprite-width)

;; =============================================================================
;; ==- sprites

(define spritemap (bitmap "spritemap.png"))

(define (get-sprite x y w h)
  (crop x y w h spritemap))
(define (small-sprite x y)
  (get-sprite x y sprite-width sprite-height))
(define (mid-sprite x y)
  (get-sprite x y (* 2 sprite-width) (* 2 sprite-height)))
(define (large-sprite x y)
  (get-sprite x y (* 4 sprite-width) (* 4 sprite-height)))

;; -----------------------------------------------------------------------------
;; --- Static Sprites

;; Numbers 0-9
(define number*
  (let ([Y 0])
    (for/vector ([pre-x (in-range 0 10)])
      (small-sprite (* pre-x sprite-width) Y))))

;; Letters A-Z, plus ! and R at the end
(define letter*!R
  (let ([Y (* 2 sprite-height)])
    (for/vector ([pre-x (in-range 1 29)])
      (small-sprite (* pre-x sprite-width) Y))))

;; The string "pts"
(define pts
  (get-sprite (* 29 sprite-width) (* 2 sprite-height) (* 2 sprite-width) sprite-height))

(define fruit*
  (let ([Y (* 10 sprite-height)])
    (for/vector ([pre-x (in-range 0 15 2)])
      (mid-sprite (* sprite-width pre-x) Y))))

;; -----------------------------------------------------------------------------
;; --- Animated Sprites

;; Animated sprites come in pairs of 2.
;; We display a different member of the pair at each tick

;; Food pellets
(define dot*
  (let ([Y 0])
    (for/vector ([pre-x (in-range 16 24 2)])
      (cons (small-sprite (* pre-x sprite-width) Y)
            (small-sprite (* (+ 1 pre-x) sprite-width) Y)))))

(require (only-in racket/format ~a))
;; (for ([d (in-vector dot*)] [i (in-naturals)])
;;   (save-image (car d) (format "d~aa.png" (~a i #:min-width 2 #:align 'right #:left-pad-string "0")))
;;   (save-image (cdr d) (format "d~ab.png" (~a i #:min-width 2 #:align 'right #:left-pad-string "0"))))

;; (define ghost**
;;   TODO)

;; (define eyes*
;;   TODO)

;; (define pacman*
;;   TODO)

;; -----------------------------------------------------------------------------
;; --- Misc sprites

;; Pacman death sequence
(define death*
  (let ([Y (* 14 sprite-height)])
    (for/vector ([pre-x (in-range 4 15 2)])
      (let ([X (* pre-x 2 sprite-width)])
        (mid-sprite X Y)))))

;; (define wall*
;;   TODO HOW TO REPRESENT?)



;(define b (make-object bitmap% sprite-width sprite-height))
;; (define r% (new region% [dc sprites%]))
;; (send r% set-rectangle 0 0 sprite-width sprite-height)
;(define z (send sprites% get-argb-pixels 0 0 sprite-width sprite-height b))

;; place-image ?
;; (send board draw-bitmap-section
;;       spritemap%
;;       0 0
;;       0 0
;;       sprite-width sprite-height)

;; TODO show the board


(define (setup)
  'TODO)

(define (draw TODO)
  TODO)

(define (handle-key TODO)
   TODO)

(define (handle-tick TODO)
  TODO)

#;(big-bang (setup)
          [on-draw draw]
          [on-key handle-key]
          [on-tick handle-tick])
