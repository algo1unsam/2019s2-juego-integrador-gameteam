class Direccion {

	method siguiente(position)

	method dirije(posicion)

}

object izquierda inherits Direccion {

	override method siguiente(position) = position.left(1)
	override method dirije(posicion){}

	method opuesto() = derecha

}

object derecha inherits Direccion {

	override method siguiente(position) = position.right(1)
	override method dirije(posicion){}

	method opuesto() = izquierda

}

object abajo inherits Direccion {

	override method siguiente(position) = position.down(1)
	override method dirije(posicion){}

	method opuesto() = arriba

}

object arriba inherits Direccion {

	override method siguiente(position) = position.up(1)
	override method dirije(posicion){}

	method opuesto() = abajo

}

