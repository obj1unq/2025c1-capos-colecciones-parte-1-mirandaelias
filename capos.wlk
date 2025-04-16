object rolando {
   // const artefactos   = [espada,espada]  //Lista    / List No uso list en este caso, sino set 
                                                    //porque si tengo dos espadas es la misma espada
    const artefactos = #{espada,libro,libro} //Conjunto /Set
    var capacidad = 2
    const morada = castillo
    const historial = [] //Ahora si quiero repetidos por eso uso lista
    var property poderBase = 100 //property es como el setter

    method incrementarCapacidad(cantidad) {
        capacidad += cantidad
    }
    
    method poder(){
        return poderBase + self.poderDeLosArtefactos()
    }                                           
    method poderDeLosArtefactos(){
        return artefactos.sum({artefacto => artefacto.poder(self)})
    }                                   //le meto un transformer para 
                                        //pasar de artefaco a energia
    
    method batalla() {//Si es una accion es foreach
      poderBase += 1 
      artefactos.forEach({artefacto => artefacto.usar()})
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

    method artefactoInvocado(){
        return morada.artefactoInvocado(self)
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

    method artefactoInvocado(personaje){
        return baul.max({artefacto =>artefacto.poder(personaje)})
    } 

}




//######## Artefactos #############

object espada {
    var nueva = true
 
 method poder(personaje) {
    
    return  personaje.poderBase() * if (nueva) {1} else {0.5}
 }
 
 /*   method poder(personaje) {
      if(nueva){
        return personaje.poderBase()
      }
      else{
        return personaje.poderBase()*0.5
      }
    }*/
    method usar() {
      nueva = false
    }
}

object libro {
    var property hechizos = []

    method poder(personaje) {
      return if (hechizos.esEmpty()) {0} else hechizos.first().poder(personaje)
    }

    method usar() {
      hechizos = hechizos.drop(1) //porque drop devuelve una nueva lista
    }

}
object collar {
    var vecesUsada = 0
    method poder(personaje) {
      return 3 + if(personaje.poderBase()>6) vecesUsada else 0
    }
}

object armadura {
    method poder(personaje) {
      return 6
    }

    method usar() {
      
    }
}

//////Hechizos///////

object bendicion {
  method poder(personaje){
    return 4
  } 
}

object invisivilidad {
    method poder(personaje){
    return personaje.poderBas()
  } 
}

object invocacion {
    method poder(personaje){
        return personaje.artefactoInvocado()
  } 
}


/*
Obtener el artefacto mas poderoso de la morada 
---------------------------------------------

const artefactosDeMorada = personaje.morada().baul()
const artefactoMasPoderoso= artefactosDeMorada.max
                            ({artefacto =>artefacto.poder(personaje)})
                                            //uso max para saber el maximo
                                            //uso un transformer tambien
                                            //pero sigue devolviendo un artefacto
return artefactoMasPoderoso.poder (personaje)
*/      //ahora con .poder(personaje) ya tengo el poder
//
