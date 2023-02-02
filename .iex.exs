width = 80

IEx.configure(
  history_size: 200,
  width: width,
  inspect: [
    pretty: true,
    limit: :infinity,
    width: width,
    structs: true
  ]
)

import_if_available Ecto.Query
