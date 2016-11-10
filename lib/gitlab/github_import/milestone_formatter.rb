module Gitlab
  module GithubImport
    class MilestoneFormatter < BaseFormatter
      def attributes
        {
          iid: raw_data.number,
          project: project,
          title: raw_data.title,
          description: raw_data.description,
          due_date: raw_data.due_on,
          state: state,
          created_at: raw_data.created_at,
          updated_at: raw_data.updated_at
        }
      end

      def project_association
        :milestones
      end

      def find_condition
        { iid: raw_data.number }
      end

      private

      def state
        raw_data.state == 'closed' ? 'closed' : 'active'
      end
    end
  end
end
