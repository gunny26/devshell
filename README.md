# KERAS Docker Image am first steps with RNN

## AI, Machine Learning, Deep Learning

AI ist die Kombination aller Methoden

Machine Learning - das lernen erfolgt aus den Daten selbst

Deep Learning ist das Fundament, ein Neuronales Netzwerk für einen gewisse Aufgabe


## Perceptron (aka Neuron)

das Percetron ist das Elementarste Teil in einem Deep Learning Network

Eingang ist immer X (Tensor) welche mit Gewichten belegt werden W (Tensor)
Summe aller Eingaben wird durch eine Aktivierungsfunktion geleitet und ergibt den Output y (Vector)

y = g ( w0 + Summe( X dot W ) )

z = w + SUmme( X dot W)

Es gibt einen Bias w0 (Constant)

Die Aktivierungsfunktion ist eine non-lineare Funktion wie sigmoid
Als Ausgabe kommt da etwas zwischen 0 und 1 raus

es könnten auch tanh oder relu sein

Das Percetpron Teil sozusagen die Ausgabe in zwei Kategorien ein.

jedes Perceptron hat seine eigene Gewichte (W)


## Deep Neural Network

Input wird auch Features genannt

Zwischen Inpunt und Output ist der hidden layer, der kann beliebig tief sein.

Der Output ist ebenfalls ein Layer (Dense(nodes=1))


## Training

Die Weights müssen sich an das erwartete Ergebnis anpassen.

Loss ist die Differenz zwischen perdicted Ergebnis und actual Wert (y)

Loss soll mininmiert werden, da gibt es zwei methoden

Das wird mit der SoftMax funktion gemacht wenn es um binäre Outputs geht - also kategorisieren
Oder der Mean squared error loss für reale werte (float)

Loss Optimization sorgt dafür dass die weights angepasst werden.
Die Funktion wird J genannt, das Ziel ist es ein Minimum zu finden (es könnte mehrere geben)

Strategie - irgendwo anfangen, dann einen Gradienten berechnen und nach unten gehen.
Gradient Decent wird as genannt
Das führt zu einem lokalem Minimum über mehere Schritte
Die Schrittgröße ist die learning rate, die ist eher intern.

mathematisch hat das was mit der Chain Rule zu tun, klingt komliziert, kenn ich mich nicht aus

Es gibt forward propagation
- wie kommt man von einem Input zu einem Output
- dazu braucht man nicht so viele Ressourcen

Es gibt backward propagation
- das wird beim lernen benutzt, da ist mehr zu tun, bis der loss optimiert ist.
- da sind viele Ressourcen notwendig

Die Landscape eines Networks kann sehr kompliziert sein.
Es gibt vielleicht viele lokale Minumums, aber auch ein globales Minimum.

Die Learning Rate ist da ein wichtiger Parameter -> wie viel werden die Weights bewegt
zu wenig - dauert zu lange, bleibt in einem lokalen Minimum hängen.
zu groß - übersprint vielleicht ein Minimum

Die Learning rate kann auch angepasst werden (adaptive learning rates)
Dazu gibt es eigene Algorithmen (hier kommt adam, sgd, etc. her)

tf.keras.optimizers.SGD - Stochastic Gradient Descent
tf.keras.optimizers.Adam
tf.keras.optimizers.Adadelta
tf.keras.optimizers.Adagrad
tf.keras.optimizers.RMSProd


die Weights können zwsichen -unendlich und +unendlich liegen, die ganze surface kann nicht durchsucht werden

### SGD genauer erklärt:
- nimmt nur einen Teil der Input Daten
- schneller als der original Gradient Descent
- nennt man Mini Patches
- oft 32 als Größe

### Overfitting

das richtige mass zwischen underfitting (also zu oberflächlich) und zu angepast an die Trainingsdaten.
Wenn das Modell zu sehr an die Trainingdaten angepasst ist, könnte es passieren, dass das Modell
bei neuen Daten nicht mehr passt.

Underfitting - Ideal fit - Oerfitting

Regularization - soll das verbessern, soll overfitting verhindern
* Dropout - während dem Training werden einige Activations auf 0 gesetzt
  Damit werden Outputs beschränkt, da kommt dann zum Beispiel nur 50% zum nächsten layer
* Early Stopping - wenn sich der Loss nicht mehr verändert, dann lasen
  Das Training stoppen, wenn die Trainingsdaten ein Minimum erreichen




