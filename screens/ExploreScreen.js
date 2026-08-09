import { StyleSheet, Text, View, TouchableOpacity, FlatList } from 'react-native';

const categorias = [
  { id: 'yokai', emoji: '👹', nombre: 'Yokai', descripcion: 'Criaturas y espíritus del folklore' },
  { id: 'yurei', emoji: '👻', nombre: 'Yurei', descripcion: 'Fantasmas y almas en pena' },
  { id: 'monogatari', emoji: '📖', nombre: 'Monogatari', descripcion: 'Cuentos y tradición oral japonesa' },
  { id: 'samurai', emoji: '⚔️', nombre: 'El camino del samurai', descripcion: 'Historias épicas de guerreros' },
  { id: 'geisha', emoji: '🌸', nombre: 'El baile de una geisha', descripcion: 'Historias del mundo flotante' },
  { id: 'origen', emoji: '⛩️', nombre: 'El origen de Japón', descripcion: 'Idioma, cultura y creencias' },
];

export default function ExploreScreen({ navigation }) {
  return (
    <View style={styles.contenedor}>

      <TouchableOpacity onPress={() => navigation.goBack()}>
        <Text style={styles.volver}>← Volver</Text>
      </TouchableOpacity>

      <Text style={styles.titulo}>Explorar</Text>
      <Text style={styles.subtitulo}>Elige tu camino al misterio</Text>

      <FlatList
        data={categorias}
        keyExtractor={(item) => item.id}
        showsVerticalScrollIndicator={false}
        renderItem={({ item }) => (
          <TouchableOpacity
            style={styles.tarjeta}
            onPress={() => navigation.navigate('CategoryList', { categoria: item.id })}
          >
            <Text style={styles.emoji}>{item.emoji}</Text>
            <View style={styles.textos}>
              <Text style={styles.nombre}>{item.nombre}</Text>
              <Text style={styles.descripcion}>{item.descripcion}</Text>
            </View>
          </TouchableOpacity>
        )}
      />

    </View>
  );
}

const styles = StyleSheet.create({
  contenedor: {
    flex: 1,
    backgroundColor: '#080808',
    paddingTop: 60,
    paddingHorizontal: 24,
  },
  volver: {
    color: '#555555',
    fontSize: 13,
    marginBottom: 16,
  },
  titulo: {
    color: '#ffffff',
    fontSize: 28,
    fontWeight: 'bold',
    letterSpacing: 1,
  },
  subtitulo: {
    color: '#666666',
    fontSize: 13,
    marginTop: 4,
    marginBottom: 24,
  },
  tarjeta: {
    flexDirection: 'row',
    alignItems: 'center',
    backgroundColor: '#111111',
    borderWidth: 0.5,
    borderColor: '#222222',
    borderRadius: 14,
    padding: 16,
    marginBottom: 10,
  },
  emoji: {
    fontSize: 28,
    marginRight: 14,
  },
  textos: {
    flex: 1,
  },
  nombre: {
    color: '#ffffff',
    fontSize: 15,
    fontWeight: 'bold',
  },
  descripcion: {
    color: '#777777',
    fontSize: 11,
    marginTop: 2,
  },
});