<div class="w-full" 
     x-data="{ showConfirm: false, isDeleting: $wire.entangle('isDeleting'), showLoader : false }">
    <div class="bg-white rounded-lg shadow-lg overflow-hidden">
        <!-- Header -->
        <div class="px-6 py-4 bg-gradient-to-r from-gray-50 to-white border-b border-gray-100">
            <div class="flex items-center space-x-3">
                <svg class="h-6 w-6 text-gray-600" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16" />
                </svg>
                <h2 class="text-xl font-semibold text-gray-800">Delete X Posts</h2>
            </div>
        </div>

        <div class="p-6 space-y-6">
            <!-- Date Filter -->
            <div class="bg-gray-50 rounded-lg p-4">
                <label class="block text-sm font-medium text-gray-700 mb-3">Delete posts from:</label>
                <select wire:model="dateRange" class="w-full bg-white rounded-md border-gray-300 shadow-sm focus:ring-2 focus:ring-blue-500 focus:border-blue-500">
                    <option value="all">All Time</option>
                    <option value="today">Today</option>
                    <option value="week">This Week</option>
                    <option value="month">This Month</option>
                    <option value="custom">Custom Range</option>
                </select>

                @if($dateRange === 'custom')
                <div class="mt-4 grid grid-cols-1 md:grid-cols-2 gap-4">
                    <div class="relative">
                        <label class="block text-sm font-medium text-gray-700">From</label>
                        <input type="date" wire:model="customDateFrom" class="mt-1 w-full rounded-md border-gray-300 shadow-sm focus:ring-blue-500 focus:border-blue-500">
                    </div>
                    <div class="relative">
                        <label class="block text-sm font-medium text-gray-700">To</label>
                        <input type="date" wire:model="customDateTo" class="mt-1 w-full rounded-md border-gray-300 shadow-sm focus:ring-blue-500 focus:border-blue-500">
                    </div>
                </div>
                @endif
            </div>

            <!-- Filter Options -->
            <div class="grid grid-cols-1 md:grid-cols-1 ">
                <!-- Content Types -->
                <!-- <div class="bg-gray-50 rounded-lg p-4">
                    <label class="block text-sm font-medium text-gray-700 mb-3">Include Content Types</label>
                    <div class="space-y-3">
                        <label class="flex items-center">
                            <input type="checkbox" wire:model="includeRetweets" class="w-4 h-4 rounded border-gray-300 text-blue-600 focus:ring-blue-500">
                            <span class="ml-3 text-gray-700">Retweets</span>
                        </label>
                        <label class="flex items-center">
                            <input type="checkbox" wire:model="includeLikes" class="w-4 h-4 rounded border-gray-300 text-blue-600 focus:ring-blue-500">
                            <span class="ml-3 text-gray-700">Likes</span>
                        </label>
                        <label class="flex items-center">
                            <input type="checkbox" wire:model="includeReplies" class="w-4 h-4 rounded border-gray-300 text-blue-600 focus:ring-blue-500">
                            <span class="ml-3 text-gray-700">Replies</span>
                        </label>
                    </div>
                </div> -->

                <!-- Keywords -->
                <div class="bg-gray-50 rounded-lg p-4">
                    <label class="block text-sm font-medium text-gray-700 mb-3">Keywords Filter</label>
                    <div class="relative">
                        <input type="text" wire:model.defer="keywords" class="w-full rounded-md border-gray-300 pl-10 shadow-sm focus:ring-blue-500 focus:border-blue-500" placeholder=" &nbsp;&nbsp;Filter by keywords...">
                        <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                            <svg class="h-5 w-5 text-gray-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z" />
                            </svg>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Progress Section (shown when deletion is in progress) -->
        <div class="px-6 py-4 border-t border-gray-100" x-show="isDeleting" wire:poll.1000ms="pollProgress">
            <div class="space-y-4">
                <!-- Progress Stats -->
                <div class="grid grid-cols-3 gap-4 text-center">
                    <div class="bg-gray-50 rounded-lg p-3">
                        <span class="block text-sm text-gray-500">Total Tweets</span>
                        <span class="text-lg font-semibold text-gray-900">{{ $totalTweets }}</span>
                    </div>
                    <div class="bg-gray-50 rounded-lg p-3">
                        <span class="block text-sm text-gray-500">Deleted</span>
                        <span class="text-lg font-semibold text-gray-900">{{ $deletedTweets }}</span>
                    </div>
                    <div class="bg-gray-50 rounded-lg p-3">
                        <span class="block text-sm text-gray-500">Remaining</span>
                        <span class="text-lg font-semibold text-gray-900">{{ $totalTweets - $deletedTweets }}</span>
                    </div>
                </div>

                <!-- Progress Bar -->
                <div class="relative pt-1">
                    <div class="flex mb-2 items-center justify-between">
                        <div>
                            <span class="text-xs font-semibold inline-block text-blue-600">Progress</span>
                        </div>
                        <div class="text-right">
                            <span class="text-xs font-semibold inline-block text-blue-600">{{ $progress }}%</span>
                        </div>
                    </div>
                    <div class="overflow-hidden h-2 text-xs flex rounded bg-blue-100">
                        <div class="transition-all duration-300 ease-out shadow-none flex flex-col text-center whitespace-nowrap text-white justify-center bg-blue-500" style="width: {{ $progress }}%">
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Error Alert -->
        @if($error)
        <div class="px-6 py-4 border-t border-red-100 bg-red-50" x-init="isDeleting = false">
            <div class="flex items-center text-red-600">
                <svg class="h-5 w-5 mr-2" fill="currentColor" viewBox="0 0 20 20">
                    <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zM8.707 7.293a1 1 0 00-1.414 1.414L8.586 10l-1.293 1.293a1 1 0 101.414 1.414L10 11.414l1.293 1.293a1 1 0 001.414-1.414L11.414 10l1.293-1.293a1 1 0 00-1.414-1.414L10 8.586 8.707 7.293z" clip-rule="evenodd"/>
                </svg>
                <span>{{ $error }}</span>
            </div>
        </div>
        @endif

        <!-- Action Footer -->
        <div class="px-6 py-4 bg-gray-50 border-t border-gray-100">
            <div class="flex justify-between items-center">
                <span class="text-sm text-gray-600" x-show="!isDeleting">
                    Selected posts will be permanently deleted
                </span>
                <button 
                    type="button" 
                    @click="showConfirm = true"
                    x-bind:disabled="isDeleting"
                    class="inline-flex items-center px-4 py-2 border border-transparent text-sm font-medium rounded-md text-white bg-red-600 hover:bg-red-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-red-500 disabled:opacity-50 disabled:cursor-not-allowed">
                    Delete Selected Posts
                </button>
            </div>
        </div>

        <!-- Confirmation Modal -->
        <div x-show="showConfirm" class="fixed inset-0 bg-gray-500 bg-opacity-75 flex items-center justify-center" style="display: none;">
            <div class="bg-white rounded-lg p-6 max-w-sm mx-auto">
                <h3 class="text-lg font-medium text-gray-900">Confirm Deletion</h3>
                <p class="mt-2 text-sm text-gray-500">Are you sure you want to delete the selected posts? This action cannot be undone.</p>
                <div class="mt-4 flex justify-end space-x-3">
                    <button @click="showConfirm = false" class="inline-flex items-center px-3 py-2 border border-gray-300 shadow-sm text-sm font-medium rounded-md text-gray-700 bg-white hover:bg-gray-50 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500">
                        Cancel
                    </button>
                    <button @click="showLoader = true; showConfirm = false; isDeleting = true; $wire.delete()" class="inline-flex items-center px-3 py-2 border border-transparent text-sm font-medium rounded-md text-white bg-red-600 hover:bg-red-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-red-500">
                        Confirm Delete
                    </button>
                </div>
            </div>
        </div>
    </div>
</div>