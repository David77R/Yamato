import { StyleSheet, Text, View, TouchableOpacity, FlatList } from 'react-native';
import { historiasPorCategoria } from '../data/historias';

const nombresCategorias = {
  yokai: 'Yokai',
  yurei: 'Yurei',
  monogatari: 'Monogatari',
  samurai: 'El camino del samurai',
  geisha: 'El baile de una geisha',
  origen: 'El origen de Japón',
};

export default function CategoryListScreen({ route, navigation }) {
  const { categoria } = route.params;
  const historias = historiasPorCategoria[categoria];

  return (
    <View style={styles.contenedor}>

      <TouchableOpacity onPress={() => navigation.goBack()}>
        <Text style={styles.volver}>← Volver</Text>
      </TouchableOpacity>

      <Text style={styles.titulo}>{nombresCategorias[categoria]}</Text>

      {historias.length === 0 ? (
        <View style={styles.vacio}>
          <Text style={styles.vacioTexto}>próximamente...</Text>
        </View>
      ) : (
        <FlatList
          data={historias}
          keyExtractor={(item) => item.id}
          showsVerticalScrollIndicator={false}
          renderItem={({ item }) => (
            <TouchableOpacity
              style={styles.tarjeta}
              onPress={() => navigation.navigate('StoryDetail', { historiaId: item.id, categoria })}
            >
              <Text style={styles.tituloHistoria}>{item.titulo}</Text>
              <Text style={styles.resumen}>{item.resumen}</Text>
            </TouchableOpacity>
          )}
        />
      )}

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
    marginBottom: 20,
  },
  tarjeta: {
    backgroundColor: '#111111',
    borderWidth: 0.5,
    borderColor: '#222222',
    borderRadius: 14,
    padding: 16,
    marginBottom: 10,
  },
  tituloHistoria: {
    color: '#cc1111',
    fontSize: 16,
    fontWeight: 'bold',
  },
  resumen: {
    color: '#777777',
    fontSize: 12,
    marginTop: 4,
  },
  vacio: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
  },
  vacioTexto: {
    color: '#333333',
    fontSize: 14,
    fontStyle: 'italic',
    letterSpacing: 2,
  },
});