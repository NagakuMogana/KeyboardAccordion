import ddf.minim.*;
import ddf.minim.ugens.*;
import java.util.HashMap;

class Keydion {
  Minim        minim;
  AudioOutput  out;
  HashMap<String, Oscil> waveMap = new HashMap<String, Oscil>();
  HashMap<String, Boolean> soundMap = new HashMap<String, Boolean>();

  Keydion() {
    minim = new Minim(this);
    out   = minim.getLineOut();
    Wavetable waveType = Waves.TRIANGLE;
    waveMap.put("a", new Oscil( Frequency.ofPitch("C4"), 1, waveType ));
    waveMap.put("w", new Oscil( Frequency.ofPitch("C#4"), 1, waveType ));
    waveMap.put("z", new Oscil( Frequency.ofPitch("D4"), 1, waveType ));
    waveMap.put("s", new Oscil( Frequency.ofPitch("D#4"), 1, waveType ));
    waveMap.put("e", new Oscil( Frequency.ofPitch("E4"), 1, waveType ));
    waveMap.put("x", new Oscil( Frequency.ofPitch("F4"), 1, waveType ));
    waveMap.put("d", new Oscil( Frequency.ofPitch("F#4"), 1, waveType ));
    waveMap.put("r", new Oscil( Frequency.ofPitch("G4"), 1, waveType ));
    waveMap.put("c", new Oscil( Frequency.ofPitch("G#4"), 1, waveType ));
    waveMap.put("f", new Oscil( Frequency.ofPitch("A4"), 1, waveType ));
    waveMap.put("t", new Oscil( Frequency.ofPitch("A#4"), 1, waveType ));
    waveMap.put("v", new Oscil( Frequency.ofPitch("B4"), 1, waveType ));

    waveMap.put("g", new Oscil( Frequency.ofPitch("C5"), 1, waveType ));
    waveMap.put("y", new Oscil( Frequency.ofPitch("C#5"), 1, waveType ));
    waveMap.put("b", new Oscil( Frequency.ofPitch("D5"), 1, waveType ));
    waveMap.put("h", new Oscil( Frequency.ofPitch("D#5"), 1, waveType ));
    waveMap.put("u", new Oscil( Frequency.ofPitch("E5"), 1, waveType ));
    waveMap.put("n", new Oscil( Frequency.ofPitch("F5"), 1, waveType ));
    waveMap.put("j", new Oscil( Frequency.ofPitch("F#5"), 1, waveType ));
    waveMap.put("i", new Oscil( Frequency.ofPitch("G5"), 1, waveType ));
    waveMap.put("m", new Oscil( Frequency.ofPitch("G#5"), 1, waveType ));
    waveMap.put("k", new Oscil( Frequency.ofPitch("A5"), 1, waveType ));
    waveMap.put("o", new Oscil( Frequency.ofPitch("A#5"), 1, waveType ));
    waveMap.put(",", new Oscil( Frequency.ofPitch("B5"), 1, waveType ));

    waveMap.put("l", new Oscil( Frequency.ofPitch("C6"), 1, waveType ));
    waveMap.put("p", new Oscil( Frequency.ofPitch("C#6"), 1, waveType ));
    waveMap.put(".", new Oscil( Frequency.ofPitch("D6"), 1, waveType ));
    waveMap.put(";", new Oscil( Frequency.ofPitch("D#6"), 1, waveType ));
    waveMap.put("[", new Oscil( Frequency.ofPitch("E6"), 1, waveType ));
    waveMap.put("/", new Oscil( Frequency.ofPitch("F6"), 1, waveType ));
    waveMap.put("'", new Oscil( Frequency.ofPitch("F#6"), 1, waveType ));
    waveMap.put("]", new Oscil( Frequency.ofPitch("G6"), 1, waveType ));

    waveMap.put("3", new Oscil( Frequency.ofPitch("D4"), 1, waveType ));
    waveMap.put("4", new Oscil( Frequency.ofPitch("F4"), 1, waveType ));
    waveMap.put("5", new Oscil( Frequency.ofPitch("G#4"), 1, waveType ));
    waveMap.put("6", new Oscil( Frequency.ofPitch("B4"), 1, waveType ));
    waveMap.put("7", new Oscil( Frequency.ofPitch("D5"), 1, waveType ));
    waveMap.put("8", new Oscil( Frequency.ofPitch("F5"), 1, waveType ));
    waveMap.put("9", new Oscil( Frequency.ofPitch("G#5"), 1, waveType ));
    waveMap.put("0", new Oscil( Frequency.ofPitch("B5"), 1, waveType ));
    waveMap.put("-", new Oscil( Frequency.ofPitch("D6"), 1, waveType ));
    waveMap.put("=", new Oscil( Frequency.ofPitch("F6"), 1, waveType ));
    waveMap.put("¥", new Oscil( Frequency.ofPitch("G#6"), 1, waveType ));

    //waveMap.put("1", new Oscil( Frequency.ofPitch(""), 1, waveType ));
    //waveMap.put("2", new Oscil( Frequency.ofPitch(""), 1, waveType ));
    //waveMap.put("q", new Oscil( Frequency.ofPitch(""), 1, waveType ));
  }

  void press(String k) {
    if (waveMap.get(k) == null) {
      return;
    }

    Boolean isSound = soundMap.get(k);
    if (isSound == null || isSound == false) {
      waveMap.get(k).patch(out);
      soundMap.put(k, true);
    }
  }

  void release(String k) {
    if (waveMap.get(k) == null) {
      return;
    }

    Boolean isSound = soundMap.get(k);
    if (isSound == null || isSound == true) {
      waveMap.get(k).unpatch(out);
      soundMap.put(k, false);
    }
  }
}
