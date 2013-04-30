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
end
