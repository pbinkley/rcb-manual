---
layout: none
---

<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500">

<div id="mirador" style="position: absolute; top: 0; bottom: 0; left: 0; right: 0;"></div>

<script>document.write("<script type='text/javascript' src='https://mirador-dev.netlify.app/dist/mirador.min.js?v=" + Date.now() + "'><\/script>");</script>

<script type="text/javascript">
 var miradorInstance = Mirador.viewer({
   id: 'mirador',
   theme: {
     transitions: window.location.port === '4000' ?  { create: () => 'none' } : {},
   },
   windows: [
   {
     manifestId: '{{ "/iiif/manualonmethodso00robe/manifest.json" | absolute_url }}',
   }]
 });
</script>
