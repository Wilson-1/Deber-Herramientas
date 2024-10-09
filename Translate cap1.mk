 Capítulo 1: Navegando por la Web

La World Wide Web se hizo popular porque la gente común puede usarla para hacer cosas realmente útiles con un entrenamiento 
mínimo. Pero, detrás de escena, la Web también es una plataforma poderosa para la computación distribuida.

Los principios que hacen que la Web sea utilizable por personas comunes también funcionan cuando el "usuario" es un agente 
de software automatizado. Un software diseñado para transferir dinero entre cuentas bancarias (o realizar cualquier otra 
tarea del mundo real) puede llevar a cabo la tarea utilizando las mismas tecnologías básicas que usaría un ser humano.

En lo que respecta a este libro, la Web se basa en tres tecnologías: la convención de nombres URL, el protocolo HTTP y el 
formato de documentos HTML. Las URL y HTTP son simples, pero para aplicarlas a la programación distribuida, debes entenderlas 
con más detalle que el desarrollador web promedio. Los primeros capítulos de este libro están dedicados a darte esta 
comprensión.

La historia de HTML es un poco más complicada. En el mundo de las APIs web, existen docenas de formatos de datos que 
compiten para reemplazar a HTML. Una exploración de estos formatos tomará varios capítulos de este libro, comenzando en el 
Capítulo 5. Por ahora, quiero enfocarme en URL y HTTP, y usar HTML solo como un ejemplo.

Voy a comenzar contando una historia simple sobre la World Wide Web, como una forma de explicar los principios detrás de 
su diseño y las razones de su éxito. La historia necesita ser simple porque, aunque probablemente estés familiarizado con 
la Web, es posible que no hayas oído hablar de los conceptos que la hacen funcionar. Quiero que tengas un ejemplo simple 
y concreto al cual recurrir si alguna vez te confundes con términos como "hipermedia como el motor del estado de la 
aplicación".

¡Comencemos!

Episodio 1: La Valla Publicitaria

Un día, Alice está caminando por la ciudad y ve una valla publicitaria (Figura 1-1).

![Figura 1-1. El cartel publicitario](C:/Users/wilso/Escritorio/Deber/cartel.png){width=width height=height}


(Por cierto, este cartel ficticio anuncia un sitio web real que diseñé para este libro. Puedes probarlo tú mismo).

Alice es lo suficientemente mayor como para recordar los años 90, así que recuerda la reacción del público cuando las URLs 
empezaron a aparecer en carteles publicitarios. Al principio, la gente se burlaba de esas cadenas de texto tan raras. No 
estaba claro qué significaban “http://” o “youtypeitwepostit.com”. Pero 20 años después, todo el mundo sabe qué hacer con 
una URL: escribirla en la barra de direcciones del navegador y presionar Enter.

Y eso es lo que hace Alice: saca su teléfono móvil y escribe http://www.youtypeitwepostit.com/ en la barra de direcciones 
de su navegador. El primer episodio de nuestra historia termina con suspenso: ¿qué habrá al otro lado de esa URL?

Recursos y Representaciones

Lamento interrumpir la historia, pero necesito introducir algunos términos básicos. El navegador web de Alice está a punto 
de enviar una solicitud HTTP a un servidor web, específicamente a la URL http://www.youtypeitwepostit.com/. Un servidor web 
puede alojar muchas URLs diferentes, y cada URL da acceso a un fragmento distinto de los datos en el servidor.

Decimos que una URL es la URL de alguna cosa: un producto, un usuario, la página principal. El término técnico para la cosa 
que nombra una URL es recurso.

La URL http://www.youtypeitwepostit.com/ identifica un recurso, probablemente la página principal del sitio web anunciado en 
el cartel. Pero no lo sabrás con certeza hasta que retomemos la historia y el navegador de Alice envíe la solicitud HTTP.


Aquí tienes la traducción al español del texto que proporcionaste:

Cuando un navegador web envía una solicitud HTTP para un recurso, el servidor responde con un documento (generalmente un 
documento HTML, pero a veces una imagen binaria u otro tipo de contenido). Cualquiera que sea el documento que el servidor 
envíe, lo llamamos una representación del recurso.

