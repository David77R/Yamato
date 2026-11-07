import { useEffect, useRef, useState } from 'react';
import {
  AccessibilityInfo,
  Animated,
  Easing,
  Image,
  StyleSheet,
  View,
} from 'react-native';

const BASE = require('../assets/arte/yurei-oscuro.jpg');

const LUCES = [
  {
    fuente: require('../assets/arte/luz-rostro.png'),
    subida: 5200,
    bajada: 6400,
    reposo: 2600,
    maxima: 0.82,
  },
  {
    fuente: require('../assets/arte/luz-espalda.png'),
    subida: 6800,
    bajada: 7600,
    reposo: 4300,
    maxima: 0.66,
  },
  {
    fuente: require('../assets/arte/luz-sangre.png'),
    subida: 8100,
    bajada: 9200,
    reposo: 6100,
    maxima: 0.74,
  },
];

export default function FondoVivo({ brilloBase = 0.17, children }) {
  const valores = useRef(LUCES.map(() => new Animated.Value(0))).current;
  const [sinMovimiento, setSinMovimiento] = useState(false);

  useEffect(() => {
    let vivo = true;
    AccessibilityInfo.isReduceMotionEnabled().then((reducido) => {
      if (vivo) setSinMovimiento(reducido);
    });
    return () => {
      vivo = false;
    };
  }, []);

  useEffect(() => {
    if (sinMovimiento) {
      valores.forEach((valor) => valor.setValue(0.55));
      return undefined;
    }

    const ciclos = valores.map((valor, indice) => {
      const { subida, bajada, reposo } = LUCES[indice];
      return Animated.loop(
        Animated.sequence([
          Animated.timing(valor, {
            toValue: 1,
            duration: subida,
            easing: Easing.inOut(Easing.ease),
            useNativeDriver: true,
          }),
          Animated.timing(valor, {
            toValue: 0,
            duration: bajada,
            easing: Easing.inOut(Easing.ease),
            useNativeDriver: true,
          }),
          Animated.delay(reposo),
        ])
      );
    });

    ciclos.forEach((ciclo, indice) => {
      setTimeout(() => ciclo.start(), indice * 1900);
    });

    return () => ciclos.forEach((ciclo) => ciclo.stop());
  }, [sinMovimiento, valores]);

  return (
    <View style={StyleSheet.absoluteFill}>
      <View style={StyleSheet.absoluteFill} pointerEvents="none">
        <Image
          source={BASE}
          style={[StyleSheet.absoluteFill, { opacity: brilloBase }]}
          resizeMode="cover"
        />

        {LUCES.map((luz, indice) => (
          <Animated.Image
            key={indice}
            source={luz.fuente}
            resizeMode="cover"
            style={[
              StyleSheet.absoluteFill,
              {
                opacity: valores[indice].interpolate({
                  inputRange: [0, 1],
                  outputRange: [0, luz.maxima],
                }),
              },
            ]}
          />
        ))}
      </View>

      <View style={StyleSheet.absoluteFill} pointerEvents="box-none">
        {children}
      </View>
    </View>
  );
}
