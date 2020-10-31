TOPTARGETS := all clean

OSCILLATORS := $(wildcard *mk)

VERSION=1.6-2

$(TOPTARGETS): $(OSCILLATORS) package_nutekt-digital
$(OSCILLATORS):
	@rm -fR .dep ./build
	@PLATFORM=nutekt-digital VERSION=$(VERSION) $(MAKE) -f $@ $(MAKECMDGOALS)

.PHONY: $(TOPTARGETS) $(OSCILLATORS)

NUTEKT_DIGITAL_PACKAGE=eurorack_nutekt-digital

package_nutekt-digital:
	@echo Packaging to ./${NUTEKT_DIGITAL_PACKAGE}.zip
	@rm -f ${NUTEKT_DIGITAL_PACKAGE}.zip
	@rm -rf ${NUTEKT_DIGITAL_PACKAGE}
	@mkdir ${NUTEKT_DIGITAL_PACKAGE}
	@cp -a *.ntkdigunit ${NUTEKT_DIGITAL_PACKAGE}/
	@cp -a credits.txt ${NUTEKT_DIGITAL_PACKAGE}/
	@zip -rq9m ${NUTEKT_DIGITAL_PACKAGE}.zip ${NUTEKT_DIGITAL_PACKAGE}/
