;;;; house-game.player.lisp --- implementation of in-game player.
(defpackage house-game.player
  (:use :cl)
  (:nicknames :hgame-player))
(in-package :house-game.player)

(defclass player ()
  ((username :reader username
			 :initarg :username
			 :initform "PLAYER"
			 :type string
			 :documentation "The username of the player.")
   (password :reader password
			 :initarg :password
			 :initform nil
			 :type string
			 :documentation "The password associated to the player.")
   (inventory :reader inventory
			  :initarg :inventory
			  :initform '()
			  :type list
			  :documentation "The inventory of the in-game player.")
   (is-online :reader is-online
			  :initform nil
			  :type boolean
			  :documentation "")
   (position :reader position
			 :initform '(0 0)
			 :type list
			 :documentation "The position of the player in the in-game world.")))

()
