defmodule MicroblogWeb.PageControllerTest do
  use MicroblogWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get conn, "/"
    assert '<html><body>You are being <a href="/posts">redirected</a>.</body></html>'

  end
end