Por lo tanto, cada URL identifica un recurso. Cuando un cliente realiza una solicitud HTTP a una URL, recibe una representación
 del recurso subyacente. El cliente nunca ve el recurso directamente. Hablaré mucho más sobre recursos y representaciones en 
 el Capítulo 3. Por ahora, solo quiero usar los términos recurso y representación para discutir el principio de 
 direccionabilidad, al cual me referiré ahora.

Direccionabilidad
Una URL identifica un solo recurso. Si un sitio web tiene dos cosas conceptualmente diferentes, esperamos que el sitio las 
trate como dos recursos con diferentes URLs. Nos frustramos cuando un sitio web viola esta regla. Los sitios web de 
restaurantes son especialmente malos en esto. Frecuentemente, todo el sitio está enterrado dentro de una interfaz Flash y no 
hay una URL que apunte al menú o al mapa que muestra dónde se encuentra el restaurante, cosas sobre las que nos gustaría 
hablar por separado.

El principio de direccionabilidad simplemente dice que cada recurso debería tener su propia URL. Si algo es importante para 
tu aplicación, debería tener un nombre único, una URL, para que tanto tú como tus usuarios puedan referirse a ello de manera 
inequívoca.

Episodio 2: La Página Principal
Volviendo a nuestra historia. Cuando Alice introduce la URL del cartel publicitario en la barra de direcciones de su 
navegador, este envía una solicitud HTTP por Internet al servidor web en http://www.youtypeitwepostit.com/:

GET / HTTP/1.1
Host: www.youtypeitwepostit.com
El servidor web maneja esta solicitud (ni Alice ni su navegador necesitan saber cómo) y envía una respuesta:
HTTP/1.1 200 OK
Content-type: text/html
<!DOCTYPE html>
<html>
 <head>
   <title>Inicio</title>
 </head>
 <body>
   <div>
     <h1>¡Tú lo escribes, nosotros lo publicamos!</h1>
     <p>¡Emocionante! ¡Increíble!</p>
     <p class="links">
       <a href="/messages">Comenzar</a>
       <a href="/about">Sobre este sitio</a>
     </p>
   </div>
 </body>
</html>

El número 200 al comienzo de la respuesta es un código de estado, también llamado código de respuesta. Es una manera rápida 
en que el servidor le indica al cliente aproximadamente qué pasó con su solicitud. Existen muchos códigos de estado HTTP, 
y los cubro todos en el Apéndice A, pero el más común es el que ves aquí. El 200 (OK) significa que la solicitud se cumplió 
sin problemas.

El navegador web de Alice decodifica la respuesta como un documento HTML y lo muestra gráficamente (ver Figura 1-2).
![Figura 1-2. Página de inicio de You Type It…](C:/Users/wilso/Escritorio/Deber/Página de inicio.png){width=width 
height=height}
Ahora Alice puede leer la página web y entender de qué estaba hablando el cartel publicitario. Anunciaba un sitio de 
microblogging, similar a Twitter. No tan emocionante como se anunciaba en el cartel, pero lo suficientemente bueno como 
ejemplo.

La primera interacción real de Alice con el servidor web revela un par de características más importantes de la Web.

Sesiones Cortas
En este punto de la historia, el navegador de Alice está mostrando la página de inicio del sitio. Desde su perspectiva, 
ha "aterrizado" en esa página, lo que es su "ubicación" actual en el ciberespacio. Pero en lo que respecta al servidor, 
Alice no está en ninguna parte. El servidor ya se ha olvidado de ella.
Las sesiones HTTP duran solo para una solicitud. El cliente envía una solicitud y el servidor responde. Esto significa que 
Alice podría apagar su teléfono durante la noche, y cuando su navegador restaure la página desde su caché interna, podría 
hacer clic en uno de los dos enlaces de esta página y seguiría funcionando. (Esto se compara con una sesión SSH, que se 
termina si apagas tu computadora).

Alice podría dejar esta página web abierta en su teléfono durante seis meses, y cuando finalmente haga clic en un enlace, 
el servidor web respondería como si solo hubiera esperado unos segundos. El servidor web no se queda despierto por la noche 
preocupándose por Alice. Cuando ella no está haciendo una solicitud HTTP, el servidor no sabe que Alice existe.

Este principio a veces se llama sin estado. Creo que este es un término confuso porque el cliente y el servidor en este 
sistema ambos mantienen estado; simplemente mantienen diferentes tipos de estado. El término “sin estado” se refiere al 
hecho de que el servidor no le importa en qué estado se encuentra el cliente. (Hablaré más sobre los diferentes tipos de 
estado en las secciones siguientes).

