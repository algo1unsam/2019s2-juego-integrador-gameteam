import wollok.game.*
import tableroInicial.*
class Bolita {
   //Cada bolita al comenzar el juego tiene un color, elegido entre una lista de colores, aparece en el centro del tablero y se mueve en una cierta direccion
	var property color
	var property position = game.center()
	var property velocidadEnX
	var property velocidadEnY

	method image() = "bolita" + color + ".png" //segun su color es la imagen correspondiente
	
	
	//Moverse implica cambiar posicion
	method moverseHacia(unaPosicion) {
		position = unaPosicion
	}
	//Genera movimiento horizontal
	method moverseSegunVelocidadX() {
		self.moverseHacia(self.position().right(velocidadEnX))
	}
	//cambia sentido del movimiento horizontal
	method invertirVelocidadX() {
		velocidadEnX *= -1
	}
	//cambia sentido del movimiento vertical
	method invertirVelocidadY() {
		velocidadEnY *= -1
	}
	//Genera movimiento vertical
	method moverseSegunVelocidadY() {
		self.moverseHacia(self.position().up(velocidadEnY))
	}

	method movete(direccion) {
		game.removeVisual(self)
	}
	
	method desaparecer() {
		game.removeVisual(self)
		tablero.cantBolitasDelColorDelJugador(bolitasrestantes -=1) // restar una bolita y mostrar el contador con una menos
		game.addvisual(tablero.getCantBolitasDelColorDelJugador()) //en contador de cant de bolitas del color del jugador
		if (tablero.cantBolitasDelColorDelJugador == 0) {
			game.addVisual(jugadorGanador)
			game.addVisual(win) // en contador de vidas
												
		}
	}

}

class BolitaNegra inherits Bolita {
	var property peligrosidad = 0
	var property color = negra
	
	method image() = "bolitaNegra" + peligrosidad.toString() + ".png"
 	
	override invertirVelocidadX() {
		
		velocidadEnX *= -2
	
	}
	
	override invertirVelocidadY() {
		
		velocidadEnY *= -2
	
	}
}

