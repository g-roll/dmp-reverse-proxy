# Reverse Proxy Server

## Anforderungen

1. Minimaler Verwaltungsaufwand
   - Keine komplexe Konfiguration

2. Docker Integration
   - Minimale Container-Konfiguration
   - Vermeidung typischer Docker-Fallstricke (Network Label Diskrepanz, etc.)

3. SSL/DNS Handling
   - Automatische LetsEncrypt Integration
   - Intelligentes DNS-Handling
     - Host-Prüfung vor SSL-Anforderung
     - Vermeidung von LetsEncrypt Limits
   - Hosting ohne sofortige DNS-Auflösung möglich
     - Website initial ohne SSL
     - Automatische SSL-Aktivierung ondemand

## Proxy Vergleich

| Proxy               | Einfachheit                          | Docker Integration                | SSL/DNS Handling                           | Kommentar                             |
| ------------------- | ------------------------------------ | --------------------------------- | ------------------------------------------ | ------------------------------------- |
| Traefik             | Docker Labels erfordern Einarbeitung | Native Integration, Label-basiert | Vollständige DNS-Check Integration möglich | Komplex, aber technisch vollständig   |
| Nginx Proxy Manager | Simples Web UI                       | Keine Labels nötig                | Keine automatische DNS-Validierung         | Einfach, aber technisch unvollständig |
| Caddy               | Simple Config                        | Unkompliziert                     | Automatisch on demand                      | Empfehlung. Perfect.                  |

## Ergebnis

| LfdNr | Proxy               | Auftrag Erfolgreich |
| ----- | ------------------- | ------------------- |
| 1     | Caddy               |                     |
| 2     | Nginx Proxy Manager |                     |
| 3     | Traefik             |                     |

## Ausführungsanforderungen

1. Dependencies
   - Absolute Minimierung externer Abhängigkeiten
   - Nur zwingend notwendige Komponenten

2. Native Implementierung
   - Maximale Nutzung nativer Funktionalitäten
   - Minimale Konfigurationseingriffe
   - Keine unnötigen Modifikationen am Standardverhalten

3. File-First Prinzip
   - Priorisierung deklarativer Konfiguration
   - Bestehende Konfigurationsmöglichkeiten ausschöpfen
   - Grundsatz: "So viel wie notwendig, so wenig wie möglich"
   - Stateless as possible: Kein dynamisches Schreiben/Ändern von bestehenden
     Konfigurationen
