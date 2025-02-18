<?php
    use function Laravel\Folio\{middleware, name};
    middleware('auth');
    name('x-delete');
?>

<x-layouts.app>
    <x-app.container class="" x-data>
        <livewire:x-delete />
    </x-app.container>
</x-layouts.app>
