# frozen_string_literal: true

require "byebug"

module Monday
  module Resources
    # Represents Monday.com's column resource.
    module Column
      DEFAULT_SELECT = %w[id title description].freeze

      # Retrieves all the columns for the boards.
      #
      # Allows users to filter columns using the args option.
      # Users can also select the fields they want to retrieve using the select option.
      # By default, ID, title and description fields are retrieved.
      def columns(args: {}, select: DEFAULT_SELECT)
        query = "query { boards(#{Util.format_args(args)}) { columns {#{Util.format_select(select)}}}}"

        make_request(query)
      end

      # Retrieves metadata about one or a collection of columns.
      #
      # Can pass board ids or item ids to filter column values
      # Users can also select the fields they want to retrieve using the select option.
      # By default, ID, title and description fields are retrieved.
      def column_values(board_ids = [], item_ids = [], select: DEFAULT_SELECT)
        board_args = board_ids.empty? ? "" : "ids: #{board_ids}"
        item_args = item_ids.empty? ? "" : "ids: #{item_ids}"
        query = "query { boards (#{board_args}) { items (#{item_args}) " \
                "{ column_values {#{Util.format_select(select)}}}}}"

        make_request(query)
      end

      # Creates a new column.
      #
      # Allows customizing the column creation using the args option.
      # Allows customizing the values to retrieve using the select option.
      # By default, ID, title and description fields are retrieved.
      def create_column(args: {}, select: DEFAULT_SELECT)
        query = "mutation { create_column(#{Util.format_args(args)}) {#{Util.format_select(select)}}}"

        make_request(query)
      end

      # Updates the column title.
      #
      # Allows customizing the update using the args option.
      # Allows customizing the values to retrieve using the select option.
      # By default, ID, title and description fields are retrieved.
      def change_column_title(args: {}, select: DEFAULT_SELECT)
        query = "mutation { change_column_title(#{Util.format_args(args)}) {#{Util.format_select(select)}}}"

        make_request(query)
      end

      # Updates the column metadata.
      #
      # Allows customizing the update using the args option.
      # Allows customizing the values to retrieve using the select option.
      # By default, ID, title and description fields are retrieved.
      def change_column_metadata(args: {}, select: DEFAULT_SELECT)
        query = "mutation { change_column_metadata(#{Util.format_args(args)}) {#{Util.format_select(select)}}}"

        make_request(query)
      end

      # Updates the value of a column for a given item.
      #
      # Allows customizing the update using the args option.
      # Allows customizing the item values to retrieve using the select option.
      # By default, ID, and name fields are retrieved.
      def change_column_value(args: {}, select: %w[id name])
        query = "mutation { change_column_value(#{Util.format_args(args)}) {#{Util.format_select(select)}}}"

        make_request(query)
      end

      # Updates the value of a column for a given item.
      #
      # Allows customizing the update using the args option.
      # Allows customizing the item values to retrieve using the select option.
      # By default, ID, and name fields are retrieved.
      def change_simple_column_value(args: {}, select: %w[id name])
        query = "mutation { change_simple_column_value(#{Util.format_args(args)}) {#{Util.format_select(select)}}}"

        make_request(query)
      end

      # Updates the value of a column for a given item.
      #
      # Allows customizing the update using the args option.
      # Allows customizing the item values to retrieve using the select option.
      # By default, ID, and name fields are retrieved.
      def change_multiple_column_value(args: {}, select: %w[id name])
        query = "mutation { change_multiple_column_values(#{Util.format_args(args)}) {#{Util.format_select(select)}}}"

        make_request(query)
      end

      # Deletes a column.
      #
      # Requires board_id and column_id to delete.
      # Allows customizing the values to retrieve using the select option.
      # By default, ID, title and description fields are retrieved.
      def delete_column(board_id, column_id, select: DEFAULT_SELECT)
        query = "mutation { delete_column(board_id: #{board_id}, column_id: #{column_id}) " \
                "{#{Util.format_select(select)}}}"

        make_request(query)
      end
    end
  end
end