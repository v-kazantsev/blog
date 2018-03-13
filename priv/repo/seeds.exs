## Формат: <Название приложения>.Repo -> <Название приложения>.<Контекст>.<Название модуля> ##
alias Blog.Repo
Repo.delete_all(Blog.Publications.Blog)
for i <- 1..10 do
  Repo.insert!(%Blog.Publications.Blog{
  title: "Title #{i}",
  subtitle: "Subtitle #{i}",
  source: "http://somesource.com/#{i}",
  category: "Ruby on Rails",
  status: 1,
  body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. In a enim leo. Pellentesque sed velit cursus, porttitor sapien et, fermentum arcu. Vivamus vehicula nibh sodales aliquet imperdiet. Maecenas ut justo libero. Morbi vitae velit et urna laoreet semper. Maecenas ullamcorper, elit ullamcorper tristique imperdiet, odio mauris accumsan ligula, ut faucibus turpis eros vitae diam. Integer luctus eros eu odio sodales, non viverra justo congue. Etiam vel consectetur massa. In eu facilisis purus.
  Maecenas sit amet feugiat arcu, sed suscipit elit. Vivamus eros ligula, viverra sagittis dictum sed, auctor nec nulla. Nam porta nisi vitae diam efficitur, eu aliquam massa aliquet. Duis a lorem commodo augue auctor placerat non elementum purus. In quis porttitor odio. Integer ullamcorper, risus ut feugiat tempor, mauris turpis efficitur nunc, nec elementum massa massa gravida nulla. Donec non convallis ante, sit amet imperdiet justo. Cras id consequat quam, tincidunt posuere augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nullam eu justo odio. Morbi scelerisque tortor et massa auctor maximus sagittis a nibh. Phasellus sit amet scelerisque lorem. Etiam id rutrum diam. Sed tempor felis eu quam varius condimentum. Fusce condimentum quam vitae est malesuada, ac euismod tellus cursus. Ut ut lorem fringilla, maximus ligula vel, fermentum risus."
      })
end
