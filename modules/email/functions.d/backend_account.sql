name: backend_account
description: List all mail accounts for machine

templates:
 - backend.backend

return: TABLE
return_columns:
 -
  name: local_part
  type: email.local_part
 -
  name: domain
  type: dns.domain_name

body: |
 RETURN QUERY
    SELECT email.account.local_part, email.account.domain FROM email.account
        JOIN dns.service USING (domain, service)
        JOIN system.service_machine USING (service, service_name)
        
        WHERE system.service_machine.machine_name = v_machine;
