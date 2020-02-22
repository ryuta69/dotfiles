<?php

namespace App;

Class Languages
{
    protected $map = [
        'auto' => 'Automatic',
        'af' => 'Afrikaans',
        'sq' => 'Albanian',
        'ar' => 'Arabic',
        'hy' => 'Armenian',
        'az' => 'Azerbaijani',
        'eu' => 'Basque',
        'be' => 'Belarusian',
        'bn' => 'Bengali',
        'bg' => 'Bulgarian',
        'ca' => 'Catalan',
        'zh-cn' => 'Chinese (Simplified)',
        'zh-tw' => 'Chinese (Traditional)',
        'hr' => 'Croatian',
        'cs' => 'Czech',
        'da' => 'Danish',
        'nl' => 'Dutch',
        'en' => 'English',
        'eo' => 'Esperanto',
        'et' => 'Estonian',
        'tl' => 'Filipino',
        'fi' => 'Finnish',
        'fr' => 'French',
        'gl' => 'Galician',
        'ka' => 'Georgian',
        'de' => 'German',
        'el' => 'Greek',
        'gu' => 'Gujarati',
        'ht' => 'Haitian Creole',
        'he' => 'Hebrew',
        'hi' => 'Hindi',
        'hu' => 'Hungarian',
        'is' => 'Icelandic',
        'id' => 'Indonesian',
        'ga' => 'Irish',
        'it' => 'Italian',
        'ja' => 'Japanese',
        'kk' => 'Kazakhstan',
        'kn' => 'Kannada',
        'km' => 'Khmer',
        'ko' => 'Korean',
        'lo' => 'Lao',
        'la' => 'Latin',
        'lv' => 'Latvian',
        'lt' => 'Lithuanian',
        'mk' => 'Macedonian',
        'ms' => 'Malay',
        'mt' => 'Maltese',
        'no' => 'Norwegian',
        'fa' => 'Persian',
        'pl' => 'Polish',
        'pt' => 'Portuguese',
        'pt-br' => 'Brazilian Portuguese',
        'ro' => 'Romanian',
        'ru' => 'Russian',
        'sr' => 'Serbian',
        'sk' => 'Slovak',
        'sl' => 'Slovenian',
        'es' => 'Spanish',
        'sw' => 'Swahili',
        'sv' => 'Swedish',
        'ta' => 'Tamil',
        'te' => 'Telugu',
        'th' => 'Thai',
        'tr' => 'Turkish',
        'uk' => 'Ukrainian',
        'ur' => 'Urdu',
        'vi' => 'Vietnamese',
        'cy' => 'Welsh',
        'yi' => 'Yiddish'
    ];

    public function map($key = null)
    {
        return $key === null ? $this->map['auto'] : $this->map[$key];
    }

    public function getAvailableLanguages()
    {
        return array_keys($this->map);
    }

    public function isAvailable($key)
    {
        return array_key_exists(strtolower($key), $this->map);
    }
}
