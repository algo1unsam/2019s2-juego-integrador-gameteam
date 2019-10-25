import wollok.game.*
import direcciones.*
import jugador.*

class Bolita {

	var property position = game.center()
	var property dirX = (game.width() - 1).randomUpTo(0)
	var property dirY = (game.height() - 1).randomUpTo(0)

	method image() = "bolita.png"

	method avanzar() {
		position = game.at(self.dirX(), self.dirY())
		return position
	}

	method dirX(velX) {
		self.moverseHacia(self.position().right(velX))
	}

	method dirY(velY) {
		self.moverseHacia(self.position().up(velY))
	}

	method moverseHacia(nuevaPosition) {
		position = nuevaPosition
	}

}

}

class Dir {

	var property x = 0
	var property y = 0

}

/*	// var property color = "rojo"
 * 	var property position
 * 	var property dirX
 * 	var property dirY
 * 	var property dirije

 * 	method position(e){
 * 		position = e
 * 	}
 * 	
 * 	method dirx(x) {
 * 		dirX = x
 * 	}

 * 	method dirY(y) {
 * 		dirX = y
 * 	}

 * 	method image() = "bolita.png" //"bolita"+position+dirY+dirX+dirije+".png"

 * 	method inicia() {
 * 		game.onTick(700, "movimientoBolita", {=> self.avanzar()})
 * 	}

 * 	method avanzar() {
 * 		position = game.at(self.dirX(),self.dirY())
 * 		return position
 * 	}

 * 	method retrocede(positionPared) {
 * 		dirije = dirije.opuesto()
 * 		position = new Position(x = 0.randomUpTo(13), y = 0.randomUpTo(7))
 * 		game.onTick(700, "movimientoBolita", {=> dirije.opuesto().siguiente(position)})
 * 	}

 * 	method empuja() {
 * 		game.removeVisual(self)
 * 	}

 * }

 // INTENTO DE PONER VARIAS BOLITAS*/
