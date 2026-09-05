<?php

declare(strict_types=1);

namespace Tests\Unit;

use olml89\XenforoThreadAnalyzer\Greeter;
use PHPUnit\Framework\TestCase;

final class GreeterTest extends TestCase
{
    public function testGreetWithNullTarget(): void
    {
        $greeter = new Greeter();
        $expectedGreeting = 'Hello, World!' . PHP_EOL;

        self::assertSame($expectedGreeting, $greeter->greet());
    }

    public function testGreetWithTarget(): void
    {
        $greeter = new Greeter();
        $expectedGreeting = 'Hello, Test!' . PHP_EOL;

        self::assertSame($expectedGreeting, $greeter->greet('Test'));
    }
}
