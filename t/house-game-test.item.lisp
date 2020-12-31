;;;; house-game-test.item.lisp -- tests item database to see if it works correctly

(defpackage house-game-test.item
  (:use :cl))
(in-package :house-game-test.item)

(defun item-add-test ()
  "Test the adding of an item to the database."
  (let ((item-database nil))
    (hgame-item:add-item "Tree" "T" "it will harm you" item-database)
    (print (first item-database))
    (hgame-item:add-item "Tree 2" "T" "this one /will/ harm you" item-database)
    (hgame-item:add-item "Tree 3" "T" "this one /will/ harm you forever" item-database)
    (hgame-item:print-database item-database)))

(item-add-test)
