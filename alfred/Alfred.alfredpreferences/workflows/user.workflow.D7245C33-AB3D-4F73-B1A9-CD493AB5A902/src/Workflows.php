<?php

namespace App;

use SimpleXMLElement;

class Workflows
{
    private $cache;
    private $data;
    private $bundle;
    private $path;
    private $results;

    /**
     * Class constructor function. Initializes all class variables. Accepts one optional parameter
     * of the workflow bundle id in the case that you want to specify a different bundle id. This
     * would adjust the output directories for storing data.
     *
     * @param $bundleId - optional bundle id if not found automatically
     *
     * @return void
     */
    public function __construct($bundleId = null)
    {
        $this->path = exec('pwd');

        if (file_exists('info.plist')) {
            $this->bundle = $this->get('bundleid', 'info.plist');
        }

        if ($bundleId !== null) {
            $this->bundle = $bundleId;
        }

        $this->cache = $_SERVER['alfred_workflow_cache'];
        $this->data = $_SERVER['alfred_workflow_data'];

        if ($this->cache && !file_exists($this->cache)) {
            exec("mkdir '{$this->cache}'");
        }

        if ($this->data && !file_exists($this->data)) {
            exec("mkdir '{$this->data}'");
        }

        $this->results = [];
    }

    /**
     * Description:
     * Accepts no parameter and returns the value of the bundle id for the current workflow.
     * If no value is available, then false is returned.
     *
     * @return bool
     */
    public function bundle()
    {
        return !$this->bundle ? false : $this->bundle;
    }

    /**
     * Description:
     * Accepts no parameter and returns the value of the path to the cache directory for your
     * workflow if it is available. Returns false if the value isn't available.
     *
     * @return false if not available, path to the cache directory for your workflow if available.
     */
    public function cache()
    {
        if ($this->bundle === null) {
            return false;
        }

        if ($this->cache === null) {
            return false;
        }

        return $this->cache;
    }

    /**
     * Accepts no parameter and returns the value of the path to the storage directory for your
     * workflow if it is available. Returns false if the value isn't available.
     *
     * @return bool
     */
    public function data()
    {
        if ($this->bundle === null) {
            return false;
        }

        if ($this->data === null) {
            return false;
        }

        return $this->data;
    }

    /**
     * Accepts no parameter and returns the value of the path to the current directory for your
     * workflow if it is available. Returns false if the value isn't available.
     *
     * @return bool
     */
    public function path()
    {
        if ($this->path === null) {
            return false;
        }

        return $this->path;
    }

    /**
     * Returns an array of available result items
     *
     * @return array
     */
    public function results()
    {
        return $this->results;
    }

    /**
     * Description:
     * Convert an associative array into XML format
     *
     * @param string $data
     * @param string $format
     *
     * @return string
     */
    public function toxml($data = '', $format = 'array')
    {
        if (!$data && empty($this->results)) {
            return '';
        }

        if ($format === 'json') {
            $data = json_decode($data, true);
        }

        if (!$data && !empty($this->results)) {
            $data = $this->results;
        }

        $items = new SimpleXMLElement('<items></items>');

        foreach ($data as $b):                                // Lop through each object in the array
            $c = $items->addChild('item');                // Add a new 'item' element for each object
            $c_keys = array_keys($b);                        // Grab all the keys for that item
            foreach ($c_keys as $key):                        // For each of those keys
                if ($key === 'uid'):
                    if ($b[$key] === null || $b[$key] === ''):
                        continue;
                    else:
                        $c->addAttribute('uid', $b[$key]);
                    endif;
                elseif ($key === 'arg'):
                    $c->addAttribute('arg', $b[$key]);
                    $c->$key = $b[$key];
                elseif ($key === 'type'):
                    $c->addAttribute('type', $b[$key]);
                elseif ($key === 'valid'):
                    if ($b[$key] === 'yes' || $b[$key] === 'no'):
                        $c->addAttribute('valid', $b[$key]);
                    endif;
                elseif ($key === 'autocomplete'):
                    if ($b[$key] === null || $b[$key] === ''):
                        continue;
                    else:
                        $c->addAttribute('autocomplete', $b[$key]);
                    endif;
                elseif ($key === 'icon'):
                    if (substr($b[$key], 0, 9) === 'fileicon:'):
                        $val = substr($b[$key], 9);
                        $c->$key = $val;
                        $c->$key->addAttribute('type', 'fileicon');
                    elseif (substr($b[$key], 0, 9) === 'filetype:'):
                        $val = substr($b[$key], 9);
                        $c->$key = $val;
                        $c->$key->addAttribute('type', 'filetype');
                    else:
                        $c->$key = $b[$key];
                    endif;
                else:
                    $c->$key = $b[$key];
                endif;
            endforeach;
        endforeach;

        return $items->asXML();
    }

    /**
     * Remove all items from an associative array that do not have a value
     *
     * @param $a - Associative array
     *
     * @return bool
     */
    private function empty_filter($a)
    {
        if ($a === '' || $a === null) {
            return false;
        }

        return true;
    }

