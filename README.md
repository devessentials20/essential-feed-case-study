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

### Load Feed Fallback (Cache) Use Case
#### Data:
* Max age

#### Primary Course (Happy Path)
1. Execute "Retrieve Feed Items" command with above data.
2. System fetches feed data from cache.
3. System validates cache age.
4. System creates feed items from cached data.
5. System delivers feed items.

#### Expired Cache Course (Sad Path)
1. System delivers no feed items.

#### Empty Cache Course (Sad Path)
1. System delivers no feed items.

### Save feed Items Use Case
#### Data:
* Feed items

#### Primary Course (Happy Path)
1. Execute "Save Feed Items" command with above data.
2. System encodes feed items.
3. System timestamps the new cache.
4. System replaces the cache with new data.
5. System delivers success message.

### Flow Chart

![Image of FlowChart](https://github.com/devessentials20/essential-feed-case-study/blob/master/EssentialFeedApp%20-%20FlowChart.png)

### Architecture
![Image of Architecture](https://github.com/devessentials20/essential-feed-case-study/blob/master/DependencyDiagram_Composition.png)

## Model Specs

### Feed Item










