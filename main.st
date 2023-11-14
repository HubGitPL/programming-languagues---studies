Object subclass: #Wielokat
	instanceVariableNames: 'wierzcholki nazwa '
	classVariableNames: ''
	poolDictionaries: ''
	category: 'JezykiProgramowania'!

!Wielokat methodsFor: 'initialize-release'!

initialize: liczbaWierzcholkow name: nowaNazwa
	"konstruktor obiektu - wielokata"

	nazwa:=nowaNazwa.
	wierzcholki:=Array new: liczbaWierzcholkow.
	wierzcholki at: 1 put: 0@0.! !

!Wielokat methodsFor: 'accessing'!

nazwa
	"podaje nazwe wielokata"

	^nazwa!
	
liczbaWierzcholkow
    "podaje liczbe wierzcholkow"
    
    ^(wierzcholki size)!

nazwa: nowa_nazwa
	"ustawia nowa nazwe wielokata"

	nazwa:=nowa_nazwa! !
	
!Wielokat methodsFor: 'actions'!

drukuj
    "opisuje dana figure"
    
    | drukowanie nowaLinia |
    nowaLinia := String with: Character lf.
    drukowanie := nowaLinia, 'Dana jest figura: ', nazwa.
    1 to: (self liczbaWierzcholkow) do: [ :i |
        drukowanie := drukowanie, nowaLinia, 'wierzcholek ', (i asString), ': ', ((wierzcholki at: i) x) asString , '@' , ((wierzcholki at: i) y) asString.
    ].
    drukowanie := drukowanie, nowaLinia, 'Pole = ', ((self pole) asString).
    ^Transcript show: drukowanie; cr.! !




Wielokat subclass: #Kwadrat
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'JezykiProgramowania'!


!Kwadrat methodsFor: 'arithmetic'!

+ figura
	"dodaj 2 figury w sensie pola"
	
	| p |

	p:=self pole + figura pole.
	^(Kwadrat new) initialize: (p sqrt)! !

!Kwadrat methodsFor: 'actions'!

pole
	"licz pole kwadratu"
	
	^(wierzcholki at: 2) x squared! !

!Kwadrat methodsFor: 'initialize-release'!

initialize: bok
	"tworz kwadrat o podanym boku"

	super initialize: 4 name: 'Kwadrat'.
	wierzcholki at: 2 put: bok@0.
	wierzcholki at: 3 put: bok@bok.
	wierzcholki at: 4 put: 0@bok.! !

Wielokat subclass: #TrojkatRownoramienny
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'JezykiProgramowania'!


!TrojkatRownoramienny methodsFor: 'arithmetic'!

+ figura
	"dodaj 2 figury w sensie pola"

	| p a h|

	p:=self pole + figura pole.
	h:=(2*p*((wierzcholki at: 3) y)/((wierzcholki at: 2) x)) sqrt.
	a:=2*p/h.
	^(TrojkatRownoramienny new) initialize: a wysokosc: h! !

!TrojkatRownoramienny methodsFor: 'actions'!

pole
	"licz pole trojkata rownoramiennego"

	^((wierzcholki at: 2) x) * ((wierzcholki at: 3) y) / 2 ! !

!TrojkatRownoramienny methodsFor: 'initialize-release'!

initialize: podstawa wysokosc: wysokosc
	"tworz trojkat rownoramienny o podanej podstawie i wysokosci"

	super initialize: 3 name: 'TrojkatRownoramienny'.
	wierzcholki at: 2 put: podstawa@0.
	wierzcholki at: 3 put: (podstawa/2)@wysokosc. ! !
	
| k t |
k := (Kwadrat new) initialize:2.
t := (TrojkatRownoramienny new) initialize: 2
wysokosc: 2.
Transcript show: 'Dane sa wielokaty:'; cr.
t drukuj.
k drukuj.
Transcript cr; show: 't+k'.
t2 := t+ k.
t2 drukuj.
Transcript cr; show: 'k+t'.
k1 := k + t.
k1 drukuj.
