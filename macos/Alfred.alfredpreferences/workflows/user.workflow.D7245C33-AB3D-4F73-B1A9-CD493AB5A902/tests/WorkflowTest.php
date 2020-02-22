<?php

namespace Tests;

use App\GoogleTranslateWorkflow;
use PHPUnit\Framework\TestCase;

class WorkflowTest extends TestCase
{
    /**
     * @throws \Exception
     */
    public function testTranslationWithInsufficientCharacters()
    {
        $workflow = new GoogleTranslateWorkflow();
        $output = $workflow->process('te');

        $items = simplexml_load_string($output);

        $this->assertEquals('More input needed', $items->item[0]->title);
    }

    /**
     * @throws \Exception
     */
    public function testTranslationFromSourceToTargetLanguage()
    {
        $workflow = new GoogleTranslateWorkflow();
        $output = $workflow->process('en>pt This is a test');

        $items = simplexml_load_string($output);

        $this->assertCount(1, $items);
    }

    /**
     * @throws \Exception
     */
    public function testTranslationFromSourceToTargetLanguages()
    {
        $workflow = new GoogleTranslateWorkflow();
        $output = $workflow->process('en>pt,es This is a test');

        $items = simplexml_load_string($output);

        $this->assertCount(2, $items);
    }

    /**
     * @throws \Exception
     */
    public function testTranslationFromTargetToSource()
    {
        $workflow = new GoogleTranslateWorkflow();
        $output = $workflow->process('pt,es<en This is a test');

        $items = simplexml_load_string($output);

        $this->assertEquals('pt', $items->item[0]->attributes()->uid);
        $this->assertEquals('es', $items->item[1]->attributes()->uid);
    }

    /**
     * @throws \Exception
     */
    public function testTranslationWithoutFromANDTargetLanguages()
    {
        $workflow = new GoogleTranslateWorkflow();
        $output = $workflow->process('test');

        $items = simplexml_load_string($output);

        $this->assertEquals('en', $items->item[0]->attributes()->uid);
    }

    /**
     * @throws \Exception
     */
    public function testInputHasCorrectUid()
    {
        $workflow = new GoogleTranslateWorkflow();
        $workflow->setSettings([
            'source' => 'auto',
            'target' => 'pt,en,sv'
        ]);

        $output = $workflow->process('Why is this is a test');

        $items = simplexml_load_string($output);

        $this->assertEquals('pt', $items->item[0]->attributes()->uid);
        $this->assertEquals('en', $items->item[1]->attributes()->uid);
        $this->assertEquals('sv', $items->item[2]->attributes()->uid);
    }

    /**
     * @throws \Exception
     */
    public function testTranslationOrder()
    {
        $workflow = new GoogleTranslateWorkflow();
        $workflow->setSettings([
            'source' => 'auto',
            'target' => 'pt,en,sv'
        ]);

        $output = $workflow->process('This is a test');

        $items = simplexml_load_string($output);

        $this->assertEquals('Isto é um teste', $this->getTranslation($items->item[0]));
        $this->assertEquals('This is a test', $this->getTranslation($items->item[1]));
        $this->assertEquals('Detta är ett prov', $this->getTranslation($items->item[2]));
    }

    /**
     * @param \SimpleXMLElement $item
     *
     * @return string
     */
    private function getTranslation($item)
    {
        return explode('|', $item->attributes()->arg)[1];
    }

    /**
     * @param string $arg
     *
     * @return string
     */
    private function getUrl($arg)
    {
        return explode('|', $arg)[0];
    }
}
