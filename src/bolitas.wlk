import wollok.game.*
import tableroInicial.*
class Bolita {

	//var property color
	var property position = game.center()
	var property velocidadEnX
	var property velocidadEnY

	method image() = "bolita.png" // "bolita" /*/+ color/ + ".png" no ingresa de la forma comentada

	method moverseHacia(unaPosicion) {
		position = unaPosicion
	}

	method velocidadX() {
		self.moverseHacia(self.position().right(velocidadEnX))
	}
	
	method invertirVelocidadX() {
		velocidadEnX *= -1
	}
	
	method invertirVelocidadY() {
		velocidadEnY *= -1
	}

	method velocidadY() {
		self.moverseHacia(self.position().up(velocidadEnY))
	}

	method movete(direccion) {
		game.removeVisual(self)
	}

}

//prueba de commit

