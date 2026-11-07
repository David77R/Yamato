import {
  StyleSheet,
  Text,
  TouchableOpacity,
  View,
} from 'react-native';
import FondoVivo from '../components/FondoVivo';
import { colores } from '../theme/colores';

export default function HomeScreen({ navigation }) {
  return (
    <View style={styles.raiz}>
      <FondoVivo>
        <View style={styles.contenido} pointerEvents="box-none">

          <View style={styles.arriba} pointerEvents="box-none">
            <Text style={styles.nombreApp}>⛩ Y A M A T O ⛩</Text>
            <Text style={styles.kanji}>大</Text>
            <Text style={styles.kanji}>和</Text>
            <View style={styles.linea} />
            <Text style={styles.frase1}>Japón no es solo anime.</Text>
            <Text style={styles.frase2}>
              Atrévete a ahondar en su{'\n'}misterio y folklore.
            </Text>
          </View>

          <View style={styles.abajo} pointerEvents="box-none">
            <View style={styles.categorias} pointerEvents="box-none">
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
                <Text style={styles.categoriaTexto}>Monogatari</Text>
              </View>
              <View style={styles.categoria}>
                <Text style={styles.emoji}>⚔️</Text>
                <Text style={styles.categoriaTexto}>Samurai</Text>
              </View>
              <View style={styles.categoria}>
                <Text style={styles.emoji}>🌸</Text>
                <Text style={styles.categoriaTexto}>Geisha</Text>
              </View>
              <View style={styles.categoria}>
                <Text style={styles.emoji}>⛩️</Text>
                <Text style={styles.categoriaTexto}>Origen</Text>
              </View>
            </View>

            <TouchableOpacity
              style={styles.boton}
              onPress={() => navigation.navigate('Explore')}
            >
              <Text style={styles.botonTexto}>EXPLORAR</Text>
            </TouchableOpacity>

            <View style={styles.loginFila} pointerEvents="box-none">
              <Text style={styles.loginTexto}>Ya tengo cuenta — </Text>
              <TouchableOpacity onPress={() => navigation.navigate('Login')}>
                <Text style={styles.loginLink}>Entrar</Text>
              </TouchableOpacity>
            </View>
          </View>

        </View>
      </FondoVivo>
    </View>
  );
}

const styles = StyleSheet.create({
  raiz: {
    flex: 1,
    backgroundColor: colores.fondo,
  },
  contenido: {
    flex: 1,
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
    color: colores.fantasma,
    letterSpacing: 6,
    marginBottom: 32,
  },
  kanji: {
    fontSize: 72,
    color: colores.acento,
    fontWeight: 'bold',
    lineHeight: 76,
  },
  linea: {
    width: 40,
    height: 1,
    backgroundColor: colores.divisor,
    marginVertical: 24,
  },
  frase1: {
    fontSize: 13,
    color: colores.neblina,
    letterSpacing: 1,
    fontStyle: 'italic',
    marginBottom: 4,
  },
  frase2: {
    fontSize: 13,
    color: colores.tenue,
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
    backgroundColor: 'rgba(26,22,29,0.5)',
    borderWidth: 0.5,
    borderColor: colores.borde,
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
    color: colores.tenue,
    letterSpacing: 1,
  },
  boton: {
    backgroundColor: colores.acento,
    borderRadius: 12,
    padding: 14,
    alignItems: 'center',
    marginBottom: 16,
  },
  botonTexto: {
    color: colores.tinta,
    fontSize: 14,
    letterSpacing: 3,
    fontWeight: 'bold',
  },
  loginFila: {
    flexDirection: 'row',
    justifyContent: 'center',
    alignItems: 'center',
  },
  loginTexto: {
    fontSize: 11,
    color: colores.divisor,
    letterSpacing: 1,
  },
  loginLink: {
    fontSize: 11,
    color: colores.sutil,
    letterSpacing: 1,
    textDecorationLine: 'underline',
  },
});
