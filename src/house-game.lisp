;;;; house-game.lisp

(defpackage house-game
  (:use :cl))
(in-package :house-game)

(defparameter *item-list* nil)

(defun add-item (item-definition)
  (push item-definition *item-list*))

(add-item (list :name "Tree" :display #\T :description "A regular tree"))
