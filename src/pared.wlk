import wollok.game.*
import tableroInicial.*
import jugador.*

class Pared {
	var property position
	
	method image() = "muro.png"
	
	method rebotar(objeto) {
		objeto.invertirVelocidadX()
	}
}

class ParedInferior inherits Pared {}

class ParedSuperior inherits Pared {}

class ParedDerecha inherits Pared {}

class ParedIzquierda inherits Pared {}