#[ "$USER_ENVIRONMENT_CONFIGURED" = "" ] && systemctl --user import-environment $(env | cut -d= -f1 | tr '\n' ' ')
#USER_ENVIRONMENT_CONFIGURED=true

