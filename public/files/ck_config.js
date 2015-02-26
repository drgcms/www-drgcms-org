/**
 * @license Copyright (c) 2003-2012, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see LICENSE.html or http://ckeditor.com/license
 */

CKEDITOR.editorConfig = function( config ) {
	// Define changes to default configuration here. For example:
        //config.language = 'en';
	// config.uiColor = '#AADC6E';
  config.filebrowserBrowseUrl       = '/assets/drg_default_html_editor/elfinder/elfinder.html';
//  config.filebrowserUploadUrl       = '/elfinder/datoteke';
//  config.filebrowserImageBrowseUrl  = '/elfinder/datoteke';
//  config.filebrowserImageUploadUrl  = '/elfinder/datoteke';
  config.allowedContent = true;
  config.filebrowserWindowWidth     = 800;
  config.filebrowserWindowHeight    = 500;
  config.disableNativeSpellChecker = false;
//  config.skin = 'moonocolor,/skins/ckeditor/moonocolor/';
};


CKEDITOR.stylesSet.add( 'default', [
	/* Block Styles */

	// These styles are already available in the "Format" combo ("format" plugin),
	// so they are not needed here by default. You may enable them to avoid
	// placing the "Format" combo in the toolbar, maintaining the same features.
	/*
	{ name: 'Paragraph',		element: 'p' },
	{ name: 'Heading 1',		element: 'h1' },
	{ name: 'Heading 2',		element: 'h2' },
	{ name: 'Heading 3',		element: 'h3' },
	{ name: 'Heading 4',		element: 'h4' },
	{ name: 'Heading 5',		element: 'h5' },
	{ name: 'Heading 6',		element: 'h6' },
	{ name: 'Preformatted Text',element: 'pre' },
	{ name: 'Address',			element: 'address' },
	*/

	{
		name: 'Program code',
		element: 'div',
		attributes: { 'class': 'program-code' }
        },
	{
		name: 'Rumeno Dvignjeno ozadje',
		element: 'div',
		styles: {
			padding: '10px',
			background: 'lightyellow',
      'box-shadow': '4px 4px 6px #aaa',
      border: '1px solid white'
		}
  },
	{
		name: 'Podčrtano s pikicami',
		element: 'div',
		styles: {
			padding: '2px',
      'border-bottom': '2px dotted #ccc',
      'margin-top': '10px',
      'padding-bottom': '30px'
		}
	},

	/* Inline Styles */

	// These are core styles available as toolbar buttons. You may opt enabling
	// some of them in the Styles combo, removing them from the toolbar.
	// (This requires the "stylescombo" plugin)
	/*
	{ name: 'Strong',			element: 'strong', overrides: 'b' },
	{ name: 'Emphasis',			element: 'em'	, overrides: 'i' },
	{ name: 'Underline',		element: 'u' },
	{ name: 'Strikethrough',	element: 'strike' },
	{ name: 'Subscript',		element: 'sub' },
	{ name: 'Superscript',		element: 'sup' },
	*/

	{ name: 'Marker: Rumen',	element: 'span', styles: { 'background-color': 'Yellow' } },
	{ name: 'Marker: Zelen',	element: 'span', styles: { 'background-color': 'Lime' } },

	{ name: 'Večje',			element: 'big' },
	{ name: 'Manjše',			element: 'small' },
	{ name: 'Pisalni stroj',		element: 'tt' },

	{ name: 'Računalniško',	element: 'code' },
	{ name: 'Tipkovnica',   element: 'kbd' },
	{ name: 'Tekst primer',  element: 'samp' },
	{ name: 'Spremenljivka',     element: 'var' },

	{ name: 'Izbrisann tekst',		element: 'del' },
	{ name: 'Vstavljen tekst',	element: 'ins' },

	{ name: 'Citat naslov',		element: 'cite' },
	{ name: 'Citat vpisan',   element: 'q' },

	/* Object Styles */

	{
		name: 'Styled image (left)',
		element: 'img',
		attributes: { 'class': 'left' }
	},

	{
		name: 'Styled image (right)',
		element: 'img',
		attributes: { 'class': 'right' }
	},

	{
		name: 'Compact table',
		element: 'table',
		attributes: {
			cellpadding: '5',
			cellspacing: '0',
			border: '1',
			bordercolor: '#ccc'
		},
		styles: {
			'border-collapse': 'collapse'
		}
	},

	{ name: 'Borderless Table',		element: 'table',	styles: { 'border-style': 'hidden', 'background-color': '#E6E6FA' } },
	{ name: 'Square Bulleted List',	element: 'ul',		styles: { 'list-style-type': 'square' } }
]);