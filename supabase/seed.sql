delete from historias;
delete from categorias;

insert into categorias (slug, nombre, descripcion, emoji, orden) values
  ('yokai', 'Yokai', 'Criaturas y espíritus del folklore', '👹', 1),
  ('yurei', 'Yurei', 'Fantasmas y almas en pena', '👻', 2),
  ('monogatari', 'Monogatari', 'Cuentos y tradición oral japonesa', '📖', 3),
  ('samurai', 'El camino del samurai', 'Historias épicas de guerreros', '⚔️', 4),
  ('geisha', 'Geisha: un baile como vida', 'Historias del mundo flotante', '🌸', 5),
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

Nunca se sabe, frente a un Kitsune, si se está ante una bendición o ante una broma que durará toda la vida.', false, 3),
  ('Tanuki', 'El estafador simpático', 'El embaucador que te estafa y después te invita un trago', 'Es un animal real, el perro mapache, y no un tejón como suele traducirse. Las estatuas de cerámica que montan guardia en la puerta de miles de restaurantes japoneses se fabrican en Shigaraki y se popularizaron después de 1951, cuando el Emperador visitó el pueblo, encontró el camino flanqueado de tanuki de barro y le dedicó un poema.', 'Si el kitsune es el embaucador elegante, el tanuki es el que te estafa y después te invita a un trago.

Comparte con el zorro el don de la transformación, pero no la clase. El kitsune se convierte en una mujer de belleza inquietante; el tanuki se convierte en una tetera y se olvida de esconder la cola. Sus engaños rara vez buscan dañar a nadie: son bromas pesadas, cuentas que no cuadran, hojas secas que al día siguiente aparecen en el monedero del comerciante donde él juraría haber guardado monedas.

La estatua que vende sake en la puerta de las tabernas no es un adorno cualquiera. Cada pieza está codificada: el sombrero de paja protege de los imprevistos, los ojos grandes ven venir los problemas, la botella representa la virtud, la panza la calma para decidir, la libreta de cuentas el crédito que un comerciante necesita para existir.

Y hay un último atributo, de proporciones imposibles de pasar por alto, que casi todo visitante extranjero malinterpreta. El origen es gremial y no obsceno: los batidores de oro envolvían el metal en piel de tanuki para martillarlo en láminas finísimas, y de ahí quedó la asociación entre el animal y la expansión de la riqueza. El chiste japonés con la palabra "bolas de oro" hizo el resto.

De modo que ese tanuki que te recibe en la puerta de un restaurante es, en rigor, un amuleto de prosperidad. Con una broma de gremio incorporada que lleva un siglo largo contándose sola.', true, 4),
  ('Yuki-onna', 'La mujer de nieve y el hombre que no supo callarse', 'La mujer de nieve que perdona a cambio de un silencio', 'La versión que conoce el mundo entero la escribió Lafcadio Hearn en su libro Kwaidan, de 1904. Hearn era un escritor greco-irlandés que se nacionalizó japonés, adoptó el nombre de Koizumi Yakumo y se dedicó a recoger relatos orales antes de que se perdieran; dijo haber oído esta historia de boca de un campesino. Gran parte de lo que Occidente sabe del folclore japonés pasó por sus manos.', 'Dos leñadores quedaron atrapados por una ventisca y se refugiaron en la cabaña de un barquero: un hombre viejo y su aprendiz, Minokichi, que era joven.

En mitad de la noche, el muchacho despertó con la cara helada. La puerta estaba abierta, la nieve entraba en remolinos, y una mujer vestida de blanco se inclinaba sobre el cuerpo dormido del viejo, exhalándole encima una niebla brillante. Cuando terminó se volvió hacia él.

Lo miró un rato largo. Después le dijo que lo dejaría vivir porque era joven, con una condición: que no contara jamás lo que había visto, ni siquiera a su propia madre. Si lo hacía, ella lo sabría.

Pasó un año. Minokichi se encontró en el camino con una muchacha llamada O-Yuki, se casaron, tuvieron diez hijos. Los vecinos comentaban que ella no envejecía, pero lo decían como un elogio.

Una noche de invierno, mientras ella cosía a la luz de la lámpara, él la miró y se le escapó un recuerdo. Le contó que cuando era joven había visto una vez a una mujer que se le parecía, y que aquella noche había pasado algo que nunca le había contado a nadie.

O-Yuki no levantó la vista de la costura. Le dijo que esa mujer era ella.

No lo mató. Le dijo que lo hacía solo por los niños, le advirtió que los cuidara bien, y se deshizo en una niebla blanca que se escapó por el hueco del humo en el techo.

Japón tiene docenas de historias con esta misma forma: un hombre recibe algo extraordinario a cambio de un silencio, y lo pierde todo el día que habla. El castigo nunca es por un acto malvado. Es por no haber sabido dejar una cosa en paz.', true, 5)
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

No hizo falta que ella tocara a nadie. Bastó que el rostro de su dolor fuera imposible de olvidar.', false, 2),
  ('Sugawara no Michizane', 'El hombre al que el Estado tuvo que volver dios', 'El ministro desterrado al que el Estado convirtió en dios', 'Hay unos catorce mil santuarios Tenmangū repartidos por Japón, y todos están dedicados a él. Cada temporada de exámenes, cientos de miles de estudiantes compran tablillas de madera y escriben su deseo de aprobar. Le rezan, sin saberlo casi nunca, a un funcionario al que la corte destruyó por envidia.', 'En el año 930, un rayo cayó sobre el salón principal del Palacio Imperial de Kioto y mató a varios cortesanos en el acto.

Nadie en la corte lo interpretó como meteorología.

Treinta años antes había en Kioto un hombre llamado Michizane, el mejor poeta y el mejor erudito de su generación, que había llegado a Ministro de la Derecha sin pertenecer al clan que repartía los cargos. Era demasiado brillante para que lo ignoraran y demasiado ajeno para que lo toleraran. En 901 lo acusaron de conspirar contra el Emperador, lo degradaron y lo desterraron a Dazaifu, en el extremo sur del país, donde murió dos años después sin haber vuelto a ver la capital.

Lo que siguió lo registraron las crónicas sin ambages. El noble que había orquestado su caída murió joven. Murió también el príncipe heredero. Vinieron sequías, pestes, tormentas. Y después, el rayo sobre el palacio. El Emperador, enfermo desde aquel día, no duró tres meses.

La corte llegó a una conclusión y actuó en consecuencia. Le devolvieron a Michizane todos sus títulos, quemaron el decreto de destierro, lo ascendieron a un rango que no había tenido en vida, y finalmente levantaron un santuario para alojar su espíritu y mantenerlo tranquilo.

No fue un gesto piadoso. Fue una negociación con un muerto.

Con los siglos, la furia se fue borrando y quedó lo otro: el erudito, el poeta, el hombre de letras. Michizane se convirtió en Tenjin, protector del estudio. Y hoy, un adolescente de Osaka que escribe en una tablita el nombre de la universidad a la que quiere entrar está continuando, sin enterarse, un ritual que empezó porque un gobierno tuvo miedo de un fantasma.', false, 3),
  ('El ame de la madre muerta', 'La clienta que pagaba con monedas frías', 'La clienta que compraba dulces con monedas heladas', 'La dulcería que aparece en esta historia existe. Se llama Minatoya, está en Kioto cerca del templo Rokudō Chinnō-ji, lleva más de cuatro siglos abierta y sigue vendiendo el mismo caramelo de malta, que allí se conoce como kosodate ame, el ame de criar hijos.', 'El dulcero notó primero las monedas.

Llegaba cada noche, ya cerrando, una mujer pálida que compraba un ame y se iba sin decir casi nada. Las monedas con las que pagaba estaban siempre heladas, y una noche, al contarlas después de que se marchara, el hombre encontró entre ellas una hoja seca.

A la séptima noche la mujer no traía dinero. Pidió el caramelo de todos modos y prometió volver. El dulcero se lo dio, y después la siguió.

La siguió por las calles vacías hasta el cementerio del templo, y allí la perdió de vista entre las tumbas. Se quedó quieto en la oscuridad, sin saber qué hacía ahí, hasta que oyó el llanto.

Venía de debajo de la tierra.

Excavaron al amanecer. En el ataúd estaba el cuerpo de una mujer que había muerto embarazada y había dado a luz después de enterrada, y junto a ella, vivo, un recién nacido al que alguien había estado alimentando con caramelo.

El niño sobrevivió. En la versión que cuentan en el templo se hizo monje y vivió hasta viejo.

Lo que esta historia dice de los fantasmas japoneses está en su final, y es casi lo contrario de lo que uno espera del género. El espíritu no volvió a cobrarse nada. Volvió a comprar dulces.', true, 4),
  ('Kuchisake-onna', 'La leyenda que hizo que los colegios mandaran escolta', 'La aparición que hizo que los colegios mandaran escolta', 'En la primavera de 1979 el rumor se extendió por Japón a una velocidad que obligó a reaccionar a las instituciones: varias escuelas organizaron el regreso a casa en grupo, algunas prefecturas reforzaron las patrullas y los periódicos locales recogieron el caso. No hubo nunca una sola víctima comprobada.', 'Aparece de noche, con mascarilla quirúrgica, que en Japón no llama la atención de nadie.

Se acerca y pregunta: ¿soy bonita? Si respondes que sí, se baja la mascarilla y vuelve a preguntar lo mismo, y entonces la pregunta ya no es una pregunta. Si respondes que no, no sales mejor parado. La trampa está construida para que no haya salida correcta, que es exactamente lo que define a una buena leyenda urbana.

El folclore, que es práctico, fue produciendo escapatorias. Contestar algo tibio, un "regular", porque la ambigüedad la desconcierta. Decir que llevas prisa y tienes una cita. Lanzarle caramelos duros, que se detiene a recoger.

Lo verdaderamente notable de Kuchisake-onna no es la historia, sino lo que pasó en 1979. El rumor corrió de patio de colegio en patio de colegio hasta que los adultos tuvieron que tomar medidas que no creían necesarias pero no podían no tomar. Un país entero con televisión, teléfono y periódicos funcionó durante unas semanas con la misma mecánica con que se propagaban los cuentos de aldea trescientos años antes.

Y esa es la razón de que esté en este apartado y no en una nota al pie. Demuestra que la tradición del fantasma vengativo no quedó en el período Edo. Solo cambió de escenario: ya no espera junto a un pozo, espera en la salida del colegio.', true, 5)
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

La fuerza de Momotarō no nació del durazno. Nació de saber rodearse de quienes lo complementaban.', false, 2),
  ('Kaguya-hime', 'La niña que encontraron dentro de un bambú', 'La niña de la Luna que encontraron dentro de un bambú', 'El Taketori monogatari es el relato narrativo más antiguo que se conserva en japonés, de finales del siglo noveno. Es anterior al Genji monogatari y Murasaki Shikibu lo cita en su novela como "el antepasado de todas las historias". El estudio Ghibli lo llevó al cine en 2013.', 'Un cortador de bambú encontró una caña que brillaba desde dentro. La abrió y halló una criatura del tamaño de un pulgar.

La crió con su esposa. La niña creció en tres meses hasta ser una mujer de una hermosura que no se parecía a nada, y la caña siguió dando oro cada vez que el viejo salía al bambudal, de modo que la familia pasó de la pobreza a la riqueza sin entender bien por qué.

La noticia de su belleza corrió. Cinco nobles de la capital se instalaron frente a la casa y no se movieron de allí. Para sacárselos de encima, ella puso a cada uno una condición: el cuenco de piedra del Buda, una rama de joyas de una isla que no existe, el manto de piel del ratón de fuego, la joya del cuello de un dragón, la concha que las golondrinas guardan al nacer.

Ninguno lo consiguió. Tres hicieron trampa y fueron descubiertos, uno se arruinó, otro casi se mata. Hasta el propio Emperador cortejó a Kaguya-hime, y a él sí llegó a quererlo, pero tampoco pudo aceptarlo.

Porque la muchacha no era de aquí. Era de la Luna, estaba cumpliendo un destierro, y su gente vendría a buscarla.

El Emperador mandó dos mil guardias a rodear la casa la noche del plazo. No sirvió de nada: cuando descendió el cortejo lunar, los arqueros no pudieron tensar los arcos. A ella le dieron de beber un elixir que borra la tristeza humana, le pusieron un manto de plumas, y se la llevaron.

Dejó dos regalos para el Emperador: una carta y un frasco con el elixir de la inmortalidad. Él no quiso vivir para siempre en un mundo donde ella no estaba, y ordenó quemar ambas cosas en la cumbre de la montaña más alta del país, la más cercana al cielo.

Dice el relato que de ahí viene el nombre del monte Fuji, y que el humo que durante siglos se vio salir de su cráter era esa carta, que no terminaba de arder.', false, 3),
  ('Tsuru no ongaeshi', 'La grulla que pagó su deuda', 'La grulla que tejía con sus propias plumas', 'Es probablemente el cuento más representado del folclore japonés y existe en decenas de variantes regionales. Pertenece a una familia de relatos que los estudiosos llaman "la cámara prohibida", y que en Japón es tan abundante que resulta difícil encontrar un cuento largo donde nadie mire lo que no debía.', 'Un hombre pobre liberó a una grulla atrapada en una trampa.

Esa misma noche llamó a su puerta una mujer perdida en el camino, y se quedó, y terminaron casándose. Vivían con lo justo. Un día ella le dijo que sabía tejer y que podía vender la tela, pero le pidió una cosa: que mientras trabajara, nadie entrara en el cuarto ni la mirara.

Salió al cabo de tres días con una pieza de una finura que nadie había visto. La vendieron por una cantidad que les cambió la vida.

El marido pidió otra. Ella aceptó, con la misma condición, y volvió a encerrarse. Y en la segunda o la tercera vez, el hombre, que ya pensaba en el dinero, se asomó.

Adentro no había ninguna mujer. Había una grulla arrancándose las plumas del pecho para hilarlas en el telar, flaca, casi desnuda.

Ella se volvió hacia la puerta. Le dijo que había venido a devolverle la vida que él le había salvado, que ahora ya no podía quedarse, y salió volando.

La moraleja fácil es no romper una promesa. La verdadera es más incómoda, y está en el momento exacto en que él se asoma: no lo hace por amor ni por curiosidad inocente, sino porque quiere saber cómo se fabrica aquello que le está dando de comer. Mira para administrar mejor su suerte.

Y en estos relatos, la suerte que se mira de cerca siempre se va volando.', true, 4),
  ('Issun-bōshi', 'El héroe de tres centímetros', 'El héroe de tres centímetros que venció a un oni', 'Aparece en el Otogi-zōshi, una colección de cuentos ilustrados de los siglos catorce al dieciséis, y es el equivalente japonés de Pulgarcito. Su arma, una aguja de coser, y su barca, un cuenco de arroz, son los dos objetos que todo niño japonés asocia con él.', 'Un matrimonio sin hijos pidió uno a los dioses y no fue suficientemente específico.

Les llegó un varón sano, risueño y de poco más de tres centímetros, que no creció nunca. Cuando tuvo edad de buscarse la vida pidió permiso para ir a la capital, y se lo dieron con el ajuar que correspondía a su tamaño: una aguja de coser por espada, una pajita por vaina, un cuenco de sopa por barca y un palillo por remo.

Bajó el río en el cuenco y llegó a Kioto, donde entró a servir en casa de un noble. Se ganó el cariño de la hija de la casa, a la que acompañaba a todas partes porque cabía en su manga.

Y un día, yendo los dos de camino a un templo, les salió al paso un oni.

Issun-bōshi se plantó delante de la muchacha con su aguja. El demonio se rió, lo levantó con dos dedos y se lo tragó entero, que era exactamente lo que podía esperarse de un combate así.

Lo que no esperaba el oni era lo que vino después. Desde dentro, el muchacho empezó a clavarle la aguja sin pausa y sin piedad hasta que el monstruo, retorciéndose, lo escupió y salió huyendo. En la carrera dejó caer un mazo mágico que concedía deseos.

La muchacha lo recogió, pidió que su compañero creciera, y creció.

Lo que mantiene vivo este cuento ochocientos años después no es el final feliz, que es el de siempre. Es la imagen del tipo más pequeño de la historia atacando desde dentro del estómago de su enemigo, porque era el único sitio desde donde podía ganar.', true, 5)
) as v(titulo, subtitulo, resumen, nota_cultural, cuerpo, es_premium, orden)
where categorias.slug = 'monogatari';

insert into historias (categoria_id, titulo, subtitulo, resumen, nota_cultural, cuerpo, es_premium, orden)
select id, v.titulo, v.subtitulo, v.resumen, v.nota_cultural, v.cuerpo, v.es_premium, v.orden
from categorias, (values
  ('Los cuarenta y siete rōnin', 'La paciencia como forma de lealtad', 'Dos años fingiendo ser hombres rotos para vengar a su señor', 'El templo Sengakuji de Tokio todavía guarda sus cuarenta y siete tumbas, y cada 14 de diciembre se celebra allí el Gishi-sai en su honor. La historia se convirtió en el Chūshingura, una de las obras más representadas del teatro kabuki, y el cine japonés la ha filmado más de cien veces.', 'En 1701, un señor provincial llamado Asano desenvainó su espada dentro del castillo de Edo contra un funcionario que lo había humillado. El agravio era real; el gesto, imperdonable. Desenvainar en el castillo del shōgun se pagaba de una sola manera, y Asano murió por su propia mano ese mismo día. Sus tierras fueron confiscadas y sus hombres quedaron sin señor: rōnin, hombres a la deriva.

El funcionario sobrevivió. Y eso, para los antiguos retenedores de Asano, era una cuenta sin saldar.

Lo que hicieron después es lo que convirtió el episodio en leyenda. No atacaron. Se dispersaron. Durante casi dos años se dedicaron a oficios humildes, bebieron en público, abandonaron sus modales, dejaron que el mundo los viera convertidos en hombres rotos. Su líder, Ōishi, llevó la farsa tan lejos que su propia esposa lo repudió. Los espías del funcionario informaron que no quedaba nada que temer.

La noche del catorce del mes duodécimo, bajo la nieve, cuarenta y siete hombres asaltaron la mansión. Encontraron al funcionario escondido en un cobertizo de carbón, le ofrecieron morir con dignidad por su propia mano, y cuando él no fue capaz, le dieron muerte con la misma daga que Asano había usado contra sí mismo. Luego caminaron hasta la tumba de su señor con la cabeza envuelta y se entregaron.

El tribunal reconoció el honor de lo que habían hecho y los condenó igualmente. Murieron todos, por su propia mano, y fueron enterrados junto a Asano.

La lealtad, en esta historia, no se mide por lo que estuvieron dispuestos a hacer. Se mide por lo que estuvieron dispuestos a aparentar.', false, 1),
  ('Tomoe Gozen', 'La que cabalgó delante de los hombres', 'La guerrera que cabalgaba delante de los hombres', 'El Heike monogatari la describe como una guerrera "que valía por mil". Los historiadores discuten si existió o si fue una figura literaria, pero su nombre quedó como sinónimo de las onna-musha, las mujeres guerreras de la clase samurai, cuya presencia en combate sí aparece documentada en el período.', 'Cabalgaba al frente, no detrás. Eso es lo primero que dicen de ella las crónicas, antes incluso de describir su rostro: que iba adelante, en la primera línea, donde van los que no esperan volver.

Servía a Kiso Yoshinaka durante la guerra que enfrentó a los clanes Minamoto y Taira, y las crónicas le atribuyen una destreza que incomodaba a los cronistas: arquera excepcional, espadachina temible, capaz de domar caballos que otros no montaban y de descender riscos que otros rodeaban. Cuando se narraban sus hazañas había que elegir entre la incredulidad y la admiración, y el Heike monogatari eligió la admiración.

En Awazu, con el ejército deshecho y la derrota ya decidida, Yoshinaka le ordenó marcharse. No quería, dijo, que se contara que había muerto acompañado de una mujer.

Ella no discutió. Tomó un último enemigo, le arrancó la cabeza, la dejó caer, y se fue.

Lo que ocurrió después nadie lo sabe con certeza: unas versiones la hacen monja, otras esposa de un guerrero rival, otras simplemente la pierden. Pero la imagen que sobrevivió mil años no es la de su final. Es la de una mujer que recibe la orden de salvarse y se toma un momento, antes de obedecer, para dejar claro por qué le costaba hacerlo.', false, 2),
  ('Miyamoto Musashi', 'El espadachín que murió escribiendo', 'El espadachín invicto que terminó escribiendo en una cueva', 'Escribió el Go Rin no Sho, el Libro de los cinco anillos, en una cueva cerca de Kumamoto durante sus últimos años; el texto todavía se estudia en escuelas de negocios occidentales. Fue también pintor, y su tinta de un alcaudón posado en una rama seca cuelga hoy en museos japoneses.', 'El arma con la que ganó su duelo más famoso era un remo.

Tenía veintiocho años y lo esperaba en una isla un espadachín llamado Sasaki Kojirō, dueño de una hoja tan larga que se la conocía por su nombre. Musashi llegó tarde, con horas de retraso, después de haber dormido en el bote y de haberse entretenido tallando un sable de madera con el remo de la barca. Cuando por fin pisó la arena, su rival llevaba el día entero esperando bajo el sol, con la furia bien madurada. Esa espera formaba parte del plan.

El combate duró poco. Lo que se recuerda no es el golpe, sino la desproporción: el hombre con la espada legendaria perdió contra un hombre con un trozo de barca.

Ganó unos sesenta duelos y no perdió ninguno. Pero lo interesante de Musashi empieza cuando deja de pelear. Pasó sus últimos años retirado en una cueva, redactando un tratado breve y seco sobre la estrategia, la postura y la calma, escrito en un japonés sin adornos, como quien explica a un aprendiz algo que le costó la vida entender. Lo terminó pocas semanas antes de morir.

También pintaba. Y quien haya visto su alcaudón sobre la rama seca sabrá que ese hombre no estaba hecho solamente de violencia: hay más silencio en esa tinta que en todos sus duelos juntos.', false, 3),
  ('Kusunoki Masashige', 'El que obedeció una orden que sabía equivocada', 'El general que obedeció una orden que sabía perdida', 'Su estatua de bronce custodia la entrada del Palacio Imperial de Tokio. En los años treinta y cuarenta, el ejército japonés convirtió su historia en material de adoctrinamiento y su nombre acompañó a los pilotos que no debían regresar, un uso que dice más de aquella época que del propio Kusunoki.', 'La orden era avanzar hacia Minatogawa y presentar batalla. Kusunoki, que llevaba años ganando guerras imposibles con trucos de montaña, trampas de troncos y castillos que parecían ceder para luego cerrarse como cepos, sabía perfectamente que ese plan los llevaba a la aniquilación. Había propuesto otra cosa. La corte, mal aconsejada, prefirió la versión heroica.

Fue.

Llevó a sus hombres a un combate que tenía perdido antes de empezar, resistió lo que se podía resistir, y cuando no quedó nada que sostener murió allí con su hermano. La tradición les atribuye unas palabras antes del final: que les gustaría nacer siete veces más para volver a servir.

Japón lo recordó como el modelo de la lealtad absoluta. Pero conviene leer su historia completa, porque la lealtad de Kusunoki no fue la obediencia ciega de alguien que no pensaba. Fue la de alguien que pensó, que dijo lo que pensaba, que no fue escuchado, y que marchó de todos modos.

Esa distinción se perdió seiscientos años después, cuando su figura le resultó útil a un gobierno que prefería la primera versión.', true, 4),
  ('El seppuku', 'La única manera honrosa de perderlo todo', 'Por qué no era un suicidio sino un modo de detener la deshonra', 'Los primeros casos documentados aparecen en las guerras del siglo XII, y el más citado es el de Minamoto no Yorimasa, en 1180, dentro de un templo cercado. Dejó de ser una pena legal en 1873, durante la modernización Meiji.', 'Occidente suele leerlo como un suicidio, y ahí empieza el malentendido.

En la lógica del guerrero japonés, el honor no era un sentimiento privado sino un bien heredable: pertenecía al nombre, a la casa, a los hijos que vendrían después. Un samurai derrotado o deshonrado no se quitaba la vida por desesperación. Lo hacía para que la deshonra se detuviera en él y no siguiera avanzando hacia los suyos.

De ahí que fuera un rito y no un arrebato. Había ropas, lugar, testigos, un poema de despedida escrito con buena caligrafía. Había también una figura encargada de abreviar el sufrimiento en el momento exacto, cuya intervención se consideraba un acto de respeto y no de piedad: un buen segundo era un amigo, y se le elegía con cuidado.

Durante el período Edo llegó a ser dos cosas opuestas a la vez. Era la sentencia que recibía un noble condenado, y era el privilegio que lo distinguía del criminal común, a quien simplemente se ejecutaba.

Entender eso cambia la lectura de casi todas las historias de este apartado. Los cuarenta y siete rōnin no fueron castigados con la muerte. Fueron castigados con una muerte que les reconocía la razón.', true, 5)
) as v(titulo, subtitulo, resumen, nota_cultural, cuerpo, es_premium, orden)
where categorias.slug = 'samurai';

insert into historias (categoria_id, titulo, subtitulo, resumen, nota_cultural, cuerpo, es_premium, orden)
select id, v.titulo, v.subtitulo, v.resumen, v.nota_cultural, v.cuerpo, v.es_premium, v.orden
from categorias, (values
  ('Las primeras geisha fueron hombres', 'El origen que casi nadie cuenta', 'Durante un siglo, pedir una geisha era pedir un hombre', 'La palabra 芸者 significa literalmente "persona de las artes", sin marca de género. Los primeros en ejercer el oficio fueron varones llamados taikomochi, animadores, bufones y músicos que entretenían a los clientes en los barrios de placer del siglo XVII. Las mujeres entraron al oficio hacia 1750 y en treinta años ya los superaban en número.', 'Durante casi un siglo, si alguien pedía una geisha en Edo, llegaba un hombre.

Eran los taikomochi: contaban chistes, tocaban el tambor, llenaban los silencios incómodos de un banquete, sabían cuándo adular y cuándo desaparecer. Su trabajo consistía en que la velada no decayera. Cuando las mujeres empezaron a ejercer el mismo oficio se las llamó onna geisha, "geisha mujer", porque la palabra sin apellido seguía significando hombre.

Eso se invirtió en una generación. Para 1780 las mujeres eran mayoría abrumadora, y los taikomochi quedaron reducidos a un puñado que todavía hoy sobrevive, casi como una curiosidad.

Lo que define el oficio, sin embargo, no viene de esa época sino de una norma administrativa. En 1779 el gobierno reconoció a las geisha como profesión regulada, les creó una oficina de registro y les puso una condición explícita: no podían competir con las cortesanas. Tenían prohibido vestir como ellas, llevar sus adornos, y quitarles clientes. Su negocio era el arte y debía seguir siéndolo.

La diferencia quedó escrita en algo tan simple como un nudo. La cortesana llevaba el obi atado al frente, porque tenía que poder desatárselo sola. La geisha lo llevaba atado a la espalda.

Doscientos cincuenta años después, media humanidad sigue confundiéndolas.', false, 1),
  ('La oiran', 'La profesión con la que se las confunde', 'La cortesana con la que el mundo confunde a la geisha', 'Las oiran eran las cortesanas de más alto rango de Yoshiwara, el barrio autorizado de Edo. Su oficio desapareció a principios del siglo XX y hoy solo se reconstruye en desfiles conmemorativos; las pocas que se ven en fotografías modernas son actrices, no herederas del oficio.', 'Caminaba en ocho.

La oiran dōchū era el desfile con el que una cortesana de alto rango se trasladaba a un encuentro, y no tenía nada de improvisado: avanzaba sobre sandalias de madera de treinta centímetros de alto, apoyada en el hombro de un asistente, trazando con cada paso una figura lenta hacia afuera. Detrás iba su séquito, aprendizas, sirvientes, un farol. Podía tardar una hora en recorrer una calle. Esa era la idea.

Una oiran no era una mujer disponible, y ese es el punto que casi siempre se pierde. Era una figura de lujo extremo, educada en poesía, caligrafía, ceremonia del té y conversación, capaz de rechazar a un cliente que no estuviera a su altura. Un hombre podía arruinarse en el intento de acceder a ella y no conseguirlo nunca. Los encuentros se negociaban durante meses.

Buena parte de lo que el extranjero imagina al oír "geisha" pertenece en realidad a esta otra profesión: el peinado monumental erizado de horquillas, el obi al frente, la escenografía. Son dos oficios distintos, de barrios distintos, con reglas que el propio gobierno de Edo se encargó de separar por escrito.

La confusión tiene una explicación sencilla y un poco triste. La oiran desapareció, la geisha sobrevivió, y el recuerdo de la primera terminó alojándose en el nombre de la segunda.', false, 2),
  ('Mineko Iwasaki', 'La que demandó al hombre que contó su vida', 'La geiko que demandó al novelista que contó su vida', 'Fue la geiko más solicitada de Kioto y se retiró en 1980, a los veintinueve años. Colaboró con el novelista Arthur Golden bajo condición de anonimato; cuando él la nombró en los agradecimientos de "Memorias de una geisha", ella lo demandó. El caso se resolvió fuera de los tribunales en 2003 y ella publicó su propia versión.', 'Le habían prometido que su nombre no aparecería.

Mineko Iwasaki aceptó hablar con un novelista estadounidense porque pensó que por fin alguien contaría el oficio desde adentro, y le dedicó horas de entrevistas explicándole el funcionamiento de Gion: las casas, los contratos, los años de entrenamiento, la economía real de una profesión que ella conocía mejor que nadie porque había sido la mejor pagada de todas.

El libro salió en 1997, vendió millones de ejemplares en el mundo entero, y traía su nombre impreso en los agradecimientos.

Lo que vino después fue previsible para cualquiera que entienda cómo funciona un gremio cerrado. En Kioto, hablar de los asuntos internos de las casas es una falta grave, y ella quedó señalada como la mujer que lo había hecho. Recibió amenazas. Denunció además que la novela había inventado prácticas que ella jamás describió, y que esas invenciones eran justamente las que el público recordaría.

Demandó por incumplimiento del acuerdo. El caso se cerró con un arreglo privado.

Y entonces hizo lo único que podía corregir el daño: escribió su propio libro. No vendió lo que vendió la novela, porque la verdad rara vez lo hace, pero existe. Quien quiera saber cómo es realmente la vida de una geiko puede leerla contada por una, y no por alguien que la escuchó durante unas semanas.', false, 3),
  ('La maiko', 'Cinco años para aprender a servir el té', 'Cinco años de aprendizaje y una calva como prueba', 'Una maiko es la aprendiza; la geiko, la profesional. En Kioto el aprendizaje dura alrededor de cinco años y empieza entre los quince y los dieciséis, al terminar la educación obligatoria. La casa que la acoge, el okiya, cubre durante ese tiempo el alojamiento, las clases y los kimonos, que cuestan lo que un automóvil.', 'Después de unos años se le forma una calva en la coronilla.

El peinado de una maiko se hace con su propio cabello, no con peluca, y se arma una vez por semana con cera, hilo y una paciencia considerable. Para no deshacerlo, duerme con el cuello apoyado en un soporte de madera y la cabeza en el aire. La tensión constante va despoblando un círculo en lo alto de la cabeza. Dentro del oficio esa calva no se oculta ni se lamenta: es la prueba visible de que se hicieron los años.

Todo en ella está pensado para que se la pueda leer de lejos. El obi le cuelga hasta los tobillos y mide cinco metros; una geiko ya nunca lo lleva así. Los zuecos la elevan y la obligan a caminar corto. Y durante su primer año se pinta de rojo únicamente el labio inferior, porque todavía no ha terminado de convertirse en lo que será.

Las jornadas se reparten entre clases y banquetes. Danza, shamisen, tambor, flauta, ceremonia del té, caligrafía, y por encima de todo la conversación, que es el oficio real: sostener una mesa entera durante horas, saber quién está incómodo, cuándo callar.

El aprendizaje termina con un gesto mínimo. El cuello rojo bordado que llevó cinco años se sustituye por uno blanco. Se llama erikae, el cambio de cuello, y a partir de esa noche ya no es aprendiza.', true, 4),
  ('Las cinco calles de flores', 'Lo que queda de un mundo entero', 'Lo que queda de los barrios de geishas de Kioto', 'Hanamachi significa "pueblo de flores" y designa los barrios donde viven y trabajan las geiko. En Kioto sobreviven cinco: Gion Kobu, Gion Higashi, Pontochō, Miyagawachō y Kamishichiken. En los años veinte había decenas de miles de geisha en todo Japón; hoy quedan unos pocos cientos.', 'El oficio no fue prohibido ni perseguido. Simplemente dejó de tener sitio.

Lo que acabó con los hanamachi fue la suma de cosas corrientes: la guerra, que cerró las casas; la posguerra, que tenía otras urgencias; la televisión, que llenó los silencios que antes llenaba una conversación pagada; y sobre todo una economía en la que ninguna familia necesita ya colocar a una hija de quince años en una casa de Kioto. De decenas de miles se pasó a unos cientos, y la curva nunca volvió a subir.

Las cinco calles que resisten lo hacen porque encontraron la manera de ser visibles sin dejar de ser cerradas. Cada una celebra su propia temporada de danza y abre el teatro al público: el Miyako Odori de Gion Kobu en abril es el más conocido, y cualquiera puede comprar entrada y ver bailar a las mismas mujeres que esa noche atenderán un banquete al que no podría entrar.

Porque eso no ha cambiado. Las casas de té siguen funcionando por presentación: hace falta que un cliente antiguo responda por el nuevo. No es esnobismo sino aritmética: en un gremio de doscientas personas, la reputación es el único activo que no se puede reponer.

A veces se dice que el oficio está muriendo. Lleva un siglo diciéndose. Lo que ocurre es más preciso: dejó de ser una industria y se volvió un arte minoritario, como la ópera o el teatro nō. Y los artes minoritarios no mueren. Se encogen hasta el tamaño exacto de quienes los sostienen.', true, 5)
) as v(titulo, subtitulo, resumen, nota_cultural, cuerpo, es_premium, orden)
where categorias.slug = 'geisha';

insert into historias (categoria_id, titulo, subtitulo, resumen, nota_cultural, cuerpo, es_premium, orden)
select id, v.titulo, v.subtitulo, v.resumen, v.nota_cultural, v.cuerpo, v.es_premium, v.orden
from categorias, (values
  ('Izanagi e Izanami', 'Cómo nacieron las islas y por qué morimos', 'Cómo nacieron las islas y por qué existe la muerte', 'El relato aparece en el Kojiki, la crónica más antigua de Japón, compilada en el año 712. No era un libro religioso sino político: fijaba por escrito de dónde venía la línea imperial. Buena parte de la mitología japonesa sobrevivió porque a alguien le convenía que quedara registrada.', 'Al principio no había donde pararse.

Dos deidades, un hermano y una hermana, se asomaron desde el puente flotante del cielo y hundieron en el agua una lanza adornada con joyas. Al levantarla, la sal que escurrió de la punta se fue cuajando hasta formar un islote. Bajaron a él, levantaron un pilar y acordaron rodearlo cada uno por un lado para encontrarse del otro.

Ella habló primero, y ese detalle, en la lógica del relato, lo arruinó todo: el hijo que nació de esa unión vino sin huesos y hubo que abandonarlo al mar. Repitieron el rito en el orden debido, y entonces sí. De ellos nacieron las islas una por una, y después los dioses del viento, de los árboles, de las montañas.

Hasta que nació el fuego, y el fuego la mató.

Izanagi bajó al país de las tinieblas a buscarla, como han hecho los enamorados en todas las mitologías del mundo. Ella le habló desde la oscuridad: puedo intentar volver, pero no me mires. Él esperó lo que pudo esperar. Después encendió un diente de su peine y la vio.

Lo que vio no se puede describir sin arruinarlo. Salió huyendo, perseguido por ella y por las criaturas de aquel lugar, y en la frontera entre los dos mundos empujó una roca enorme para cerrar el paso.

Se hablaron por última vez a través de la piedra. Ella juró que mataría a mil personas cada día. Él respondió que entonces haría nacer mil quinientas.

Los japoneses llevan trece siglos contando que la muerte existe porque un hombre no supo esperar, y que la vida le gana por quinientos.', false, 1),
  ('Amaterasu en la cueva', 'El día que el sol se ofendió', 'El día que el sol se ofendió y el mundo se apagó', 'El espejo con el que la sacaron de la cueva es uno de los tres tesoros imperiales de Japón y se custodia en el santuario de Ise. Nadie lo ha fotografiado jamás, ni siquiera el Emperador lo ve; su existencia se da por hecha y su aspecto se desconoce. La entronización de cada nuevo Emperador todavía hace referencia a él.', 'Se metió en una cueva y el mundo se apagó.

Amaterasu, la diosa del sol, llevaba tiempo aguantando a su hermano Susanoo, que destrozaba los arrozales, tapaba las acequias y ensuciaba los salones de palacio. Cuando el hermano arrojó un caballo desollado dentro del taller donde ella tejía con sus damas, y una de ellas murió del susto, Amaterasu hizo lo que no había hecho nunca: se retiró. Entró en una caverna de roca, corrió la puerta y se quedó adentro.

Sin sol no hubo cosechas, no hubo horas, no hubo manera de distinguir una jornada de otra. Los demás dioses se reunieron en el cauce seco de un río celeste a resolver el problema, y descartaron pronto la vía de la fuerza: nadie iba a sacarla a rastras. Había que convencerla.

El plan que armaron era una pequeña obra de teatro. Colgaron de un árbol un espejo y unas joyas, pusieron gallos a cantar como si amaneciera, y una diosa llamada Uzume se subió a una tina dada vuelta y bailó de un modo tan desvergonzado que los ochocientos dioses estallaron en carcajadas.

El ruido se coló por la rendija. Y ahí estuvo el acierto: lo que sacó a Amaterasu de la cueva no fue la súplica, fue la curiosidad ofendida. Si el mundo se había quedado a oscuras, ¿de qué se reían?

Corrió apenas la puerta para mirar. Frente a ella, colgado del árbol, había un rostro luminoso que no reconoció, y mientras se asomaba un poco más para verlo mejor, un dios de brazos descomunales la tomó de la mano y la sacó afuera. A su espalda tendieron una soga para que no pudiera volver a entrar.

El rostro del espejo era el suyo. La historia es, entre otras cosas, la de alguien que vuelve al mundo porque se encuentra consigo misma.', false, 2),
  ('Por qué el japonés se escribe de tres maneras', 'El alfabeto que despreciaban los hombres', 'La primera novela del mundo se escribió en la letra de las mujeres', 'La primera novela de la historia de la literatura universal, el Genji monogatari, la escribió una mujer hacia el año mil, en el único sistema de escritura que a las mujeres les estaba permitido usar.', 'El japonés no tenía escritura propia. La tomó prestada del chino alrededor del siglo quinto, y heredó con ella un problema de fondo: son lenguas que no se parecen en nada. El chino prescinde de terminaciones; el japonés vive de ellas. Escribir japonés con caracteres chinos era como intentar escribir español usando únicamente los símbolos de las matemáticas.

La primera solución fue de una tosquedad admirable. Se eligieron caracteres chinos por su sonido y se ignoró su significado, de modo que un poema podía escribirse con signos que, leídos como chino, no querían decir absolutamente nada. Funcionaba, pero exigía memorizar cientos de caracteres para expresar una sílaba.

De ahí salieron los otros dos sistemas, y cada uno nació en un sitio distinto.

Los monjes budistas, que leían textos chinos y necesitaban anotar al margen cómo se pronunciaban, empezaron a recortar los caracteres y a quedarse solo con un trozo reconocible de cada uno. Esos fragmentos son el katakana.

En la corte ocurrió otra cosa. El chino escrito era asunto de hombres, de funcionarios y de asuntos serios. Las mujeres de la aristocracia no debían aprenderlo, y lo que hicieron fue tomar aquellos caracteres fonéticos y escribirlos en cursiva rápida, redondeándolos hasta volverlos irreconocibles. Al resultado lo llamaron onna-de, "mano de mujer". Hoy se llama hiragana.

Mientras los hombres escribían documentos en una lengua extranjera, las mujeres escribían en la suya. Y así ocurrió que la obra fundacional de la literatura japonesa, y según buena parte de los especialistas la primera novela psicológica del mundo, saliera de la mano de Murasaki Shikibu, dama de la corte, en el sistema que sus contemporáneos consideraban menor.

Los tres sobrevivieron y hoy conviven en una misma frase. Los kanji cargan el significado, el hiragana sostiene la gramática, el katakana recoge lo extranjero. Un idioma que decidió no elegir.', false, 3)
) as v(titulo, subtitulo, resumen, nota_cultural, cuerpo, es_premium, orden)
where categorias.slug = 'origen';