Mensajes Auto-descriptivos
Es evidente al observar el HTML que este sitio es más que solo una página de inicio. El marcado para la página de inicio 
contiene dos enlaces: uno a la URL relativa /about (es decir, a http://www.youtypeitwepostit.com/about) y otro a /messages 
(es decir, a http://www.youtypeitwepostit.com/messages). Al principio, Alice solo conocía una URL: la URL de la página de 
inicio, pero ahora conoce tres. El servidor le está revelando lentamente su estructura.

Podemos trazar un mapa del sitio web hasta ahora (Figura 1-3), tal como le ha sido revelado a Alice por el servidor.
![Figura 1-3. Mapa del sitio web](C:/Users/wilso/Escritorio/Deber/Mapa del sitio web.png){width=width height=height}
¿Qué hay al otro lado de los enlaces /messages y /about? La única manera de estar seguro es seguirlos y averiguarlo. Pero 
Alice puede mirar el marcado HTML, o la representación gráfica de su navegador del marcado, y hacer una suposición educada. 
El enlace con el texto “Sobre este sitio” probablemente lleva a una página que habla sobre el sitio. Eso está bien, pero el 
enlace con el texto “Comenzar” es probablemente el que la acerca más a realmente publicar un mensaje.

Episodio 3: El Enlace
Después de leer la página de inicio, Alice decide probar este sitio. Hace clic en el enlace que dice “Comenzar”. Por supuesto, 
cada vez que haces clic en un enlace en tu navegador web, le estás diciendo a tu navegador que haga una solicitud HTTP.

El código del enlace en el que Alice hizo clic se ve así:
<a href="/messages">Get started</a>
Así que su navegador realiza esta solicitud HTTP al mismo servidor que antes:

GET /messages HTTP/1.1
Host: www.youtypeitwepostit.com
Ese GET en la solicitud es un método HTTP, también conocido como un verbo HTTP. El método HTTP es la forma en que el cliente 
le dice al servidor lo que quiere hacer con un recurso. “GET” es el método HTTP más común. Significa “dame una representación 
de este recurso”. Para un navegador web, GET es el valor por defecto. Cuando sigues un enlace o escribes una URL en la barra 
de direcciones, tu navegador envía una solicitud GET.

El servidor maneja esta solicitud GET particular enviando una representación de /messages:
HTTP/1.1 200 OK
Content-type: text/html
...
<!DOCTYPE html>
<html>
	 <head>
		 <title>Mensajes</title>
 </head>
 <body>
 	<div>
	 <h1>Mensajes</h1>
	 <p>
 	Ingresa tu mensaje a continuación:
 	</p>
 	<form action="http://youtypeitwepostit.com/messages" method="post">
 		<input type="text" name="message" value="" required="true"
 			maxlength="6"/>
 		<input type="submit" value="Publicar" />
 	</form>
 	<div>
 	<p>
 	Aquí hay otros mensajes también:
 	</p>
 	<ul>
 		<li><a href="/messages/32740753167308867">Más tarde</a></li>
 		<li><a href="/messages/7534227794967592">Hola</a></li>
 	</ul>
 	</div>
 	<p class="links">
 	<a href="http://youtypeitwepostit.com/">Inicio</a>
 	</p>
 	</div>
 </body>
</html>
![Figura 1-4. Página de inicio de You Type It…](C:/Users/wilso/Escritorio/Deber/You Type It.png){width=width height=height}

Aquí tienes la traducción al español del texto que proporcionaste:
Cuando Alice mira la representación gráfica, ve que esta página es una lista de mensajes que otras personas han publicado en 
el sitio. Justo en la parte superior hay un cuadro de texto invitador y un botón de Publicar.

Ahora hemos revelado un poco más sobre cómo funciona el servidor. La Figura 1-5 muestra un mapa actualizado del sitio, visto 
por el navegador de Alice.

![Figura 1-5. Vista del navegador de You Type It…](C:/Users/wilso/Escritorio/Deber/Vista del navegador.png){width=width height=height}
Métodos Estandarizados
Ambas solicitudes HTTP de Alice utilizaron GET como su método HTTP. Pero hay un poco de HTML en la última representación que 
activará una solicitud HTTP POST si Alice hace clic en el botón Publicar:
<form action="http://youtypeitwepostit.com/messages" method="post">
 <input type="text" name="message" value="" required="true" maxlength="6"/>
 <input type="submit" />
</form>
El estándar HTTP (RFC 2616) define ocho métodos que un cliente puede aplicar a un recurso. En este libro, me centraré en 
cinco de ellos: GET, HEAD, POST, PUT y DELETE. En el Capítulo 3, cubriré estos métodos en detalle, junto con un método de 
extensión, PATCH, diseñado específicamente para su uso en APIs web. En este momento, lo importante que hay que recordar es 
que hay un pequeño número de métodos estándar.

No es imposible crear un nuevo método HTTP (sucedió con PATCH), pero es un gran asunto. Esto no es como un lenguaje de 
programación, donde puedes nombrar tus métodos como quieras. Cuando construí el simple sitio web de microblogging para usar 
en este ejemplo, no definí nuevos métodos HTTP como GETHOMEPAGE y HELLOPLEASESHOWMETHEMESSAGELISTTHANKSBYE. Usé GET tanto para "mostrar la página de inicio" como para "mostrar la lista de mensajes", porque en ambos casos GET ("dame una representación de este recurso") era la mejor opción entre la interfaz de HTTP y lo que quería hacer. Distinguí entre la página de inicio y la lista de mensajes no definiendo nuevos métodos, sino tratando esos dos documentos como recursos separados, cada uno con su propia URL, accesibles a través de GET.

Episodio 4: El Formulario y la Redirección
De vuelta a nuestra historia. Alice se siente tentada por el formulario en el sitio de microblogging. Escribe "Prueba" y 
hace clic en el botón Publicar.
Nuevamente, el navegador de Alice hace una solicitud HTTP:
POST /messages HTTP/1.1
Host: www.youtypeitwepostit.com
Content-type: application/x-www-form-urlencoded
message=Test&submit=Post

Y el servidor responde con lo siguiente:

HTTP/1.1 303 See Other
Content-type: text/html
Location: http://www.youtypeitwepostit.com/messages/5266722824890167
Cuando el navegador de Alice realizó sus dos solicitudes GET, el servidor envió el código de estado HTTP 200 ("OK") y 
proporcionó un documento HTML para que el navegador de Alice lo renderizara. No hay un documento HTML aquí, pero el servidor 
proporcionó un enlace a otra URL, en el encabezado Location—y aquí, el código de estado al principio de la respuesta es 303 
("See Other"), no 200 ("OK").

El código de estado 303 le dice al navegador de Alice que haga automáticamente una cuarta solicitud HTTP a la URL dada en el 
encabezado Location. Sin pedir permiso a Alice, su navegador hace exactamente eso:
GET /messages/5266722824890167 HTTP/1.1
Esta vez, el navegador responde con 200 ("OK") y un documento HTML:

HTTP/1.1 200 OK
Content-type: text/html
<!DOCTYPE html>
<html>
 <head>
 <title>Mensaje</title>
 </head>
 <body>
 <div>
 <h2>Mensaje</h2>
 <dl>
 <dt>ID</dt><dd>2181852539069950</dd>
 <dt>FECHA</dt><dd>2014-03-28T21:51:08Z</dd>
 <dt>MSG</dt><dd>Prueba</dd>
 </dl>
 <p class="links">
 <a href="http://www.youtypeitwepostit.com/">Inicio</a>
 </p>
 </div>
 </body>
</html>
El navegador de Alice muestra este documento gráficamente (Figura 1-6) y, finalmente, vuelve a esperar la entrada de Alice.

![Figura 1-6. Mensaje publicado en You Type It…](C:/Users/wilso/Escritorio/Deber/Mensaje publicado.png){width=width height=height}
Estoy seguro de que te has encontrado con redireccionamientos HTTP antes, pero HTTP está lleno de pequeñas características 
como esta, y algunas pueden ser nuevas para ti. Hay muchas formas en que el servidor puede indicarle al cliente que maneje 
una respuesta de manera diferente, y formas en que el cliente puede adjuntar condiciones o características adicionales a su 
solicitud. Una gran parte del diseño de API es el uso adecuado de estas características.

El Capítulo 11 cubre las características de HTTP que son más importantes para las API web, y los Apéndices A y B proporcionan 
información suplementaria sobre este tema.

Al mirar la representación gráfica, Alice ve que su mensaje ("Prueba") ahora es una publicación completa en 
YouTypeItWePostIt.com. Nuestra historia termina aquí; Alice ha logrado su objetivo de probar el sitio de microblogging. 
Pero hay mucho que aprender de estas cuatro simples interacciones.

Estado de la Aplicación
La Figura 1-7 es un diagrama de estado que muestra toda la aventura de Alice desde la perspectiva de su navegador web.

![Figura 1-7. La aventura de Alicia: la perspectiva del cliente](C:/Users/wilso/Escritorio/Deber/la perspectiva del cliente.png){width=width height=height}
Cuando Alice encendió el navegador en su teléfono, no tenía ninguna página en particular cargada. Era una pizarra en blanco. 
Luego, Alice escribió una URL y una solicitud GET llevó al navegador a la página de inicio del sitio. Alice hizo clic en un 
enlace y una segunda solicitud GET llevó al navegador a la lista de mensajes. Ella envió un formulario, lo que causó una 
tercera solicitud (una solicitud POST). La respuesta a eso fue una redirección HTTP, que el navegador de Alice hizo 
automáticamente. El navegador de Alice terminó en una página web que describe el mensaje que Alice acababa de crear.

Cada estado en este diagrama corresponde a una página particular (o a ninguna página en absoluto) abierta en la ventana del 
navegador de Alice. En términos de REST, llamamos a esta parte de la información—¿en qué página estás?—el estado de la 
aplicación.

Cuando navegas por la web, cada transición de un estado de aplicación a otro corresponde a un enlace que decidiste seguir o 
a un formulario que decidiste completar. No todas las transiciones están disponibles desde todos los estados. Alice no puede 
hacer su solicitud POST directamente desde la página de inicio, porque la página de inicio no presenta el formulario que 
permite a su navegador construir la solicitud POST.

Estado del Recurso
La Figura 1-8 es un diagrama de estado que muestra la aventura de Alice desde la perspectiva del servidor web.
![Figura 1-8. La aventura de Alicia: la perspectiva del servidor](C:/Users/wilso/Escritorio/Deber/la perspectiva del servidor.png){width=width height=height}
El servidor gestiona dos recursos: la página de inicio (servida desde /) y la lista de mensajes (servida desde /messages). 
(El servidor también gestiona un recurso para cada mensaje individual. He omitido esos recursos del diagrama por simplicidad).
El estado de estos recursos se llama, de manera bastante sencilla, estado del recurso.

Cuando comienza la historia, hay dos mensajes en la lista de mensajes: “Hola” y “Más tarde”. Enviar un GET a la página de 
inicio no cambia el estado del recurso, ya que la página de inicio es un documento estático que nunca cambia. Enviar un GET 
a la lista de mensajes tampoco cambiará el estado.

Pero cuando Alice envía un POST a la lista de mensajes, pone al servidor en un nuevo estado. Ahora la lista de mensajes 
contiene tres mensajes: “Hola”, “Más tarde” y “Prueba”. No hay manera de regresar al estado anterior, pero este nuevo estado 
es muy similar. Como antes, enviar un GET a la página de inicio o a la lista de mensajes no cambiará nada. Pero enviar otro 
POST a la lista de mensajes añadirá un cuarto mensaje a la lista.

Debido a que las sesiones HTTP son tan cortas, el servidor no sabe nada sobre el estado de la aplicación de un cliente. El 
cliente no tiene control directo sobre el estado del recurso; todas esas cosas se mantienen en el servidor. Y aun así, la Web 
funciona. Funciona a través de REST—transferencia de estado representacional.

El estado de la aplicación se mantiene en el cliente, pero el servidor puede manipularlo enviando representaciones—documentos 
HTML, en este caso—que describen las posibles transiciones de estado. El estado del recurso se mantiene en el servidor, 
pero el cliente puede manipularlo enviando al servidor una representación—una presentación de formulario HTML, en este 
caso—que describe el nuevo estado deseado.

Conectividad
En la historia, Alice realizó cuatro solicitudes HTTP a YouTypeItWePostIt.com, y recibió tres documentos HTML a cambio. 
Aunque Alice no siguió cada enlace en esos documentos, podemos usar esos enlaces para construir un mapa aproximado del 
sitio web desde la perspectiva del cliente (Figura 1-9).

![Figura 1-9. Lo que vio el cliente](C:/Users/wilso/Escritorio/Deber/Lo que vio el cliente.png){width=width height=height}
Esta es una red de páginas HTML. Los hilos de la red son las etiquetas HTML <a> y <form>, cada una describiendo una 
solicitud HTTP GET o POST que Alice podría decidir hacer. Llamo a esto el principio de conectividad: cada página web te 
dice cómo llegar a las páginas adyacentes.

La Web en su conjunto funciona sobre el principio de conectividad, que es mejor conocido como "hipermedia como motor del 
estado de la aplicación", a veces abreviado como HATEOAS. Prefiero "conectividad" o "la restricción de hipermedia", porque 
"hipermedia como motor del estado de la aplicación" suena intimidante. Pero en este punto, no deberías encontrarlo intimidante. Sabes qué es el estado de la aplicación: es en qué página web está un cliente. Hipermedia es el término general para cosas como enlaces HTML y formularios: las técnicas que un servidor utiliza para explicar a un cliente lo que puede hacer a continuación.

Decir que la hipermedia es el motor del estado de la aplicación significa que todos navegamos por la Web completando 
formularios y siguiendo enlaces.

La Web es Algo Especial
La historia de Alice no parece tan emocionante, porque la World Wide Web ha sido la aplicación de Internet dominante durante 
los últimos 20 años. Pero en la década de 1990, esta era una historia muy emocionante. Si comparas la World Wide Web con sus 
competidores tempranos, verás la diferencia.

El protocolo Gopher (definido en el RFC 1436) se parece mucho a HTTP, pero carece de direccionabilidad. No hay una manera 
sucinta de identificar un documento específico en Gopherspace. Al menos no había una hasta que la World Wide Web se apiadó 
de Gopherspace y liberó el estándar de URL (primero definido en el RFC 1738), que proporciona un esquema de URL gopher:// 
que funciona igual que http://.

FTP, un popular protocolo pre-Web para transferencia de archivos (definido en el RFC 959), también carece de direccionabilidad.
 Hasta que el RFC 1738 llegó con su esquema de URL ftp://, simplemente no había una manera legible por máquina de señalar a 
 un archivo en un servidor FTP. Tenías que usar prosa en inglés para explicar dónde estaba el archivo. ¡Qué desperdicio!

FTP también presentaba sesiones de larga duración. Un usuario casual podía iniciar sesión en un servidor FTP y ocupar 
indefinidamente una de las conexiones TCP del servidor. Por el contrario, incluso una conexión HTTP "persistente" no debería 
ocupar una conexión TCP durante más de 30 segundos.

La década de 1990 vio muchos protocolos de Internet para buscar diferentes tipos de archivos y bases de datos—protocolos como 
Archie, Veronica, Jughead, WAIS y Prospero. Pero resulta que no necesitamos todos esos protocolos. Solo necesitamos poder 
enviar solicitudes GET a diferentes tipos de sitios web. Todos estos protocolos murieron o fueron reemplazados por sitios 
web. Sus complejas reglas específicas de protocolo se incorporaron a la uniformidad del GET de HTTP.

Una vez que la Web tomó el control, se volvió mucho más difícil justificar la creación de un nuevo protocolo de aplicación. 
¿Por qué crear una nueva herramienta que solo entenderán los técnicos, cuando puedes poner en marcha un sitio web que 
cualquiera puede usar? Para la mayoría de los propósitos, HTTP es lo suficientemente bueno.

La flexibilidad sin precedentes de la Web proviene de los principios de REST. En la década de 1990, descubrimos que la Web 
funciona mejor que su competencia. En 2000, la disertación de Roy T. Fielding explicó por qué es así, acuñando el término 
“REST” en el proceso.

Las API Web se Quedan Atrás de la Web
La disertación de Fielding también explica muchos de los problemas de las API web en la década de 2010. El simple sitio web 
que acabo de describir es mucho más sofisticado que la mayoría de las API web implementadas actualmente, incluso las que se 
autodenominan REST APIs. Si alguna vez has diseñado una API web, o has escrito un cliente para una, probablemente hayas encontrado algunos de estos problemas:

Las API web frecuentemente tienen documentación legible por humanos que explica cómo construir URL para todos los diferentes 
recursos. Esto es como escribir prosa en inglés explicando cómo encontrar un archivo en un servidor FTP. Si los sitios web hicieran esto, nadie se molestaría en usar la Web.

En lugar de decirte qué URL escribir, los sitios web incrustan URLs en etiquetas <a> y <form>—controles de hipermedia que 
puedes activar haciendo clic en un enlace o un botón.

En términos de REST, poner información sobre la construcción de URL en documentos separados legibles por humanos viola los 
principios de conectividad y mensajes autodescriptivos.

Muchos sitios web tienen documentos de ayuda, pero ¿cuándo fue la última vez que los usaste? A menos que haya un problema 
serio (compraste algo y nunca fue entregado), es más fácil hacer clic y averiguar cómo funciona el sitio explorando los 
documentos HTML conectados y autodescriptivos que te envía.

Las API de hoy presentan sus recursos en un gran menú de opciones en lugar de una red interconectada. Esto dificulta ver qué 
relación tiene un recurso con otro.

Integrarse con una nueva API inevitablemente requiere escribir software personalizado o instalar una biblioteca única escrita 
por alguien más. Pero no necesitas escribir software personalizado para usar un nuevo sitio web. Ves una URL en una cartelera 
y la introduces en tu navegador web, el mismo cliente que usas para cualquier otro sitio web del mundo.

Nunca llegaremos al punto en que un solo cliente API pueda entender todas las API en el mundo. Pero los clientes de hoy 
contienen mucho código que realmente debería ser refactorizado en bibliotecas genéricas. Esto solo será posible cuando las 
API sirvan representaciones autodescriptivas.

Cuando las API cambian, los clientes API personalizados se rompen y deben ser arreglados. Pero cuando un sitio web pasa 
por un rediseño, los usuarios del sitio se quejan del rediseño y luego se adaptan. Sus navegadores no dejan de funcionar.

En términos de REST, el rediseño del sitio web está completamente encapsulado en los documentos HTML autodescriptivos 
servidos por el sitio web. Un cliente que podría entender los antiguos documentos HTML puede entender los nuevos.

Estos son los problemas que estoy tratando de resolver con este libro. La buena noticia es que solía ser mucho peor. Hace 
unos años, era común ver API RESTful que usaban métodos HTTP seguros de maneras inseguras, o mezclaban el estado de la aplicación y el estado del recurso. Esto no ocurre mucho más. Los diseños han mejorado y aún pueden mejorar más.

El Desafío Semántico
Ahora la mala noticia. La historia que te he contado, la historia del viaje de Alice a través de un sitio web, transcurrió 
tan suavemente gracias a un hardware muy lento y costoso: Alice misma. Cada vez que su navegador renderizaba una página web, 
Alice, un ser humano, tenía que mirar la página renderizada y decidir qué hacer a continuación. La Web funciona porque los 
seres humanos toman todas las decisiones sobre qué enlaces hacer clic y qué formularios completar.

El objetivo de las API web es hacer las cosas sin hacer que un humano se siente frente a un navegador web todo el día. ¿Cómo 
podemos programar una computadora para tomar decisiones sobre qué enlaces hacer clic? Una computadora puede analizar la 
etiqueta HTML <a href="/messages">Get started</a>, pero no puede entender la frase “Get started”. ¿Por qué molestarse en 
diseñar APIs que sirvan mensajes autodescriptivos si esos mensajes no serán entendidos por sus consumidores de software?

Este es el mayor desafío en el diseño de API web: cerrar la brecha semántica entre entender la estructura de un documento 
y entender lo que significa. Como abreviatura, lo llamaré el desafío semántico. Se ha avanzado muy poco en el desafío 
semántico, y nunca lo resolveremos completamente. La buena noticia es que, dado que se ha avanzado tan poco hasta ahora, 
el primer paso es realmente fácil. Solo tenemos que comenzar a trabajar juntos, en lugar de duplicar el trabajo de los demás.

Voy a estar revisando el desafío semántico en los próximos capítulos, mientras hablo sobre las tecnologías de la Web y 
cómo puedes usarlas en diseños de API. Para el Capítulo 8, tendremos las herramientas necesarias para abordar el desafío 
semántico de frente.