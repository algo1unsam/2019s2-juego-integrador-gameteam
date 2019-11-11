import wollok.game.*
import tableroInicial.*
import jugador.*

/*class Bolita {


	

	method movete(direccion) {
		game.removeVisual(self)
	}

	method desaparecer() {
		game.removeVisual(self)
		tablero.eliminarBolitaColorJugador() // FALTA contador con una menos
		game.addvisual(tablero.getCantBolitasDelColorDelJugador()) // FALTA METODO BIEN en contador de cant de bolitas del color del jugador
		if (tablero.cantBolitasColorJugador() == 0) {
			jugador.position(jugador.position())
			game.addVisual(jugadorGanador)
			game.addVisual(win) // en contador de vidas
		}
	}

}

class BolitaNegra inherits Bolita {

	

	override invertirVelocidadX() {
		velocidadEnX *= -2
		if(peligrosidad < 8) peligrosidad +=1
	}

	override invertirVelocidadY() {
		velocidadEnY *= -2
	    if(peligrosidad < 8) peligrosidad +=1
	}

}

*/

class Bolita {

	// Cada bolita al comenzar el juego tiene un color, elegido entre una lista de colores, aparece en el centro del tablero y se mueve en una cierta direccion
	var property color
	var property position = game.at(1, 1)
	var property velocidadEnX 
	var property velocidadEnY
	

	// segun su color es la imagen correspondiente
   method image() = "bolita" + color + ".png"
   
   method aparecer() {
   	game.addVisual(self)
   	game.onCollideDo(self, {objeto => if(objeto!=self) objeto.interactuarCon(self)})
   }
   
   //method interactuarCon(objeto) {}
	
	// Moverse implica cambiar posicion
	method moverseHacia(unaPosicion) {
		position = unaPosicion
	}

	// Genera movimiento horizontal
	method moverseSegunVelocidadX() {
		self.moverseHacia(self.position().right(1))
	}

	// Genera movimiento vertical
	method moverseSegunVelocidadY() {
		self.moverseHacia(self.position().up(1))
	}
	
	// cambia sentido del movimiento horizontal
	method invertirVelocidadX() {
		velocidadEnX *= -1
		//self.moverseHacia(self.position().left(1))
	}

	// cambia sentido del movimiento vertical
	method invertirVelocidadY() {
		velocidadEnY *= -1
		//self.moverseHacia(self.position().down(1))
	}
	

	
	
	}
	
	
	class BolitaNegra inherits Bolita {

	var property peligrosidad = 0

	
	override method image() = "bolitanegra" + peligrosidad.toString() + ".png"
	
	override method invertirVelocidadX() {
		velocidadEnX *= -2
		if(peligrosidad < 8) peligrosidad +=1
	}

	override method invertirVelocidadY() {
		velocidadEnY *= -2
	    if(peligrosidad < 8) peligrosidad +=1
	}



}