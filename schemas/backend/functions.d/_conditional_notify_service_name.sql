---
name: _conditional_notify_service_entity_name
description: Notifies if first argument is true. Throws inaccessible otherwise.

returns: void

parameters:
 -
  name: p_condition
  type: boolean
 -
  name: p_service_entity_name
  type: dns.t_hostname
 -
  name: p_service
  type: commons.t_key
 -
  name: p_subservice
  type: commons.t_key
---

IF p_condition THEN
    PERFORM backend._notify_service_entity_name(p_service_entity_name, p_service, p_subservice);
ELSE
    PERFORM commons._raise_inaccessible_or_missing();
END IF;
