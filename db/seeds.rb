if Organization.count.zero?
  tomify = Organization.create(
    name: "Tomify",
    website: "https://www.tomify.me"
  )
end

if User.count.zero?
  tomify ||= Organization.find_by(name: "Tomify")
  User.create(
    organization_id: tomify.id,
    admin: true,
    email: "tprats108@gmail.com",
    first_name: "Tom",
    last_name: "Prats",
    password: "password"
  )
end

if Page.count.zero?
  Page.create(
    root: true,
    active: true,
    rank: 10,
    path: "home",
    name: "Home"
  )
end
