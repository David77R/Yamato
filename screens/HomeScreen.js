import { StyleSheet, Text, View, TouchableOpacity } from 'react-native';

export default function HomeScreen({ navigation }) {
  return (
    <View style={styles.contenedor}>

      <View style={styles.arriba}>
        <Text style={styles.nombreApp}>⛩ Y A M A T O ⛩</Text>
        <Text style={styles.kanji}>大</Text>
        <Text style={styles.kanji}>和</Text>
        <View style={styles.linea} />
        <Text style={styles.frase1}>Japón no es solo anime.</Text>
        <Text style={styles.frase2}>
          Atrévete a ahondar en su{'\n'}misterio y folklore.
        </Text>
      </View>

      <View style={styles.abajo}>
        <View style={styles.categorias}>
          <View style={styles.categoria}>
            <Text style={styles.emoji}>👹</Text>
            <Text style={styles.categoriaTexto}>Yokai</Text>
          </View>
          <View style={styles.categoria}>
            <Text style={styles.emoji}>👻</Text>
            <Text style={styles.categoriaTexto}>Yurei</Text>
          </View>
          <View style={styles.categoria}>
            <Text style={styles.emoji}>📖</Text>
            <Text style={styles.categoriaTexto}>Kaidan</Text>
          </View>
          <View style={styles.categoria}>
            <Text style={styles.emoji}>🎵</Text>
            <Text style={styles.categoriaTexto}>Folklore</Text>
          </View>
          <View style={styles.categoria}>
            <Text style={styles.emoji}>🗺️</Text>
            <Text style={styles.categoriaTexto}>Leyendas</Text>
          </View>
          <View style={styles.categoria}>
            <Text style={styles.emoji}>⛩️</Text>
            <Text style={styles.categoriaTexto}>Rituales</Text>
          </View>
        </View>

        <TouchableOpacity 
          style={styles.boton}
          onPress={() => navigation.navigate('Explore')}
        >
          <Text style={styles.botonTexto}>EXPLORAR</Text>
        </TouchableOpacity>

        <View style={styles.loginFila}>
          <Text style={styles.loginTexto}>Ya tengo cuenta — </Text>
          <Text style={styles.loginLink}>Entrar</Text>
        </View>
      </View>

    </View>
  );
}

const styles = StyleSheet.create({
  contenedor: {
    flex: 1,
    backgroundColor: '#080808',
    paddingTop: 60,
    paddingBottom: 48,
    paddingHorizontal: 24,
    justifyContent: 'space-between',
    alignItems: 'center',
  },
  arriba: {
    alignItems: 'center',
  },
  nombreApp: {
    fontSize: 11,
    color: '#444444',
    letterSpacing: 6,
    marginBottom: 32,
  },
  kanji: {
    fontSize: 72,
    color: '#cc1111',
    fontWeight: 'bold',
    lineHeight: 76,
  },
  linea: {
    width: 40,
    height: 1,
    backgroundColor: '#333333',
    marginVertical: 24,
  },
  frase1: {
    fontSize: 13,
    color: '#888888',
    letterSpacing: 1,
    fontStyle: 'italic',
    marginBottom: 4,
  },
  frase2: {
    fontSize: 13,
    color: '#666666',
    letterSpacing: 1,
    fontStyle: 'italic',
    textAlign: 'center',
    lineHeight: 22,
  },
  abajo: {
    width: '100%',
  },
  categorias: {
    flexDirection: 'row',
    flexWrap: 'wrap',
    justifyContent: 'space-between',
    marginBottom: 32,
  },
  categoria: {
    width: '30%',
    backgroundColor: '#111111',
    borderWidth: 0.5,
    borderColor: '#222222',
    borderRadius: 10,
    padding: 10,
    alignItems: 'center',
    marginBottom: 8,
  },
  emoji: {
    fontSize: 18,
    marginBottom: 4,
  },
  categoriaTexto: {
    fontSize: 10,
    color: '#666666',
    letterSpacing: 1,
  },
  boton: {
    backgroundColor: '#cc1111',
    borderRadius: 12,
    padding: 14,
    alignItems: 'center',
    marginBottom: 16,
  },
  botonTexto: {
    color: '#ffffff',
    fontSize: 14,
    letterSpacing: 3,
    fontWeight: 'bold',
  },
  loginFila: {
    flexDirection: 'row',
    justifyContent: 'center',
  },
  loginTexto: {
    fontSize: 11,
    color: '#333333',
    letterSpacing: 1,
  },
  loginLink: {
    fontSize: 11,
    color: '#555555',
    letterSpacing: 1,
    textDecorationLine: 'underline',
  },
});