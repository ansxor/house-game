;;;; house-game-test.item.lisp -- tests item database to see if it works correctly

(defpackage house-game-test.item
  (:use :cl)
  (:import-from :house-game.item))
(in-package :house-game-test.item)

(defun item-add-test ()
  "Test the adding of an item to the database."
  (hgame-item:clear-database)
  (hgame-item:add-item "Tree" "T" "it will harm you")
  (print (first hgame-item:*item-db*))
  (hgame-item:add-item "Tree 2" "T" "this one /will/ harm you")
  (hgame-item:add-item "Tree 3" "T" "this one /will/ harm you forever")
  (hgame-item:print-database))

(item-add-test)
