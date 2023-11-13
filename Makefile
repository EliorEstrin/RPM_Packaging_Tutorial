cgame:
        gcc -g -o cgame cgame.c

clean:
        rm cgame
install:
        mkdir -p $(DESTDIR)/usr/bin
        install -m 0755 cgame $(DESTDIR)/usr/bin/cgaame