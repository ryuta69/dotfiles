<?php

namespace App;

use function \count;
use Stichoza\GoogleTranslate\GoogleTranslate;

class GoogleTranslateWorkflow extends GoogleTranslateWorkflowBase
{
    /**
     * @param string $input
     *
     * @return AlfredResult
     * @throws \Exception
     */
    public function process($input)
    {
        if (preg_match('/(?P<command>^[a-z-,]{2,}(>|<)[a-z-,]{2,})/', $input, $match)) {
            $command = strtolower($match['command']);
            $text = trim(str_replace($match['command'], '', $input));
        } else {
            $command = '';
            $text = trim($input);
        }

        if (strlen($text) < getenv('MIN_LENGTH')) {
            return $this->getSimpleMessage('More input needed', 'Input must be longer than ' . getenv('MIN_LENGTH') .  ' characters');
        }

        list($sourceLanguage, $targetLanguages) = $this->extractLanguages($command);

        $googleResults = [];
        foreach ($targetLanguages as $targetLanguage) {
            $googleResults[$targetLanguage] = $this->fetchGoogleTranslation($sourceLanguage, $targetLanguage, $text);
        }

        return $this->processGoogleResults($googleResults, $text, $sourceLanguage);
    }

    /**
     * @param string $command
     *
     * @return array
     */
    protected function extractLanguages($command)
    {
        $sourceLanguage = $targetLanguage = '';

        // First check whether both, source and target language, are set
        if (strpos($command, '>') > 0) {
            list($sourceLanguage, $targetLanguage) = explode('>', $command);
        } elseif (strpos($command, '<') > 0) {
            list($targetLanguage, $sourceLanguage) = explode('<', $command);
        }

        // Check if the source language is valid
        if (!$this->languages->isAvailable($sourceLanguage)) {
            $sourceLanguage = $this->settings['source'];
        }

        // Check if the target language is valid
        if (!$this->languages->isAvailable($targetLanguage)) {
            // If not, try to parse multiple target languages
            $incomingTargetLanguages = explode(',', $targetLanguage);
            $targetLanguageList = [];
            foreach ($incomingTargetLanguages as $itl) {
                if ($this->languages->isAvailable($itl)) {
                    $targetLanguageList[] = $itl;
                }
            }

            // If any valid target languages are selected write them back as csl or just return the default
            if (count($targetLanguageList) === 0) {
                $targetLanguage = explode(',', $this->settings['target']);
            } else {
                $targetLanguage = $targetLanguageList;
            }
        } else {
            $targetLanguage = [$targetLanguage];
        }

        return [
            $sourceLanguage,
            $targetLanguage,
        ];
    }

    /**
     * @param string $source
     * @param string $target
     * @param string $phrase
     *
     * @return array|string
     * @throws \Exception
     */
    protected function fetchGoogleTranslation($source, $target, $phrase)
    {
        $gt = new GoogleTranslate();
        $gt->setSource($source);
        $gt->setTarget($target);

        return $gt->translate($phrase);
    }

    protected function processGoogleResults(array $googleResults, $sourcePhrase, $sourceLanguage)
    {
        $xml = new AlfredResult();

        if (!count($googleResults)) {
            $xml->addItem([
                'title' => 'No results found'
            ]);
        }

        foreach ($googleResults as $targetLanguage => $result) {
            if (is_array($result)) {
                $xml->addItem([
                    'uid' => $targetLanguage,
                    'arg' => $this->getUserURL($sourceLanguage, $targetLanguage, $sourcePhrase) . '|' . $result[0][0][0],
                    'valid' => 'yes',
                    'title' => $result[0][0][0],
                    'subtitle' => "{$sourcePhrase} ({$this->languages->map($result[1])})",
                    'icon' => $this->getFlag($targetLanguage)
                ]);
            } else {
                $xml->addItem([
                    'uid' => $targetLanguage,
                    'arg' => $this->getUserURL($sourceLanguage, $targetLanguage, $sourcePhrase) . '|' . $result,
                    'valid' => 'yes',
                    'title' => $result,
                    'subtitle' => "{$sourcePhrase} ({$this->languages->map($sourceLanguage)})",
                    'icon' => $this->getFlag($targetLanguage)
                ]);
            }
        }

        return $xml;
    }

    /**
     * @param string $message
     * @param string $subtitle
     *
     * @return AlfredResult
     */
    protected function getSimpleMessage($message, $subtitle = '')
    {
        $xml = new AlfredResult();
        $xml->setShared('uid', 'mtranslate');
        $xml->addItem([
            'title' => $message,
            'subtitle' => $subtitle
        ]);

        return $xml;
    }

    /**
     * @param string $sourceLanguage
     * @param string $targetLanguage
     * @param string $phrase
     *
     * @return string
     */
    protected function getUserURL($sourceLanguage, $targetLanguage, $phrase)
    {
        return "https://translate.google.com/#{$sourceLanguage}/{$targetLanguage}/" . urlencode($phrase);
    }

    /**
     * @param string $language
     *
     * @return string
     */
    protected function getFlag($language)
    {
        $iconFilename = __DIR__ . "/icons/{$language}.png";
        if (!file_exists($iconFilename)) {
            $iconFilename = __DIR__ . '/icons/unknown.png';
        }

        return $iconFilename;
    }
}
