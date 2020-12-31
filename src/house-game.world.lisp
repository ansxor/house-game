;;;; house-game.world.lisp --- implementation of the world.
(defpackage house-game.world
  (:use :cl)
  (:nicknames :hgame-world)
  (:export :generate-test-chunk
           :generate-world
           :get-chunk))
(in-package :house-game.world)

(defparameter +chunk-size+ '(16 40)
  "The size of the chunks in the world.")

(defparameter +world-size+ '(128 128)
  "The predefined size of the world")

(defparameter *world-data* nil)

(defun generate-test-chunk (seed x y)
  "Returns a zeroed chunk for testing."
  (make-array +chunk-size+ :initial-element 0))

(defun generate-world (seed generator-function)
  "Generate a world using the GENERATOR-FUNCTION, which is then fed the x, y and SEED 
  for generating chunks in the world."
  (setf *world-data* (make-array +world-size+ :initial-element nil))
  (destructuring-bind (n m) (array-dimensions *world-data*)
    (loop for i from 0 below n do
      (loop for j from 0 below m do
            (setf (aref *world-data* i j) (funcall generator-function seed i j))))))

(defun get-chunk (x y)
  (aref *world-data* y x))
