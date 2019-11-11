import wollok.game.*
import tableroInicial.*
import jugador.*

class Pared {
	var property position
	
	method image() = "muro.png"
}

class ParedVertical inherits Pared {
	
	method interactuarCon(bolita) {
		bolita.invertirVelocidadX()
	}
}

class ParedHorizontal inherits Pared {
	
	method interactuarCon(bolita) {
		bolita.invertirVelocidadY()
	}
}

class ParedInferior inherits ParedHorizontal {}

class ParedSuperior inherits ParedHorizontal {}

class ParedDerecha inherits ParedVertical {}

class ParedIzquierda inherits ParedVertical {}