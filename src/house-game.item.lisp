;;;; house-game.item.lisp -- implementation of the items on the game server.
(ql:quickload '(:yason :alexandria))

(defpackage house-game.item
  (:use :cl)
  (:nicknames :hgame-item)
  (:export :add-item
           :clear-database
		   :*item-db*
           :name
		   :display
           :description
		   :item-type
		   :print-database))
(in-package :house-game.item)

;;; The implementation of the item.
(defclass item ()
  ((name :reader name
		 :initarg :name
		 :initform "?????"
		 :type string
		 :documentation "The name of the in-game item.")
   (display :reader display
			:initarg :display
			:initform "?"
			:type string
			:documentation "The display character for the screen for standard client.")
   (description :reader description
				:initarg :description
				:initform "?????"
				:type string
				:documentation "A description of the in-game item.")
   (item-type :reader item-type
			  :initarg :item-type
			  :initform :wall
			  :type keyword
			  :documentation "How the item interacts with the game. The available types are `:floor', `:decoration', `:item' and `:wall'")
   (action-type :reader action-type
				:initarg nil
				:initform :none
				:type keyword
				:documentation "The type of action that the item has when interacting with the game.")
   (action :reader action
		   :initarg nil
		   :initform nil
		   :type function
		   :documentation "The action assigned to the item assigned via a lambda."))
  (:documentation "Representation of an in-game item."))

(defmethod hashed-representation ((obj item))
  (with-accessors ((name name)
				   (description description)
				   (display display))
	  obj
	(alexandria:plist-hash-table (list "name" name
									   "description" description
									   "display" display))))

(defmethod print-object ((obj item) stream)
  (format stream "~a"
		  (yason:encode (hashed-representation obj))))

;;; Helpers to add items to the database.
(defun create-item (name display description)
  "Create an item that is suitable to be added to the database.
  This exists more for testing purposes over more interactive items in the game."
  (make-instance 'item :name name :display display :description description))

(defmacro add-item (name display description database)
  "Create an item and then add it to the database"
  `(push (create-item ,name ,display ,description) ,database))

;;; To help with manipulating the database in general.
(defmacro clear-database (database)
  "Clear the database. This should rarely be used but is an available option."
  `(setf ,database nil))

(defun print-database (database)
  "Print the entire contents of the database in JSON format."
  (yason:encode (reverse (mapcar #'hashed-representation database))))
