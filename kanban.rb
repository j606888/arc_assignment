class Kanban
    VALID_NEXT_STATUS = {
        'todo' => 'wip',
        'wip' => 'done'
    }

    def initialize(file_path='items.json')
        @file_path = file_path
    end

    def add_item(name)
        item = {
            id: new_id,
            name: name,
            status: 'todo',
            join_at: Time.now.to_i
        }

        items << item
        save_it
    end

    def move(id, new_status)
        target = items.find { |item| item[:id] == id.to_i }
        raise "Item with id:#{id} not exist" if target.nil?
        raise "New status invalid" unless new_status_valid?(target, new_status)
        target[:status] = new_status
        target[:join_at] = Time.now.to_i
        save_it
    end

    def list(status)
        filter_items = items.filter { |item| item[:status] == status }
        puts filter_items.sort_by {|obj| obj[:join_at]}
    end

    private
    def items
        return @items if @items

        if File.exist?(@file_path)
            @items = JSON.parse(File.read(@file_path), symbolize_names: true)
        else
            File.new(@file_path, 'w')
            @items = []
        end
    end

    def new_status_valid?(item, new_status)
        current_status = item[:status]
        return VALID_NEXT_STATUS[current_status] == new_status
    end

    def new_id
        return 0 if items.empty?
        items.last[:id] + 1
    end

    def save_it
        File.open(@file_path, 'w') do |file|
            file.write(items.to_json)
        end
    end
end