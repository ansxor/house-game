(defsystem house-game-test
  :author "answer <answerxox@gmail.com>"
  :license "MIT"
  :depends-on (:house-game)
  :components ((:module "t"
				:serial t
				:components
				((:file "house-game")))))
