# ThreadHandler

ThreadHandler is a resource for optimising these thread by grouping them into one resource.

## Dependencies

ThreadHandler don't need any resources to work.

## How to use

Using this resource is simple :
  - Drag the resource into your `resources` folder.
  - `ensure ThreadHandler` after `ensure ZonesHandler` in your `server.cfg`.
  - To create a new thread you need to use this function *client-side* :
  ```lua
  exports.ThreadHandler:newThread(
    function() -- Thread's restriction
    end, 
    function() -- Thread's actions if Thread's restrictions is good
    end, 
    function() -- Thread's action when you leave the thread (Optional)
    end,
  )
  ```
## Support
For any support request please join this discord : <a target="_blank" href="https://discord.gg/3ny5GRk7nD">Click here</a>
