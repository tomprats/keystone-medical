if Organization.count.zero?
  tomify = Organization.create(
    path: "tomify",
    name: "Tomify",
    kind: "None",
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
    active: true,
    path: "home",
    name: "Home"
  )
end
