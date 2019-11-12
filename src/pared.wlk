import wollok.game.*
import tableroInicial.*
import jugador.*

import bolitas.*


class Pared {
	var property position
	
	method image() = "muro.png"
}

class ParedVertical inherits Pared {
	
	method interactuarConBolita(bolita) {
		bolita.invertirVelocidadX()
	}
}

class ParedHorizontal inherits Pared {
	
	method interactuarConBolita(bolita) {
		bolita.invertirVelocidadY()
	}
}

class ParedInferior inherits ParedHorizontal {}

class ParedSuperior inherits ParedHorizontal {}

class ParedDerecha inherits ParedVertical {}

class ParedIzquierda inherits ParedVertical {}