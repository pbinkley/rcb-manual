# Documentation

## Figures

- In chapter text: call figure.html, pass figure id.

	{% include figure.html fig="20" %}

	- fig: becomes suffix of id of div: figure_20

- In figure file in \_sections:

	{% include osd_iiif_image_viewer.html region="292,358,2029,2794" canvas="98" id="98" height="120vh" %}

## \_includes/osd_iiif_image_viewer.html

	- region: xywh coordinates of initial view
	- canvas: canvas id (will be zero-padded to four characters)
	- id: root of id field in div and in javascript; use the canvas id, with distinguishing suffix if more than one figure is drawn from the same canvas (if that ever happens)
	- degrees (optional): initial rotation; default: 0
	- height (optional): initial height of the div in vh; default: 120vh (which is suitable for an unrotated full page display)

## Tables

- In chapter text: call table.html, pass table id.

	{% include table.html tab="20" %}

	- tab: becomes suffix of id of div: table_20

- In table file in \_sections:

	- normally includes table in markdown or html
	- may include scanned image from IIIF:

	{% include osd_iiif_image_viewer.html region="292,358,2029,2794" canvas="98" id="98" height="120vh" %}

## \_includes/osd_iiif_image_viewer.html

	- makes OpenSeadragon viewer of a IIIF image of a page
	- region: xywh coordinates of initial view
	- canvas: canvas id (will be zero-padded to four characters)
	- id: root of id field in div and in javascript; use the canvas id, with distinguishing suffix if more than one figure is drawn from the same canvas (if that ever happens)
	- degrees (optional): initial rotation; default: 0
	- height (optional): initial height of the div in vh; default: 120vh (which is suitable for an unrotated full page display)

## \includes/iiif_image.html

- builds an img tag displaying a region of a page image using a IIIF Image API uri
- includes identifier, canvas, region, size, rotation, quality, format
- also includes page number for link to page view in IA standard display