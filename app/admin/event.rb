ActiveAdmin.register Event do
  index do
    selectable_column
    id_column
    column :category
    column :media_types do |resource|
      resource.media_types.map { |media_type| auto_link media_type }.to_sentence.html_safe
    end
    column :title
    column :start_date
    column :end_date
    column :published
    column :priority
    default_actions
  end

  form do |f|
    f.inputs do
      f.input :category
      f.input :media_types, as: :check_boxes
      f.input :title
      f.input :start_date, start_year: 1980, end_year: Date.current.year
      f.input :end_date, start_year: 1980, end_year: Date.current.year, hint: t('admin.events.end_date_hints')
      f.input :description, hint: t('admin.formatting_hints')
      f.input :published
      f.input :priority
      f.input :media, as: :check_boxes
      f.input :people, as: :check_boxes
    end
    f.actions
  end

  show do |resource|
    panel I18n.t('texts.details') do
      attributes_table_for resource do
        row :id
        row :category
        row :media_types do
          resource.media_types.map { |media_type| auto_link media_type }.to_sentence.html_safe
        end
        row :title
        row :start_date
        row :end_date
        row :description do
          markup resource.description
        end
        row :media do
          resource.media.map { |media| auto_link media }.to_sentence.html_safe
        end
        row :people do
          resource.people.map { |event| auto_link event }.to_sentence.html_safe
        end
        row :published
        row :priority
        row :created_at
        row :updated_at
      end
    end
    active_admin_comments
  end
end
