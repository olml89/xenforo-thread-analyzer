<?php

declare(strict_types=1);

namespace olml89\XenforoThreadAnalyzer;

final readonly class Greeter
{
    private const string TARGET = 'World';

    public function greet(?string $target): string
    {
        return sprintf('Hello, %s!', $target ?? self::TARGET) . PHP_EOL;
    }
}
