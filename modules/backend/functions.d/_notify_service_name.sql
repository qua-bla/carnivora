name: _notify_service_name
description: |
 Informs all machines about changes.

 WARNING: The parameter p_service_name must be a servcie name. It must not be
 confused with a domain.

parameters:
 -
  name: p_service
  type: system.t_service
 -
  name: p_service_name
  type: dns.t_domain

returns: void

body: |
    PERFORM
        backend._notify(machine_name, p_service, p_service_name)

    FROM system.service_machine AS t
        WHERE
            t.service = p_service AND
            t.service_name = p_service_name
    ;