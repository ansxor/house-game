;;;; house-game-test.world.lisp --- tests aspects related to in-game world.
(defpackage house-game-test.world
  (:use :cl))
(in-package :house-game-test.world)

(defun render-chunk(chunk-data item-dataset)
  "Render the CHUNK-DATA with the ITEM-DATASET that is passed to it using `format'"
  (destructuring-bind (n m o) (array-dimensions chunk-data)
	(loop for i from 0 below n do
	  (loop for j from 0 below m do
		(format t "~a" (hgame-item:display (nth (aref chunk-data i j 2) item-dataset))))
		  do (format t "~%"))))

(defun chunk-render-test ()
  "Populate a dummy item database, generate a chunk and render it."
  (let ((item-dataset nil)
		(chunk (hgame-world:generate-test-chunk 0 0 0)))
	(hgame-item:add-item "Wooden Plank" "=" "OwO" item-dataset)
	(format t "~%")
	(render-chunk chunk item-dataset)))

(defun world-generate-test ()
  "Populate a dummy item database and generate a world."
  (let ((item-dataset nil))
	(hgame-item:add-item "water" "~" "wavy :3" item-dataset)
	(hgame-world:generate-world #'hgame-world:generate-test-chunk)
	(format t "~%CHUNK 1 1~%")
	(render-chunk (hgame-world:get-chunk 1 1) item-dataset)))

(chunk-render-test)

(world-generate-test)
