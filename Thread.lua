local Thread = {
    Timing = 500,
    Actual = nil,
}
ThreadAdded = {}

function newThread(restriction, handler, onLeave)
    table.insert(ThreadAdded, {restriction = restriction, handler = handler, onLeave = (onLeave or nil)})
end

Citizen.CreateThread( function()
    while true do
        Wait(Thread.Timing)

        for i = 1 , #ThreadAdded do
            if ThreadAdded[i].restriction() then
                Thread.Timing = 0
                Thread.Actual = ThreadAdded[i]
                Citizen.CreateThread(ThreadAdded[i].handler)
            end
        end
        
        if Thread.Actual then
            if not Thread.Actual.restriction() then
                if Thread.Actual.onLeave then
                    Citizen.CreateThread(Thread.Actual.onLeave)
                end
                Thread.Timing = 500
                Thread.Actual = nil
            end
        end
    end
end)