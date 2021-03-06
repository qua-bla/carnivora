---
name: ins_user
description: ins user

templates:
 - user.userlogin

returns: void

parameters:
 -
  name: p_user
  type: server_access.t_user
 -
  name: p_service_entity_name
  type: dns.t_hostname
 -
  name: p_subservice
  type: commons.t_key
 -
  name: p_password
  type: commons.t_password_plaintext
  default: "NULL"

variables:
 -
  name: v_password
  type: commons.t_password
---

IF p_password IS NULL THEN
    v_password := NULL;
ELSE
    v_password := commons._hash_password(p_password);
END IF;

INSERT INTO server_access.user
    (service, subservice, service_entity_name, "user", password, owner)
VALUES
    ('server_access', p_subservice, p_service_entity_name, p_user, v_password, v_owner);

PERFORM backend._notify_service_entity_name(p_service_entity_name, 'server_access', p_subservice);
