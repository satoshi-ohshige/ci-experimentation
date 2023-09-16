<?php

namespace Tests\Unit;

use PHPUnit\Framework\TestCase;

class ExampleTest extends TestCase
{
    /**
     * A basic test example.
     *
     * @return void
     */
    public function testBasicTest()
    {
        $this->assertTrue(true);
    }

    public function testX()
    {
        $this->assertSame('abc', 'xyz');
    }

    public function testY()
    {
        $this->assertTrue(false, 'trueになるはず');
    }

    public function testZ()
    {
        $this->assertTrue(false);
    }
}
