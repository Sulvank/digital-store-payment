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
- **🖥️ Remix IDE**: Para desplegar y probar el contrato ([Remix IDE](https://remix.ethereum.org)).
- **Metamask Wallet**: Para pruebas en testnet, si se desea.

### **🌐 Environment:**
- Solidity Compiler Version: `0.8.28`.
- Red recomendada: JavaScript VM (Remix) o Testnet como Goerli.

> [!TIP]  
> Asegúrate de usar exactamente `0.01 ether` como `value` al llamar a `buyProduct()`.

---

## **🚀 How to Use the Contract**

### **1️⃣ Desplegar el Contrato**

1. Abre [Remix IDE](https://remix.ethereum.org).
2. Crea un archivo llamado `DigitalStore.sol` y pega el código del contrato.
3. Selecciona la versión de compilador `0.8.28`.
4. Compila el contrato.
5. Despliega el contrato desde una cuenta (esa cuenta será el `owner`).

### **2️⃣ Comprar el Producto**

- Cambia de cuenta en Remix (diferente a la del owner).
- En el campo `VALUE`, escribe exactamente `0.01` y selecciona `ether`.
- Llama a `buyProduct()`.
- Verifica que se registre tu compra con `hasPurchased(address)` o `getBuyers()`.

### **3️⃣ Retirar los Fondos**

- Vuelve a la cuenta `owner`.
- Llama a `withdraw(address payable to)` y pasa tu dirección para recibir el Ether.
- Verifica que el balance del contrato quede en 0 llamando a `getBalance()`.

> [!WARNING]  
> Si otro usuario intenta llamar a `withdraw()`, la transacción fallará.

---

## **🛠️ Extending the Contract**

### **🔍 Posibles Mejoras Futuras**
- **🔐 Acceso a contenido privado solo si has comprado.**
- **🧾 Emisión de NFT como comprobante de compra.**
- **📦 Sistema con múltiples productos con precios diferentes.**
- **💬 Comentarios o valoraciones por parte de los compradores.**

> [!CAUTION]  
> Siempre prueba cualquier mejora en testnet y revisa la seguridad antes de ir a producción.

---

## **📜 License**

Este proyecto está licenciado bajo la licencia MIT.

---

### 🚀 **DigitalStore es un ejemplo claro y limpio para aprender a manejar Ether de forma profesional en Solidity.**
