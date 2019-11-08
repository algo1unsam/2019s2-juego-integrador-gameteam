import wollok.game.*
import bolitas.*
import pared.*
import jugador.*

object nivel1 {
//BOLITA	
	var posBolitas = []
	var posParedes = []
	var cant = 5
	var property position
	const ancho = game.width() - 1
	const largo = game.height() - 1
	
/*	method carBolita() {

		(0 .. cant).forEach{ p => posBolitas.add(new Bolita())}}
		
		
	method dibjuarBolita(){	posBolitas.forEach{ p => self.dibujar(new Bolita())}
	}
	
*/	method dibujar(e) {
		game.addVisual(e)
	}
// -----------------------------Carga------------------------
method cargar() {
		
//	PAREDES
		(0 .. ancho).forEach{ n => posParedes.add(new Position(x=n, y=0)) } // bordeAbajo
		(0 .. ancho).forEach{ n => posParedes.add(new Position(x=n, y=largo)) } // bordeArriba 
		(0 .. largo).forEach{ n => posParedes.add(new Position(x=0, y=n)) } // bordeIzq 
		(0 .. largo).forEach{ n => posParedes.add(new Position(x=ancho, y=n)) } // bordeDer
		
		
		posParedes.forEach { p => self.dibujar(new Pared(position = p)) }	
      
//CARGA BOLITA
(0 .. cant).forEach{ p => posBolitas.add(new Position(x=n, y=0))}

posBolitas.forEach{ p => self.dibujar(new Bolita())}
		
//	self.dibjuarBolita()
				
//	JUGADOR

		game.addVisual(jugador)

//	TECLADO
		keyboard.up().onPressDo{ jugador.irArriba() }
		keyboard.down().onPressDo{ jugador.irAbajo() }
		keyboard.left().onPressDo{ jugador.irIzquierda() }
		keyboard.right().onPressDo{ jugador.irDerecha() }

		keyboard.r().onPressDo{ self.restart() }
		
		
		
//	COLISIÓNES
		game.whenCollideDo(jugador, { e => jugador.empuja(e) })
	}
//------------------------------------------------------------------------------------------------------------	
	method restart() {
		game.clear()
		self.cargar()
	}
	
		
}	

