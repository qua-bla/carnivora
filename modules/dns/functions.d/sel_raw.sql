name: sel_custom
description: sel custom

templates:
 - user.userlogin

returns: TABLE
returns_columns:
 -
  name: id
  type: uuid
 -
  name: registered
  type: dns.t_domain
 -
  name: domain
  type: dns.t_domain
 -
  name: type
  type: dns.t_type
 -
  name: rdata
  type: dns.t_rdata
 -
  name: backend_status
  type: backend.t_status

body: |
    RETURN QUERY
        SELECT
            t.id,
            t.registered,
            t.domain,
            t.type,
            t.rdata,
            t.backend_status
        FROM dns.custom AS t
        JOIN dns.registered AS s
            ON s.domain = t.registered
        WHERE
            s.owner = v_owner;