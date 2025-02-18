<?php

namespace App\Livewire;

use Livewire\Component;
use Illuminate\Bus\Batch;
use Illuminate\Support\Facades\Bus;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Log;
use Throwable;
use App\Jobs\DeleteTweetJob;
use App\Models\TweetDeletionProgress;

class XDelete extends Component
{
    public $dateRange = 'all';
    public $customDateFrom;
    public $customDateTo;
    public $includeRetweets = false;
    public $includeLikes = false;
    public $includeReplies = false;
    public $keywords = '';

    // Progress tracking
    public $isDeleting = false;
    public $totalTweets = 0;
    public $deletedTweets = 0;
    public $progress = 0;
    public $error = null;

    // The ID of our progress record
    public $progressRecordId;

    public function mount()
{
    $existingRecord = TweetDeletionProgress::where('user_id', Auth::id())
        ->whereColumn('deleted_tweets', '<', 'total_tweets')
        ->first();

    if ($existingRecord) {
        $this->progressRecordId = $existingRecord->id;
        $this->totalTweets = $existingRecord->total_tweets;
        $this->deletedTweets = $existingRecord->deleted_tweets;
        $this->progress = ($existingRecord->total_tweets > 0)
            ? round(($existingRecord->deleted_tweets / $existingRecord->total_tweets) * 100)
            : 0;
        $this->isDeleting = true;
    }
}

    public function delete()
    {
        try {
            $this->error = null;

            // if ($this->dateRange === 'custom') {
            //     $this->validate([
            //         'customDateFrom' => 'required|date',
            //         'customDateTo'   => 'required|date|after_or_equal:customDateFrom'
            //     ]);
            // }

            $user = Auth::user();

            $tweetsToDelete = [];
            $response = \Atymic\Twitter\Facade\Twitter::usingCredentials($user->token, $user->token_secret)
                ->forApiV2()
                ->userTweets($user->provider_id, [
                    'exclude' => 'retweets,replies'
                ]);

            $tweetsData = json_decode($response, true);
            if (isset($tweetsData['data'])) {
                foreach ($tweetsData['data'] as $tweet) {
                    $tweetsToDelete[] = $tweet['id'];
                }
            }

            if (empty($tweetsToDelete)) {
                $this->error = "No tweets found to delete.";
                return;
            }

            $this->isDeleting = true;

            // Create a progress record.
            $progressRecord = TweetDeletionProgress::create([
                'user_id'       => $user->id,
                'total_tweets'  => count($tweetsToDelete),
                'deleted_tweets'=> 0,
            ]);

            $this->progressRecordId = $progressRecord->id;
            $this->totalTweets = count($tweetsToDelete);
            $this->deletedTweets = 0;
            $this->progress = 0;
            

            // Create deletion jobs for each tweet.
            $jobs = [];
            foreach ($tweetsToDelete as $tweetId) {
                $jobs[] = new DeleteTweetJob($tweetId, $user->id, $this->progressRecordId);
            }

            // Dispatch the job batch.
            Bus::batch($jobs)
                ->then(function ($batch) {
                    // Batch completed successfully.
                })
                ->catch(function ($batch, Throwable $e) {
                    $this->error = "An error occurred during deletion: " . $e->getMessage();
                    Log::error($e);
                })
                ->finally(function ($batch) {
                    $this->isDeleting = false;
                })
                ->dispatch();

        } catch (Throwable $e) {
            $this->error = "Failed to start deletion: " . $e->getMessage();
            Log::error($e);
            $this->isDeleting = false;
        }
    }

    public function pollProgress()
    {
        if (!$this->progressRecordId) {
            return;
        }

        $progressRecord = TweetDeletionProgress::find($this->progressRecordId);
        
        if ($progressRecord) {
            $this->totalTweets = $progressRecord->total_tweets;
            $this->deletedTweets = $progressRecord->deleted_tweets;
            $this->progress = ($this->totalTweets > 0)
                ? round(($this->deletedTweets / $this->totalTweets) * 100)
                : 0;
        }

        if ($this->deletedTweets >= $this->totalTweets) {
            $this->isDeleting = false;
        }
    }

    public function render()
    {
        return view('livewire.x-delete');
    }
}