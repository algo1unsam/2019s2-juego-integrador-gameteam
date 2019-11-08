import wollok.game.*
import bolitas.*
import pared.*
import jugador.*

/*object tablero {
 * 	var property bolitas = []
 * 	var property colores = ["amarilla", "roja", "azul", "naranja", "lila", "verde"]
 * 	
 * 	
 * 	method crearBolitas(unaCantidadDeBolitas) {
 * 		
 * 	}
 * 	
 * 	method crearBolita() {
 * 		var bolita = new Bolita(color = self.eligeColor(), velocidadEnX = self.determinaVelX(), velocidadEnY = self.determinaVelX())
 * 	}
 * 	
 * 	method eligeColor() {
 * 		return colores.anyOne()
 * 	}
 * 	
 * 	method determinaVelX() {
 * 		return 0.randomUpTo((game.width()))
 * 	}
 * 	
 * 	method determinaVelY() {
 * 		return 0.randomUpTo((game.height()))
 * 	}
 * 	
 }*/
object nivel1 {

	method cargar() {
		
		//	PAREDES
		const ancho = game.width() - 1
		const largo = game.height() - 1
		var posParedes = []
		(0 .. ancho).forEach{ n => posParedes.add(new Position(x = n, y = 0))} // bordeAbajo
		(0 .. ancho).forEach{ n => posParedes.add(new Position(x = n, y = largo))} // bordeArriba 
		(0 .. largo).forEach{ n => posParedes.add(new Position(x = 0, y = n))} // bordeIzq 
		(0 .. largo).forEach{ n => posParedes.add(new Position(x = ancho, y = n))} // bordeDer
		posParedes.forEach{ p => self.dibujar(new Pared(position = p))}
		
		// BOLITAS
		var posBolitas =[]
		const determinaVelX=  0.randomUpTo((game.width()))
		const determinaVelY=0.randomUpTo((game.height()))
		
		(0 .. determinaVelX).forEach{ n => posBolitas.add(new Position(x = determinaVelX, y = determinaVelY))}
		(0 .. determinaVelY).forEach{ n => posParedes.add(new Position(x = 0, y = n))} // bordeIzq 
		
		posBolitas.addAll([new Position(x=3,y=5), new Position(x=4,y=5), new Position(x=5,y=5)])
		posBolitas.addAll([new Position(x=1,y=2), new Position(x=2,y=2),new Position(x=6,y=2), new Position(x=7,y=2)])
		posBolitas.addAll([new Position(x=1,y=1), new Position(x=2,y=1),new Position(x=6,y=1), new Position(x=7,y=1)])
		
		posBolitas.forEach{ p => self.dibujar(new Bolita())}
		
		/*var property bolitas = []
  		var property colores = ["amarilla", "roja", "azul", "naranja", "lila", "verde"]
		
		method determinaVelX() {
 		return 0.randomUpTo((game.width()))
 	}
 	
 		method determinaVelY() {
 		return 0.randomUpTo((game.height()))
 	}
 	*/
		// jugador
		game.addVisual(jugador)
		
		//	TECLADO
		keyboard.up().onPressDo{ jugador.irArriba()}
		keyboard.down().onPressDo{ jugador.irAbajo()}
		keyboard.left().onPressDo{ jugador.irIzquierda()}
		keyboard.right().onPressDo{ jugador.irDerecha()}
		keyboard.r().onPressDo{ self.restart() }
		
		// COLISIÓNES
		game.whenCollideDo(jugador, { e => jugador.empuja(e) })
		
	}
//-----------------------------------------------------------------------------------------------------------
	method restart() {
		game.clear()
		self.cargar()
	}

	method dibujar(dibujo) {
		game.addVisual(dibujo)
		return dibujo
	}


}

