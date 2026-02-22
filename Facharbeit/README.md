Methoden können aufgerufen werden mit e.funktion()

## Triebwerke

**midthruster(power)**

- Aktiviert das Haupttriebwerk am Heck des Schiffs
- `power`: Wert zwischen 0 und 1 (z.B. 0.5 für halbe Kraft)
- Erzeugt starken Schub in Flugrichtung
- Energieverbrauch: 10 pro Aktivierung

**leftthruster(power)**

- Aktiviert das linke Triebwerk
- `power`: Wert zwischen 0 und 1
- Dreht das Schiff nach links (erhöht Rotation)
- Erzeugt zusätzlich leichten Vorwärtsschub
- Energieverbrauch: 1 pro Aktivierung

**rightthruster(power)**

- Aktiviert das rechte Triebwerk
- `power`: Wert zwischen 0 und 1
- Dreht das Schiff nach rechts (verringert Rotation)
- Erzeugt zusätzlich leichten Vorwärtsschub
- Energieverbrauch: 1 pro Aktivierung

## Waffensystem

**turnlaser(dir)**

- Dreht den Laser um 1 Grad
- `dir`: negative Werte für links, positive für rechts
- Beispiel: `turnlaser(-1)` dreht nach links, `turnlaser(1)` nach rechts

**laser_rotation()**

- Gibt die aktuelle Ausrichtung des Lasers zurück
- Rückgabewert: Winkel zwischen 0 und 360 Grad

**shoot()**

- Feuert ein Geschoss ab
- Cooldown: 0.3 Sekunden zwischen Schüssen
- Energieverbrauch: 15 pro Schuss
- Geschoss fliegt in Richtung der Laser-Ausrichtung

## Informationsfunktionen

**angle_to_enemy()**

- Gibt den Winkel zum gegnerischen Schiff zurück
- Rückgabewert: Winkel zwischen 0 und 360 Grad, relativ zur eigenen Ausrichtung
- 0° bedeutet der Gegner ist direkt vor dir
- 90° bedeutet der Gegner ist rechts von dir
- 180° bedeutet der Gegner ist hinter dir
- 270° bedeutet der Gegner ist links von dir

**dist_to_enemy()**

- Gibt die Entfernung zum gegnerischen Schiff zurück
- Rückgabewert: Distanz in Pixeln

**get_energy()**

- Gibt die aktuelle verfügbare Energie zurück
- Maximum: 1000
