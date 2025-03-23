# **🛒 DigitalStore - Venta de Producto Digital en ETH**

## **📝 Overview**

El contrato inteligente **DigitalStore** permite a los usuarios adquirir un producto digital pagando en Ether. Está diseñado para practicar y aplicar el manejo de Ether en Solidity utilizando las mejores prácticas modernas.

En esta versión simplificada se eliminó la lógica duplicada y se dejó una única forma segura de:
- Comprar un producto (`buyProduct()`).
- Retirar los fondos (`withdraw()` usando `call`).

> [!NOTE]  
> Este contrato utiliza Solidity `0.8.28` y no requiere librerías externas como OpenZeppelin.

### **🔹 Key Features:**
- ✅ Precio fijo del producto digital (0.01 ETH).
- ✅ Registro único de compradores.
- ✅ Retiro de fondos por el owner utilizando `call`.
- ✅ Contrato optimizado y minimalista.

---

## **✨ Features**

### **🛍️ Compra de Producto Digital**
- El producto cuesta `0.01 ether`.
- Los usuarios deben pagar el monto exacto.
- Solo se permite una compra por dirección.
- La función `buyProduct()` gestiona toda la lógica de compra.
  
### **📤 Retiro de Fondos Seguro**
- Solo el `owner` puede retirar los fondos acumulados.
- Se usa `call` para enviar el Ether, el método más flexible y recomendado.
- Se emite un evento al realizar el retiro.

> [!IMPORTANT]  
> Si el usuario intenta pagar un monto incorrecto o comprar dos veces, la transacción se revierte automáticamente.

---

## **📖 Contract Summary**

### **Core Functions**

| 🔧 Function Name        | 📋 Description                                                        |
|------------------------|------------------------------------------------------------------------|
| `buyProduct()`         | Permite a un usuario comprar el producto pagando exactamente 0.01 ETH. |
| `withdraw(address)`    | El owner retira todos los fondos del contrato utilizando `call`.       |
| `getBuyers()`          | Devuelve una lista de todas las direcciones que han comprado.          |
| `getBalance()`         | Devuelve el balance actual del contrato en ETH.                        |

---

## **⚙️ Prerequisites**

### **🛠️ Tools Required:**
- **🖥️ Remix IDE**: Para desplegar y
