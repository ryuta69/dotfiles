<?php

namespace App;

use Symfony\Component\Dotenv\Dotenv;

class GoogleTranslateWorkflowBase
{
    protected $workFlows;

    protected $languages;

    protected $settings;

    protected $defaultSettings = [
        'source' => 'auto',
        'target' => 'en'
    ];

    protected $validOptions = [
        'source' => 'Source Language',
        'target' => 'Target Language',
    ];

    public function __construct()
    {
        $this->workFlows = new Workflows();
        $this->languages = new Languages();

        $this->loadSettings();
    }

    public function loadSettings()
    {
        $envFilePath = __DIR__ . '/../.env';
        if (file_exists($envFilePath)) {
            (new Dotenv())->load($envFilePath);
        }

        $settings = null;
        if (getenv('APP_ENV') !== 'dev') {
            $filePath = $this->getConfigFilePath();
            if (file_exists($filePath)) {
                $settings = json_decode(file_get_contents($filePath), true);
            }
        }

        // Only set settings if anything is stored in config file, otherwise use the defaults.
        if (is_array($settings)) {
            $this->settings = $settings;
        } else {
            $this->settings = $this->defaultSettings;
        }
    }

    public function setSettings($settings)
    {
        $this->settings = $settings;
    }

    protected function saveSettings()
    {
        file_put_contents($this->getConfigFilePath(), json_encode($this->settings));
    }

    /**
     * @return string
     */
    protected function getConfigFilePath()
    {
        return "{$this->workFlows->data()}/config.json";
    }
}
