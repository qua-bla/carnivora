---
name: _machine_priviledged
description: |
 Checks if a currently connected machine is priviledged to obtain data for
 a certain service for a certain domain name.

 .. warning::
    The parameter ``p_domain`` must be a domain, which means an entry in
    the column dns.service.domain. It must not be confused with a
    ``service_entity_name``.

returns: boolean

parameters:
 -
  name: p_service
  type: commons.t_key
 -
  name: p_domain
  type: dns.t_hostname
---

RETURN COALESCE(
    (
    SELECT TRUE FROM system.service_entity_machine AS t
        JOIN dns.service AS s
        ON
            s.service = p_service AND
            s.domain = p_domain

        WHERE
            t.service = p_service AND
            t.service_entity_name = s.service_entity_name AND
            t.machine_name = backend._login_machine()
    )
, FALSE);
