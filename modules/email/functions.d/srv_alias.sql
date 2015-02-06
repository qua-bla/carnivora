name: srv_alias
description: List all mail aliases for machine

templates:
 - backend.backend

returns: TABLE
returns_columns:
 -
  name: alias_local_part
  type: email.t_local_part
 -
  name: alias_domain
  type: dns.t_domain
 -
  name: account_local_part
  type: email.t_local_part
 -
  name: account_domain
  type: dns.t_domain

body: |
 RETURN QUERY
    SELECT
        email.alias.local_part, 
        email.alias.domain, 
        email.alias.account_local_part, 
        email.alias.account_domain
    FROM email.alias

        JOIN dns.service USING (domain, service)
        JOIN system.service_machine USING (service, service_name)
        
    WHERE system.service_machine.machine_name = v_machine;
