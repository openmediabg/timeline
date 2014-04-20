ActiveAdmin.register Person do
  index do
    selectable_column
    id_column
    column :name
    column :description do |row|
      row.description.truncate 50
    end
    column :updated_at
    default_actions
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :description, hint: t('admin.formatting_hints')
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
        row :created_at
        row :updated_at
      end
    end
    active_admin_comments
  end
end
