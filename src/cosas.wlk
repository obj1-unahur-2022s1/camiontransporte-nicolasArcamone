object knightRider {
	
method peso()=500
method nivelPeligrosidad()=10

}

object bumblebee {
  var transformado  = true

method transformadoEnAuto(){transformado = true}
method transformadoEnRobot(){transformado = false}
method peso()=800
method nivelPeligrosidad(){return if(not transformado)  30 else 15}
}

object paqueteLadrillos{
	var cantLadrillos 

method agregarLadrillos(cantidad){cantLadrillos = cantidad}
method peso(){return cantLadrillos * 2}
method nivelPeligrosidad()=2
method cantidadLadrillos()=cantLadrillos
}


object arenaGranel {
	var pesoActual 

method aniadirPeso(kgs){pesoActual = kgs}
method peso()= pesoActual
method nivelPeligrosidad()=1
}

object bateriaAntiaerea {
	var tieneMisiles = true

method cargarMisiles(){ tieneMisiles = true}
method noEstaCargada() {tieneMisiles = false}
method peso(){return if( tieneMisiles)  300 else 200}
method nivelPeligrosidad(){return if( tieneMisiles)  100 else 0}
}

object contenedor {
	const cosasDentro = []
	const pesoBase = 100

method cosasDentroContenedor()= cosasDentro
method cargar(objeto){cosasDentro.add(objeto)}	
method peso(){return pesoBase + cosasDentro.sum{c=>c.peso()} }
method nivelPeligrosidad(){if(self.estaVacio()) return 0 else return cosasDentro.max{c=>c.nivelPeligrosidad()}.nivelPeligrosidad()}
method estaVacio(){return cosasDentro.isEmpty()}

}

object residuosRadioactivos {
	var pesoActual 

method pesoAniadido(kgs){pesoActual = kgs}
method peso()= pesoActual
method nivelPeligrosidad() = 200


}

object embalajeSeguridad {
	var cosaDentro 

method cosaAEmbalar(cosa) { cosaDentro = cosa}	
method peso(){return cosaDentro.peso()}
method nivelPeligrosidad(){ return cosaDentro.nivelPeligrosidad() / 2}
}




