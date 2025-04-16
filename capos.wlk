object rolando {
   // const artefactos   = [espada,espada]  //Lista    / List No uso list en este caso, sino set 
                                                    //porque si tengo dos espadas es la misma espada
    const artefactos = #{espada,libro,libro} //Conjunto /Set
    var capacidad = 2
    const morada = castillo
    const historial = [] //Ahora si quiero repetidos por eso uso lista

    method incrementarCapacidad(cantidad) {
        capacidad += cantidad
    }
    
    
    method artefactos() {
        return artefactos
    }  
    method posesiones() {
        return artefactos + morada.baul()//es de tipo de la primera coleccion
    } 

    method artefactosLista() {
        return artefactos
    }


    method encontrar(artefacto) {
        if(self.tieneCapacidad()){
            artefactos.add(artefacto)
        }
        historial.add(artefacto)
    }

    method historial() {
        return historial
    }

    method tieneCapacidad(){
        return artefactos.size() < capacidad 
    } 

    method irAMorada() {
        morada.depositar(artefactos)
        artefactos.clear()  //artefactos.removeAll(artefactos)
    }

}
//############### Morada ##################

object castillo {
    const baul = #{} //Es conjunto porque son artefactos unicos

    method depositar(artefactos) {
        baul.addAll(artefactos)
    }

    method baul() {//Para testear 
        return baul 
    }

}




//######## Artefactos #############

object espada {

}

object libro {

}
object collar {

}

object armadura {

}