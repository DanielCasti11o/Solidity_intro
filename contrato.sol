// CONSTRUCTORES EN SOLIDITY
// 	constructor(string memory _nombre) { // basicamente es declarar una variable que sera el constructor
// nombre = _nombre;               // y aqui darle el valor que sera lo que recibirá como parametro
// }

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.29;

contract Primer_contrato
{
	string public nombre = "Daniel"; // datas que puedes meterle
	address payable public venta; // address guarda una direccion ETH de 20 bytes
	address payable public compra; // payable puede recibir ether y public es que es visible la variable

	struct producto{
		string nombre; // Nombre del producto
		uint precio; // Unsigned int del precio del producto
		uint cantidad; // Uns int
		bool completada; // booleano para saber si es verdadero o falso supongo de saber si la venta o compra se ha realizado
	}

	producto public Producto; // declaramos el tipo de estructura para nuestro producto

	constructor(string memory _nombre, string memory _producto, uint _precio, uint _cantidad) { // constructor
	nombre = _nombre;
	Producto = producto(_producto, _precio, _cantidad, false);
	}

	function realizarPedido() public { // declaramos la funcion RealizarPedido que es accesible para más gente

		compra = payable(msg.sender); // con esto estamos registrado la direccion
									  //de la persona comprador(msg.sender) y que pueda recibir eth
		require(Producto.cantidad > 0, "Producto agotado"); // Comprueba la disponibilidad
		Producto.cantidad -= 1;
		Producto.completada = true;
	}
}
