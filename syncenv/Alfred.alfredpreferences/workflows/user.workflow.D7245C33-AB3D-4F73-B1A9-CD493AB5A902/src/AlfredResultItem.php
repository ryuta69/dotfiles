<?php

namespace App;

class AlfredResultItem
{
    private $result;
    private $item;

    /**
     * AlfredResultItem constructor.
     *
     * @param $result AlfredResult
     * @param $item
     */
    public function __construct($result, $item)
    {
        $this->result = $result;
        $this->item = $item;
    }

    public function getItem(\DOMDocument $dom)
    {
        $options = array_merge(
            $this->result->getShared(),
            $this->item
        );

        $item = $dom->createElement('item');

        foreach (['uid', 'arg', 'valid', 'autocomplete'] as $name) {
            if (array_key_exists($name, $options)) {
                $item->setAttribute($name, $options[$name]);
            }
        }

        foreach (['title', 'subtitle', 'icon'] as $key) {
            if (array_key_exists($key, $options)) {
                $child = $dom->createElement($key);
                $text = $dom->createTextNode($options[$key]);

                $child->appendChild($text);
                $item->appendChild($child);
            }
        }

        return $item;
    }
}
