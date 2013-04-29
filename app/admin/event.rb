ActiveAdmin.register Event do
  index do
    selectable_column
    id_column
    column :category
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
      f.input :title
      f.input :start_date, start_year: 1980, end_year: Date.current.year
      f.input :end_date, start_year: 1980, end_year: Date.current.year
      f.input :description
      f.input :published
      f.input :priority
    end
    f.actions
  end
end
