ActiveAdmin.register Media do
  index do
    selectable_column
    id_column
    column :name
    column :description do |row|
      row.description.truncate 30
    end
    column :year_created
    column :year_closed
    column :current_owner, sortable: :current_owner_id
    default_actions
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :description, hint: t('admin.formatting_hints')
      f.input :year_created
      f.input :year_closed
      f.input :current_owner
    end
    f.actions
  end

  show do |resource|
    panel I18n.t('texts.details') do
      attributes_table_for resource do
        row :id
        row :name
        row :description do
          markup resource.description
        end
        row :year_created
        row :year_closed
        row :current_owner
        row :created_at
        row :updated_at
      end
    end
    active_admin_comments
  end
end
