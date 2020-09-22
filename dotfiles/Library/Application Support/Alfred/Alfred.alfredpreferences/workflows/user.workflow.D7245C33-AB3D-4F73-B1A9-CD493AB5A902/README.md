# Alfred - Google Translate

## How to install

Download and double click the [workflow](https://github.com/DONSA/alfred-google-translate/raw/master/google-translate.alfredworkflow) to import or update it into Alfred. Done!


## How to use

The simplest way is to use the (**⇧ + ⌘ + g**) shortcut and start typing.  
Default source language is '**auto**' and target is '**en**'. Check [Settings](#settings) section to set your own. 

You can also use your Alfred hotkey and then type '**gt**' or '**translate**' followed by the text that needs to be translated:
```
gt Text to translate
```

Use the '**from**' and '**to**' keywords to specify the languages you want to translate. You can do this via the '**>**' or '**<**' operator and the respective language codes:
```
gt pt>en Palavra
gt de>fr Wort
gt fr<en Word
```

If you don't know the source language just use the keyword '**auto**':
```
gt auto>pt Text to translate
```

Navigate through the results and press:
- **Enter** to copy the translation to your clipboard
- **Alt + Enter** to open the original request directly on the Google Translator website
- **Cmd + Enter** to copy and paste the translation into your active application automatically


## Settings

Show all available options and their values:
```
gtset show
```

Change target languages:
```
gtset target pt,en,sv
```

Change source language:
```
gtset source de
```

Set any option back to it's default value:
```
gtset source default
```


## Languages

* auto = Detect automatically
* af = Afrikaans
* sq = Albanian
* ar = Arabic
* hy = Armenian
* az = Azerbaijani
* eu = Basque
* be = Belarusian
* bn = Bengali
* bg = Bulgarian
* ca = Catalan
* zh-cn = Chinese (Simplified)
* zh-tw = Chinese (Traditional)
* hr = Croatian
* cs = Czech
* da = Danish
* nl = Dutch
* en = English
* eo = Esperanto
* et = Estonian
* tl = Filipino
* fi = Finnish
* fr = French
* gl = Galician
* ka = Georgian
* kk = Kazakh
* de = German
* el = Greek
* gu = Gujarati
* ht = Haitian Creole
* he = Hebrew
* hi = Hindi
* hu = Hungarian
* is = Icelandic
* id = Indonesian
* ga = Irish
* it = Italian
* ja = Japanese
* kn = Kannada
* km = Khmer
* ko = Korean
* lo = Lao
* la = Latin
* lv = Latvian
* lt = Lithuanian
* mk = Macedonian
* ms = Malay
* mt = Maltese
* no = Norwegian
* fa = Persian
* pl = Polish
* pt = Portuguese
* pt-br = Brazilian Portuguese
* ro = Romanian
* ru = Russian
* sr = Serbian
* sk = Slovak
* sl = Slovenian
* es = Spanish
* sw = Swahili
* sv = Swedish
* ta = Tamil
* te = Telugu
* th = Thai
* tr = Turkish
* uk = Ukrainian
* ur = Urdu
* vi = Vietnamese
* cy = Welsh
* yi = Yiddish


## License

The MIT License (MIT)
