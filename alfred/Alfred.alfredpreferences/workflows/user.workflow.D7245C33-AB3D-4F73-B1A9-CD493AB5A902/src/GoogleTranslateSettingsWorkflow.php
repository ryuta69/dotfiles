<?php

namespace App;

class GoogleTranslateSettingsWorkflow extends GoogleTranslateWorkflowBase
{
    /**
     * @param string $request
     *
     * @return AlfredResult
     */
    public function process($request)
    {
        $requestParts = explode(' ', $request);
        $command = array_shift($requestParts);

        if ($command === 'show') {
            $result = $this->showSettings();
        } else {
            $result = $this->set($command, $requestParts[0]);
        };

        return $result;
    }

    /**
     * @param string $request
     *
     * @return string
     */
    public function store($request)
    {
        list($option, $value) = explode(':', $request);
        $this->settings[trim($option)] = trim($value);
        $this->saveSettings();

        return "{$option} set to {$value}";
    }

    /**
     * @return AlfredResult
     */
    protected function showSettings()
    {
        $xml = new AlfredResult();
        $xml->setShared('uid', 'setting');

        foreach ($this->settings as $settingKey => $settingValue) {
            $xml->addItem([
                'arg' => $settingKey,
                'valid' => 'yes',
                'title' => "{$settingKey}={$settingValue}"
            ]);
        }

        return $xml;
    }

    /**
     * @param string $setting
     * @param string $value
     *
     * @return AlfredResult $xml
     */
    protected function set($setting, $value)
    {
        $xml = new AlfredResult();
        $xml->setShared('uid', 'setting');
        $setLength = strlen($setting);
        $validOptionKeys = array_keys($this->validOptions);

        if (!in_array($setting, $validOptionKeys, true)) {
            // Find valid options
            $valid = array_filter($validOptionKeys, function($value) use($setting, $setLength) {
                return ($setting  == strtolower(substr($value, 0, $setLength)));
            });

            if (count($valid) > 0) {
                foreach ($valid as $optionKey) {
                    $xml->addItem([
                        'title' => $this->validOptions[$optionKey],
                        'subtitle' => $optionKey,
                        'autocomplete' => $optionKey
                    ]);
                }
            } else {
                $xml->addItem(['title' => "Unknown option {$value}"]);
            }
        } else {
            $item = ['title' => $setting];

            if (empty($value)) {
                $item['subtitle'] = "Current value = {$this->settings[$setting]}";
            } else {
                $trimmedValue = strtolower(trim($value));

                if ($trimmedValue === 'default') {
                    $trimmedValue = $this->defaultSettings[$setting];
                }

                if ($this->languages->isAvailable($trimmedValue)) {
                    $item['subtitle'] = 'New value = ' . $trimmedValue;
                    $item['arg'] = "{$setting}:{$trimmedValue}";
                } else {
                    $requestedLanguages = explode(',', $trimmedValue);
                    $validLanguages = [];
                    foreach ($requestedLanguages as $languageKey) {
                        $trimmedKey = trim($languageKey);
                        if ($this->languages->isAvailable($trimmedKey)) {
                            $validLanguages[$trimmedKey] = $this->languages->map($trimmedKey);
                        }
                    }

                    if (count($validLanguages) > 0) {
                        $checkedValue = implode(',', array_keys($validLanguages));
                        $item['subtitle'] = 'New value = ' . implode(', ', $validLanguages) . " ({$checkedValue})";
                        $item['arg'] = "{$setting}:{$checkedValue}";
                    } else {
                        $item['subtitle'] = "Invalid value {$value}";
                    }
                }
            }

            $xml->addItem($item);
        }

        return $xml;
    }

}
