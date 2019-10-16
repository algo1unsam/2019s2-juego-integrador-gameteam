import wollok.game.*
class Bolita {

	var property color
	var property position = game.center()
	var property velocidadEnX
	var property velocidadEnY

	method imagen() = "bolita.png" // bolita" /*/+ color.toString()*/ + ".png"

	method moverseHacia(unaPosicion) {
		position = unaPosicion
	}

	method velocidadX(velX) {
		self.moverseHacia(self.position().right(velX))
	}

	method velocidadY(velY) {
		self.moverseHacia(self.position().up(velY))
	}

	method movete(direccion) {
		game.removeVisual(self)
	}

}

