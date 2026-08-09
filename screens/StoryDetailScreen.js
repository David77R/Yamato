import { StyleSheet, Text, View, TouchableOpacity, ScrollView } from 'react-native';
import { historiasPorCategoria } from '../data/historias';

export default function StoryDetailScreen({ route, navigation }) {
  const { historiaId, categoria } = route.params;
  const historia = historiasPorCategoria[categoria].find((h) => h.id === historiaId);

  return (
    <View style={styles.contenedor}>

      <ScrollView showsVerticalScrollIndicator={false}>

        <TouchableOpacity onPress={() => navigation.goBack()}>
          <Text style={styles.volver}>← Volver</Text>
        </TouchableOpacity>

        <Text style={styles.titulo}>{historia.titulo}</Text>
        <Text style={styles.subtitulo}>{historia.subtitulo}</Text>

        <View style={styles.notaCultural}>
          <Text style={styles.notaCulturalTexto}>{historia.notaCultural}</Text>
        </View>

        <View style={styles.linea} />

        <Text style={styles.cuerpo}>{historia.cuerpo}</Text>

        <View style={styles.espacioFinal} />

      </ScrollView>

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
    marginBottom: 24,
  },
  titulo: {
    color: '#cc1111',
    fontSize: 32,
    fontWeight: 'bold',
  },
  subtitulo: {
    color: '#888888',
    fontSize: 14,
    marginTop: 4,
    fontStyle: 'italic',
  },
  notaCultural: {
    backgroundColor: '#1a1008',
    borderLeftWidth: 2,
    borderLeftColor: '#b8581f',
borderRadius: 4,
    padding: 14,
    marginTop: 20,
  },
  notaCulturalTexto: {
    color: '#c97a3f',
    fontSize: 13,
    fontStyle: 'italic',
    lineHeight: 20,
  },
  linea: {
    width: 40,
    height: 1,
    backgroundColor: '#333333',
    marginVertical: 24,
    alignSelf: 'center',
  },
  cuerpo: {
    color: '#cccccc',
    fontSize: 15,
    lineHeight: 26,
  },
  espacioFinal: {
    height: 60,
  },
});