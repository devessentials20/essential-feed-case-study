# Essential Feed App - Image Feed Feature

## BDD Specs

### Narrative #1
> As an online customer I want the app to automatically load my latest image feed So I can always enjoy newest images of my friends 

### Scenarios (Acceptance Criteria)
```
Given the customer has connectivity
when customer request to see their feed
Then app should should display the latest feed from remote
  And replace the cache with the new feed
```

### Narrative #2
> As an offline customer I want the app to show the latest saved version of my image feed So I can always enjoy images of my friends

### Scenarios (Acceptance Criteria)
```
Given the cusotmer doesn't have connectivity
And their cached version of the feed
when customer request to see the feed
Then the app should display the latest feed saved

Given the customer doesn't have connectivity
And the cache is empty
When customer request to see the feed
Then app should display an error message
```

## Use Cases

### Load Feed Use Case

#### Data:
* URL

#### Primary Course (Happy Path)
1. Execute "Load Feed Items" command with above data.
2. System downloads data from the URL
3. System validates downloaded data.
4. System creates feed items from the valid data.
5. System delivers feed items.

#### Invalid data - error course (sad path)
1. System delivers error

#### No connectivity - error course (sad path)
1. System delivers error








