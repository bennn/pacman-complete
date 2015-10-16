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

(define (small-sprite x y)
  (crop x y sprite-width sprite-height spritemap))
(define (mid-sprite x y)
  (crop x y (* 2 sprite-width) (* 2 sprite-height) spritemap))
(define (large-sprite x y)
  (crop x y (* 4 sprite-width) (* 4 sprite-height) spritemap))

;; Numbers 0-9
(define number*
  (let ([Y 0])
    (for/vector ([pre-x (in-range 0 10)])
      (small-sprite (* pre-x sprite-width) Y))))

;; Pacman death sequence
(define death*
  (let ([Y (* 14 sprite-height)])
    (for/vector ([pre-x (in-range 4 15 2)])
      (let ([X (* pre-x 2 sprite-width)])
        (mid-sprite X Y)))))

;; (for ([d (in-vector death*)] [i (in-naturals)])
;;   (save-image d (format "d~a.png" i)))

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
