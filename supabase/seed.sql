insert into categorias (slug, nombre, descripcion, emoji, orden) values
  ('yokai', 'Yokai', 'Criaturas y espíritus del folklore', '👹', 1),
  ('yurei', 'Yurei', 'Fantasmas y almas en pena', '👻', 2),
  ('monogatari', 'Monogatari', 'Cuentos y tradición oral japonesa', '📖', 3),
  ('samurai', 'El camino del samurai', 'Historias épicas de guerreros', '⚔️', 4),
  ('geisha', 'El baile de una geisha', 'Historias del mundo flotante', '🌸', 5),
  ('origen', 'El origen de Japón', 'Idioma, cultura y creencias', '⛩️', 6);

insert into historias (categoria_id, titulo, subtitulo, resumen, nota_cultural, cuerpo, es_premium, orden)
select id, v.titulo, v.subtitulo, v.resumen, v.nota_cultural, v.cuerpo, v.es_premium, v.orden
from categorias, (values
  ('Kappa', 'El que aguarda bajo el espejo del agua', 'El espíritu de las aguas que arrastra a los incautos', 'Se le atribuye el origen de ahogamientos inexplicados en zonas rurales de Japón, y su leyenda varía entre prefecturas — en algunas es protector de las cosechas; en otras, un devorador de niños imprudentes.', 'En los ríos lentos y los estanques cubiertos de juncos, donde la corriente apenas susurra, habita el Kappa. No es niño ni es bestia, sino algo intermedio: piel del color de las algas viejas, un caparazón curvado como el de la tortuga, y sobre la cabeza, una pequeña cuenca que el agua nunca abandona.

Mientras esa agua permanezca ahí, nada en este mundo puede igualar su fuerza. Es en ese pequeño charco, y no en sus brazos ni en sus dientes, donde reside todo su poder.

Los aldeanos antiguos sabían algo que hoy se olvida con facilidad: que el Kappa, antes de ser un peligro, es una criatura de costumbres. Ofrece una reverencia, y él, por naturaleza, te la devuelve — derramando sin saberlo el agua que lo sostiene, y con ella, toda su fuerza.

No conviene, sin embargo, confiar demasiado en sus modales. El río guarda su propia paciencia, y el Kappa, la suya.', false, 1),
  ('Tengu', 'El guardián alado que castiga la arrogancia', 'El guardián de las montañas que castiga a los soberbios', 'Los monjes budistas de las montañas le atribuían el secuestro de sacerdotes corruptos, y su imagen — pico largo, alas de halcón — terminó inspirando máscaras rituales que aún se usan en festivales japoneses.', 'En las cumbres boscosas donde la niebla nunca se levanta del todo, habita el Tengu. Tiene forma de hombre, pero las alas lo delatan, y el rostro — ya sea pico de ave o nariz desmedida — recuerda que no pertenece enteramente al mundo de los hombres.

Es criatura de las alturas y del orgullo. Castiga con dureza a los monjes que predican sin practicar, a los guerreros que alardean sin haber sangrado, a los sabios que confunden el conocimiento con la soberbia. Se dice que puede secuestrar a quien lo merece y devolverlo días después, irreconocible de tan asustado, pero vivo.

No es enemigo de los hombres honestos. Algunos viajeros perdidos en la montaña cuentan haber sido guiados de vuelta al camino por una sombra alada que no pidió nada a cambio.

El Tengu no odia al hombre. Odia su arrogancia, que tantas veces son la misma cosa.', false, 2),
  ('Kitsune', 'El zorro de nueve colas, maestro del engaño', 'El zorro de nueve colas que camina entre mundos', 'La creencia popular sostiene que un kitsune gana una cola adicional cada cien años de vida, hasta llegar a nueve — el punto en que su poder se vuelve casi divino, y muchos santuarios sintoístas todavía lo veneran como mensajero de Inari, dios del arroz.', 'Hay zorros que son solo zorros, y hay zorros que son algo más. El Kitsune nace como cualquier otro, pero el tiempo lo transforma: con cada siglo que sobrevive, gana una cola, una astucia mayor, un poder más cercano a lo divino.

Puede tomar forma humana a voluntad — con frecuencia la de una mujer de belleza inquietante — y caminar entre los hombres sin que nadie lo note, salvo quizás por una sombra que conserva, por un instante de descuido, la forma de un zorro.

Algunos kitsune son protectores: guardianes de hogares, mensajeros del dios Inari, guías de cosechas abundantes. Otros son tramposos natos, que se alimentan de la confusión humana, que enamoran para luego desaparecer sin dejar rastro, dejando solo la pregunta de si alguna vez existieron.

Nunca se sabe, frente a un Kitsune, si se está ante una bendición o ante una broma que durará toda la vida.', false, 3)
) as v(titulo, subtitulo, resumen, nota_cultural, cuerpo, es_premium, orden)
where categorias.slug = 'yokai';

insert into historias (categoria_id, titulo, subtitulo, resumen, nota_cultural, cuerpo, es_premium, orden)
select id, v.titulo, v.subtitulo, v.resumen, v.nota_cultural, v.cuerpo, v.es_premium, v.orden
from categorias, (values
  ('Okiku', 'La que cuenta los platos en el fondo del pozo', 'El fantasma que cuenta platos eternamente en su pozo', 'La leyenda de Okiku dio origen al término "Banchō Sarayashiki", una de las historias de fantasmas más representadas en el teatro kabuki, y su pozo — el Okiku Mushi — todavía se señala en algunas versiones turísticas de Himeji.', 'Sirvió en una mansión samurai, y se dice que era hermosa, y que esa hermosura fue su condena. Un señor la deseó; ella lo rechazó. Para vengarse, él escondió uno de los diez platos de porcelana que ella tenía a su cargo, y la acusó de haberlo perdido.

El castigo fue la muerte, y su cuerpo fue arrojado a un pozo.

Desde entonces, cada noche, su voz emerge del agua estancada, contando: uno, dos, tres… hasta nueve. Y entonces el silencio se rompe en un grito, porque el plato que falta nunca llega a contarse, y Okiku, eternamente, vuelve a empezar.

Quien escucha el conteo completo hasta el nueve, dicen, no debe quedarse a esperar el grito.', false, 1),
  ('Oiwa', 'La venganza más temida del kabuki', 'El espíritu desfigurado que condujo a su asesino a la locura', 'La historia de Oiwa, parte del "Yotsuya Kaidan", es tan temida en Japón que los actores y equipos de producción todavía visitan su tumba antes de representar la obra, para pedir permiso y evitar la mala fortuna.', 'Fue esposa devota de un ronin sin honor, Iemon, que la envenenó lentamente para casarse con otra mujer más conveniente. El veneno no la mató de inmediato: primero desfiguró su rostro, arrancó su cabello a mechones, y solo entonces la dejó morir, ya convertida en algo que ella misma no reconocía en el espejo.

Su venganza no necesitó manos. Su rostro destruido comenzó a aparecer en lugares imposibles — en un farol, en el reflejo de un charco, en el rostro de la nueva esposa la noche de bodas — hasta que el propio Iemon, enloquecido, terminó matando a quienes amaba creyendo ver, en cada uno de ellos, el rostro de Oiwa.

No hizo falta que ella tocara a nadie. Bastó que el rostro de su dolor fuera imposible de olvidar.', false, 2)
) as v(titulo, subtitulo, resumen, nota_cultural, cuerpo, es_premium, orden)
where categorias.slug = 'yurei';

insert into historias (categoria_id, titulo, subtitulo, resumen, nota_cultural, cuerpo, es_premium, orden)
select id, v.titulo, v.subtitulo, v.resumen, v.nota_cultural, v.cuerpo, v.es_premium, v.orden
from categorias, (values
  ('Urashima Tarō', 'El pescador que regresó trescientos años tarde', 'El pescador que visitó el palacio del mar y perdió el tiempo', 'Esta historia, registrada ya en crónicas del siglo VIII, es considerada uno de los monogatari más antiguos de Japón, y su lección sobre el tiempo perdido sigue citándose en la literatura japonesa moderna.', 'Era un pescador joven, de corazón gentil, que un día salvó a una tortuga de las burlas de unos niños en la playa. La tortuga, agradecida, lo llevó nadando hasta el fondo del mar, hasta el palacio de Ryūjin, el Dios Dragón, donde vivía la princesa Otohime.

Urashima Tarō permaneció allí lo que él creyó tres días, festejado, enamorado, ajeno al tiempo. Cuando finalmente pidió volver a ver a su madre, la princesa, con tristeza, le entregó una caja — un tamatebako — y le advirtió: nunca la abras.

Al regresar a la orilla, nada coincidía. Su casa no estaba. Nadie reconocía su nombre. Un anciano del pueblo, al escuchar su historia, palideció: habían pasado trescientos años desde que un pescador con ese nombre desapareciera en el mar.

Desesperado, Urashima Tarō abrió la caja prohibida. De ella escapó una nube de humo blanco, y con ella, los trescientos años que el mar le había prestado. En un instante, se convirtió en el anciano que debía haber sido siempre.

Algunas deudas con el tiempo, por más hermosas que parezcan al contraerse, siempre terminan cobrándose.', false, 1),
  ('Momotarō', 'El niño que nació de un durazno', 'El héroe que nació de una fruta y venció a los demonios', 'Esta es probablemente la historia infantil más popular de todo Japón — su protagonista aparece en libros de texto escolares, mascotas municipales y hasta en la insignia militar japonesa del siglo XX como símbolo de valentía.', 'Una anciana sin hijos lavaba ropa en el río cuando vio flotar un durazno de tamaño descomunal. Lo llevó a casa para compartirlo con su esposo, pero al cortarlo, no encontraron fruta: encontraron a un niño, sonriente, que afirmó haber sido enviado por el Cielo para ser su hijo.

Lo llamaron Momotarō — "niño durazno" — y lo criaron con amor, hasta que creció fuerte y decidido a enfrentar a los oni que aterrorizaban su isla, robando y destruyendo sin piedad.

En su camino reunió aliados improbables: un perro leal, un mono astuto, un faisán de vista aguda. Ninguno por separado tenía fuerza suficiente para vencer a los demonios. Juntos, conquistaron la isla de los oni, recuperaron los tesoros robados, y regresaron como héroes.

La fuerza de Momotarō no nació del durazno. Nació de saber rodearse de quienes lo complementaban.', false, 2)
) as v(titulo, subtitulo, resumen, nota_cultural, cuerpo, es_premium, orden)
where categorias.slug = 'monogatari';

