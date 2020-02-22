<?php

namespace App;

use DOMDocument;

class AlfredResult
{
    private $items;

    private $shared;

    public function __construct()
    {
        $this->items = [];
        $this->shared = [];
    }

    public function getShared()
    {
        return $this->shared;
    }

    public function setShared($key, $value)
    {
        $this->shared[$key] = $value;
    }

    public function getItems()
    {
        $dom = new DOMDocument('1.0', 'utf-8');
        $items = $dom->createElement('items');

        foreach ($this->items as $item) {
            $items->appendChild(
                $item->getItem($dom)
            );
        }

        $dom->appendChild($items);

        return $dom;
    }

    public function addItem($item)
    {
        $this->items[] = new AlfredResultItem($this, $item);
    }

    public function __toString()
    {
        return $this->getItems()->saveXML();
    }
}