    /**
     * Save values to a specified plist. If the first parameter is an associative
     * array, then the second parameter becomes the plist file to save to. If the
     * first parameter is string, then it is assumed that the first parameter is
     * the label, the second parameter is the value, and the third parameter is
     * the plist file to save the data to.
     *
     * @param $a - associative array of values to save
     * @param $b - the value of the setting
     * @param $c - the plist to save the values into
     */
    public function set($a = null, $b = null, $c = null)
    {
        if (is_array($a)):
            if (file_exists($b)):
                if (file_exists($this->path . '/' . $b)):
                    $b = $this->path . '/' . $b;
                endif;
            elseif (file_exists($this->data . '/' . $b)):
                $b = $this->data . '/' . $b;
            elseif (file_exists($this->cache . '/' . $b)):
                $b = $this->cache . '/' . $b;
            else:
                $b = $this->data . '/' . $b;
            endif;
        else:
            if (file_exists($c)):
                if (file_exists($this->path . '/' . $c)):
                    $c = $this->path . '/' . $c;
                endif;
            elseif (file_exists($this->data . '/' . $c)):
                $c = $this->data . '/' . $c;
            elseif (file_exists($this->cache . '/' . $c)):
                $c = $this->cache . '/' . $c;
            else:
                $c = $this->data . '/' . $c;
            endif;
        endif;

        if (is_array($a)) {
            foreach ($a as $k => $v) {
                exec('defaults write "' . $b . '" ' . $k . ' "' . $v . '"');
            }
        } else {
            exec('defaults write "' . $c . '" ' . $a . ' "' . $b . '"');
        }
    }

    /**
     * Description:
     * Read a value from the specified plist
     *
     * @param $a - the value to read
     * @param $b - plist to read the values from
     *
     * @return bool false if not found, string if found
     */
    public function get($a, $b)
    {
        if (file_exists($b)) {
            if (file_exists($this->path . '/' . $b)) {
                $b = $this->path . '/' . $b;
            }
        } elseif (file_exists($this->data . '/' . $b)) {
            $b = $this->data . '/' . $b;
        } elseif (file_exists($this->cache . '/' . $b)) {
            $b = $this->cache . '/' . $b;
        } else {
            return false;
        }

        exec('defaults read "' . $b . '" ' . $a, $out);

        if ($out === '') {
            return false;
        }

        $out = $out[0];

        return $out;
    }

    /**
     * Description:
     * Read data from a remote file/url, essentially a shortcut for curl
     *
     * @param $url     - URL to request
     * @param $options - Array of curl options
     *
     * @return bool
     */
    public function request($url = null, $options = null)
    {
        if ($url === null) {
            return false;
        }

        $defaults = [
            CURLOPT_RETURNTRANSFER => true,
            CURLOPT_URL => $url,
            CURLOPT_FRESH_CONNECT => true,
        ];

        if ($options) {
            foreach ($options as $k => $v) {
                $defaults[$k] = $v;
            }
        }

        array_filter($defaults, [$this, 'empty_filter']);

        $ch = curl_init();
        curl_setopt_array($ch, $defaults);
        $out = curl_exec($ch);
        $err = curl_error($ch);
        curl_close($ch);

        if ($err) {
            return $err;
        }

        return $out;
    }

    /**
     * Allows searching the local hard drive using mdfind
     *
     * @param $query - search string
     *
     * @return array
     */
    public function mdfind($query)
    {
        exec("mdfind '{$query}'", $results);

        return $results;
    }

    /**
     * Accepts data and a string file name to store data to local file as cache
     *
     * @param array  $a - data to save to file
     * @param string $b - filename to write the cache data to
     *
     * @return bool
     */
    public function write($a, $b)
    {
        if (file_exists($b)) {
            if (file_exists($this->path . '/' . $b)) {
                $b = $this->path . '/' . $b;
            }
        } elseif (file_exists($this->data . '/' . $b)) {
            $b = $this->data . '/' . $b;
        } elseif (file_exists($this->cache . '/' . $b)) {
            $b = $this->cache . '/' . $b;
        } else {
            $b = $this->data . '/' . $b;
        }

        if (is_array($a)) {
            $a = json_encode($a);
            file_put_contents($b, $a);

            return true;
        }

        if (is_string($a)) {
            file_put_contents($b, $a);

            return true;
        }

        return false;
    }

    /**
     * Returns data from a local cache file
     *
     * @param string $filename
     * @param bool   $isArray
     *
     * @return bool
     */
    public function read($filename, $isArray = false)
    {
        if (file_exists($filename)):
            if (file_exists($this->path . '/' . $filename)):
                $filename = $this->path . '/' . $filename;
            endif;
        elseif (file_exists($this->data . '/' . $filename)):
            $filename = $this->data . '/' . $filename;
        elseif (file_exists($this->cache . '/' . $filename)):
            $filename = $this->cache . '/' . $filename;
        else:
            return false;
        endif;

        $out = file_get_contents($filename);
        if (!is_null(json_decode($out)) && !$isArray) {
            $out = json_decode($out);
        } elseif (!is_null(json_decode($out)) && !$isArray) {
            $out = json_decode($out, true);
        }

        return $out;
    }

    /**
     * Helper function that just makes it easier to pass values into a function
     * and create an array result to be passed back to Alfred
     *
     * @param        $uid   - the uid of the result, should be unique
     * @param        $arg   - the argument that will be passed on
     * @param        $title - The title of the result item
     * @param        $sub   - The subtitle text for the result item
     * @param        $icon  - the icon to use for the result item
     * @param string $valid - sets whether the result item can be actioned
     * @param        $auto  - the autocomplete value for the result item
     * @param null   $type
     *
     * @return array $type - array item to be passed back to Alfred
     */
    public function result($uid, $arg, $title, $sub, $icon, $valid = 'yes', $auto = null, $type = null)
    {
        $temp = [
            'uid' => $uid,
            'arg' => $arg,
            'title' => $title,
            'subtitle' => $sub,
            'icon' => $icon,
            'valid' => $valid,
            'autocomplete' => $auto,
            'type' => $type,
        ];

        if ($type === null) {
            unset($temp['type']);
        }

        $this->results[] = $temp;

        return $temp;
    }
}
