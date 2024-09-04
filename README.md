# RentaEnLineaDePropiedades

**Sistema:** renta en línea de propiedades.

Se requiere llevar el control de los préstamos que los bancos de la corporación “la casa de mis sueños” realizan a los deudores (clientes) que quieren rentar propiedades.

**Condiciones:**

• La tabla banco contiene los registros de los bancos que realizan prestamos.

• La tabla deudor contiene la información de clientes que podrían tener prestamos.

• La tabla de préstamo tiene el monto del préstamo otorgado a un deudor en una determinada fecha por parte de un banco.

• La tabla de abonos tiene los pagos que se realizan sobre un préstamo.

**Restricciones:**

• El tipo de documento y el número de documento del deudor son llave natural (juntas)

• El nombre del banco es llave natural

• La columna valor_otorgado en préstamo se refiere al valor prestado al deudor y debe tener valor 0 por defecto y no puede ser negativo.

• Ninguna columna admite nulos.

• La columna genero solo puede contener dos posibles valores ‘m’,’f’; masculino o femenino.

• La fecha del préstamo es de tipo datetime con valor por defecto sysdate.

• En préstamo: el banco, el deudor y la fecha no puede repetirse (es la llave natural).

• En abonos: el préstamo y la fecha no se puede repetir (llave natural).

• La columna ‘pagado’ en préstamo identificará si ya se pagó la totalidad del préstamo, los posibles valores son ‘si’ y ‘no’ y tiene ‘no’ como valor por defecto.

**Desarrollo:**

Construcción de las siguientes consultas generadas en forma de vistas

1. ¿Cuál es el valor total de préstamos por año? La vista debe tener el año y el valor total de préstamos.

a. Utilice la opción EXTRACT(year from fecha) para extraer el año

b. También puede usar para procesar fechas la función TO_CHAR o TO DATE

c. Asegúrese que en el resultado aparezcan filas de diferentes años

2. ¿Cuál es el valor total de los préstamos de un año, mes para los bancos? La vista debe tener las columnas nombre banco, año, mes, valor total préstamos otorgados

3. ¿Cuál es el saldo de cada préstamo? La vista debe tener nombre del deudor, valor otorgado, valor abonado, saldo (diferencia de las anteriores).

4. Produzca un listado que contenga nombre y cedula del deudor, nombre del banco, fecha y valor del préstamo, ordenado por tipo y numero de documento.

5. ¿Cuántos préstamos tiene cada deudor? Liste el nombre del deudor, suma total de préstamos. Los deudores que aún no tengan préstamos deben aparecer en el resultado con 0.

a. Asegúrese que en el resultado aparezca un deudor que no tenga préstamos.

6. ¿Cuál es el valor total de préstamos por año? Liste el año y el valor total de préstamos. En una última fila debe aparecer el valor total de todos los préstamos, esto es, la suma de préstamos de todos los años.

7. ¿Qué deudor ha tenido prestamos en todos los bancos que existen? Liste el nombre del deudor.

a. Asegúrese que en el resultado aparezcan filas

8. ¿Cuáles son los bancos que tienen un promedio de préstamos por año mayor al promedio de préstamos general por año? Liste el nombre del banco, el año, el promedio general del año y el promedio del banco en ese año.

9. Actualice la columna PAGADO de PRESTAMO teniendo en cuenta que se debe asignar ‘SI’ a la columna si:

a. Ya se ha pagado totalmente el préstamo, o sea, la suma de los abonos es mayor o igual al valor otorgado.
