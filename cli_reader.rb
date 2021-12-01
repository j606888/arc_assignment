class CLI_READER
    VALID_ACTIONS = ['new', 'move', 'todo', 'wip', 'done']

    def initialize(argv)
        @argv = argv
    end

    def call
        kanban = Kanban.new
        action = @argv[0]

        raise "Unkown action #{action}, only allow #{VALID_ACTIONS}" unless VALID_ACTIONS.include?(action)

        case action
        when 'new'
            item = @argv[1]
            raise "Should provide a item" if item.nil?

            kanban.add_item(item)
        when 'move'
            item_id = @argv[1]
            raise "Should provide a item_id" if item_id.nil?
            new_status = @argv[3]
            raise "Should provide a new_status" if new_status.nil?

            kanban.move(item_id, new_status)
        else
            kanban.list(action)
        end
    end
end

