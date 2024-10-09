 Capítulo 1: Navegando por la Web

La World Wide Web se hizo popular porque la gente común puede usarla para hacer cosas realmente útiles con un entrenamiento mínimo. Pero, detrás de escena, la Web también es una plataforma poderosa para la computación distribuida.

Los principios que hacen que la Web sea utilizable por personas comunes también funcionan cuando el "usuario" es un agente de software automatizado. Un software diseñado para transferir dinero entre cuentas bancarias (o realizar cualquier otra tarea del mundo real) puede llevar a cabo la tarea utilizando las mismas tecnologías básicas que usaría un ser humano.

En lo que respecta a este libro, la Web se basa en tres tecnologías: la convención de nombres URL, el protocolo HTTP y el formato de documentos HTML. Las URL y HTTP son simples, pero para aplicarlas a la programación distribuida, debes entenderlas con más detalle que el desarrollador web promedio. Los primeros capítulos de este libro están dedicados a darte esta comprensión.

La historia de HTML es un poco más complicada. En el mundo de las APIs web, existen docenas de formatos de datos que compiten para reemplazar a HTML. Una exploración de estos formatos tomará varios capítulos de este libro, comenzando en el Capítulo 5. Por ahora, quiero enfocarme en URL y HTTP, y usar HTML solo como un ejemplo.

Voy a comenzar contando una historia simple sobre la World Wide Web, como una forma de explicar los principios detrás de su diseño y las razones de su éxito. La historia necesita ser simple porque, aunque probablemente estés familiarizado con la Web, es posible que no hayas oído hablar de los conceptos que la hacen funcionar. Quiero que tengas un ejemplo simple y concreto al cual recurrir si alguna vez te confundes con términos como "hipermedia como el motor del estado de la aplicación".

¡Comencemos!

Episodio 1: La Valla Publicitaria

Un día, Alice está caminando por la ciudad y ve una valla publicitaria (Figura 1-1).

![Figura 1-1. El cartel publicitario](C:/Users/wilso/OneDrive/Escritorio/Deber/cartel.png){width=width height=height}


(Por cierto, este cartel ficticio anuncia un sitio web real que diseñé para este libro. Puedes probarlo tú mismo).

Alice es lo suficientemente mayor como para recordar los años 90, así que recuerda la reacción del público cuando las URLs empezaron a aparecer en carteles publicitarios. Al principio, la gente se burlaba de esas cadenas de texto tan raras. No estaba claro qué significaban “http://” o “youtypeitwepostit.com”. Pero 20 años después, todo el mundo sabe qué hacer con una URL: escribirla en la barra de direcciones del navegador y presionar Enter.

Y eso es lo que hace Alice: saca su teléfono móvil y escribe http://www.youtypeitwepostit.com/ en la barra de direcciones de su navegador. El primer episodio de nuestra historia termina con suspenso: ¿qué habrá al otro lado de esa URL?

Recursos y Representaciones

Lamento interrumpir la historia, pero necesito introducir algunos términos básicos. El navegador web de Alice está a punto de enviar una solicitud HTTP a un servidor web, específicamente a la URL http://www.youtypeitwepostit.com/. Un servidor web puede alojar muchas URLs diferentes, y cada URL da acceso a un fragmento distinto de los datos en el servidor.

Decimos que una URL es la URL de alguna cosa: un producto, un usuario, la página principal. El término técnico para la cosa que nombra una URL es recurso.

La URL http://www.youtypeitwepostit.com/ identifica un recurso, probablemente la página principal del sitio web anunciado en el cartel. Pero no lo sabrás con certeza hasta que retomemos la historia y el navegador de Alice envíe la solicitud HTTP.

