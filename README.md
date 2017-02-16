# UITableView with Dropdown cell (like in Tweetbot)

This is an example application which shows how to do dropdown menu in `UITableViewCell` like it is
done in Tweetbot. Written in `Swift`.

## Goals

* When a user taps on cell, additional view in `UITableViewCell` containing buttons unfolds with animation under the cell. When a
user taps it again, or taps on another cell - current cell should fold and new one unfolds.
* When a user has selected the cell and scroll the
table - the selected cell should be persisted
and correctly redrawed when user will scroll back to it.
* When a user unfolds a cell's dropdown menu and there are not enough space on the screen to fit it - the view
should scroll to fit the entire cell with unfolded menu.

## Technical Goals
* Autolayout
* As little as possible count of bicycles in the code :)

## Result

![](http://ribachenko.com/content/images/2017/02/complete.gif)

## Read more

[Link to the article in my blog](http://ribachenko.com/creating-dropdown-menu-like-in-tweetbot/)
