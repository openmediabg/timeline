ActiveAdmin.register Page do
  index do
    selectable_column
    id_column
    column :slug
    column :title
    column :published
    column :updated_at
    default_actions
  end

  form do |f|
    f.inputs do
      f.input :slug, hint: t('admin.pages.slug_hints')
      f.input :title
      f.input :content, hint: t('admin.formatting_hints')
      f.input :published
    end
    f.actions
  end

  show do |resource|
    panel I18n.t('texts.details') do
      attributes_table_for resource do
        row :id
        row :slug
        row :title
        row :content do
          markup resource.content
        end
        row :published
        row :created_at
        row :updated_at
      end
    end
    active_admin_comments
  end
end
