templates:
 - user.userlogin

name: sel_mailbox
description: List all mailboxes


returns: TABLE
returns_columns:
 -
  name: domain
  type: dns.t_domain
 -
  name: localpart
  type: email.t_localpart
 -
  name: owner
  type: user.t_user
 -
  name: quota
  type: int
 -
  name: backend_job
  type: varchar(20)

body: |
 RETURN QUERY
  SELECT
   t.domain, 
   t.localpart, 
   t.owner, 
   t.quota, 
   t.backend_job
  FROM
   email.mailbox AS t
  WHERE
   t.owner = v_owner;