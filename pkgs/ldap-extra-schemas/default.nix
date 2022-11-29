{
  stdenv,
  pkgs,
  ...
}:
stdenv.mkDerivation rec {
  name = "ldap-extra-schemas";

  src = ./.;
  kerberos = pkgs.writeText "kerberos.ldif" ''
    dn: cn=kerberos,cn=schema,cn=config
    objectClass: olcSchemaConfig
    cn: kerberos
    # Novell Kerberos Schema Definitions
    # Novell Inc.
    # 1800 South Novell Place
    # Provo, UT 84606
    #
    # VeRsIoN=1.0
    # CoPyRiGhT=(c) Copyright 2006, Novell, Inc.  All rights reserved
    #
    # OIDs:
    #    joint-iso-ccitt(2)
    #      country(16)
    #        us(840)
    #          organization(1)
    #            Novell(113719)
    #              applications(1)
    #                kerberos(301)
    #                 Kerberos Attribute Type(4) attr# version#
    #                    specific attribute definitions
    #                 Kerberos Attribute Syntax(5)
    #                    specific syntax definitions
    #                 Kerberos Object Class(6) class# version#
    #                    specific class definitions
    #
    #    iso(1)
    #      member-body(2)
    #        United States(840)
    #          mit (113554)
    #            infosys(1)
    #              ldap(4)
    #                attributeTypes(1)
    #                  Kerberos(6)
    ########################################################################
    ########################################################################
    #                     Attribute Type Definitions                       #
    ########################################################################
    ##### This is the principal name in the RFC 1964 specified format
    olcAttributeTypes: ( 2.16.840.1.113719.1.301.4.1.1
      NAME 'krbPrincipalName'
      EQUALITY caseExactIA5Match
      SUBSTR caseExactSubstringsMatch
      SYNTAX 1.3.6.1.4.1.1466.115.121.1.26)
    ##### If there are multiple krbPrincipalName values for an entry, this
    ##### is the canonical principal name in the RFC 1964 specified
    ##### format.  (If this attribute does not exist, then all
    ##### krbPrincipalName values are treated as canonical.)
    olcAttributeTypes: ( 1.2.840.113554.1.4.1.6.1
      NAME 'krbCanonicalName'
      EQUALITY caseExactIA5Match
      SUBSTR caseExactSubstringsMatch
      SYNTAX 1.3.6.1.4.1.1466.115.121.1.26
      SINGLE-VALUE)
    ##### This specifies the type of the principal, the types could be any of
    ##### the types mentioned in section 6.2 of RFC 4120
    olcAttributeTypes: ( 2.16.840.1.113719.1.301.4.3.1
      NAME 'krbPrincipalType'
      EQUALITY integerMatch
      SYNTAX 1.3.6.1.4.1.1466.115.121.1.27
      SINGLE-VALUE)
    ##### This flag is used to find whether directory User Password has to be used
    ##### as kerberos password.
    ##### TRUE, if User Password is to be used as the kerberos password.
    ##### FALSE, if User Password and the kerberos password are different.
    olcAttributeTypes: ( 2.16.840.1.113719.1.301.4.5.1
      NAME 'krbUPEnabled'
      DESC 'Boolean'
      SYNTAX 1.3.6.1.4.1.1466.115.121.1.7
      SINGLE-VALUE)
    ##### The time at which the principal expires
    olcAttributeTypes: ( 2.16.840.1.113719.1.301.4.6.1
      NAME 'krbPrincipalExpiration'
      EQUALITY generalizedTimeMatch
      SYNTAX 1.3.6.1.4.1.1466.115.121.1.24
      SINGLE-VALUE)
    ##### The krbTicketFlags attribute holds information about the kerberos flags for a principal
    ##### The values (0x00000001 - 0x00800000) are reserved for standards and
    ##### values (0x01000000 - 0x80000000) can be used for proprietary extensions.
    ##### The flags and values as per RFC 4120 and MIT implementation are,
    ##### DISALLOW_POSTDATED        0x00000001
    ##### DISALLOW_FORWARDABLE      0x00000002
    ##### DISALLOW_TGT_BASED        0x00000004
    ##### DISALLOW_RENEWABLE        0x00000008
    ##### DISALLOW_PROXIABLE        0x00000010
    ##### DISALLOW_DUP_SKEY         0x00000020
    ##### DISALLOW_ALL_TIX          0x00000040
    ##### REQUIRES_PRE_AUTH         0x00000080
    ##### REQUIRES_HW_AUTH          0x00000100
    ##### REQUIRES_PWCHANGE         0x00000200
    ##### DISALLOW_SVR              0x00001000
    ##### PWCHANGE_SERVICE          0x00002000
    olcAttributeTypes: ( 2.16.840.1.113719.1.301.4.8.1
      NAME 'krbTicketFlags'
      EQUALITY integerMatch
      SYNTAX 1.3.6.1.4.1.1466.115.121.1.27
      SINGLE-VALUE)
    ##### The maximum ticket lifetime for a principal in seconds
    olcAttributeTypes: ( 2.16.840.1.113719.1.301.4.9.1
      NAME 'krbMaxTicketLife'
      EQUALITY integerMatch
      SYNTAX 1.3.6.1.4.1.1466.115.121.1.27
      SINGLE-VALUE)
    ##### Maximum renewable lifetime for a principal's ticket in seconds
    olcAttributeTypes: ( 2.16.840.1.113719.1.301.4.10.1
      NAME 'krbMaxRenewableAge'
      EQUALITY integerMatch
      SYNTAX 1.3.6.1.4.1.1466.115.121.1.27
      SINGLE-VALUE)
    ##### Forward reference to the Realm object.
    ##### (FDN of the krbRealmContainer object).
    ##### Example:   cn=ACME.COM, cn=Kerberos, cn=Security
    olcAttributeTypes: ( 2.16.840.1.113719.1.301.4.14.1
      NAME 'krbRealmReferences'
      EQUALITY distinguishedNameMatch
      SYNTAX 1.3.6.1.4.1.1466.115.121.1.12)
    ##### List of LDAP servers that kerberos servers can contact.
    ##### The attribute holds data in the ldap uri format,
    ##### Examples: acme.com#636, 164.164.164.164#1636, ldaps://acme.com:636
    #####
    ##### The values of this attribute need to be updated, when
    ##### the LDAP servers listed here are renamed, moved or deleted.
    olcAttributeTypes: ( 2.16.840.1.113719.1.301.4.15.1
      NAME 'krbLdapServers'
      EQUALITY caseIgnoreMatch
      SYNTAX 1.3.6.1.4.1.1466.115.121.1.15)
    ##### A set of forward references to the KDC Service objects.
    ##### (FDNs of the krbKdcService objects).
    ##### Example:   cn=kdc - server 1, ou=uvw, o=xyz
    olcAttributeTypes: ( 2.16.840.1.113719.1.301.4.17.1
      NAME 'krbKdcServers'
      EQUALITY distinguishedNameMatch
      SYNTAX 1.3.6.1.4.1.1466.115.121.1.12)
    ##### A set of forward references to the Password Service objects.
    ##### (FDNs of the krbPwdService objects).
    ##### Example:   cn=kpasswdd - server 1, ou=uvw, o=xyz
    olcAttributeTypes: ( 2.16.840.1.113719.1.301.4.18.1
      NAME 'krbPwdServers'
      EQUALITY distinguishedNameMatch
      SYNTAX 1.3.6.1.4.1.1466.115.121.1.12)
    ##### This attribute holds the Host Name or the ip address,
    ##### transport protocol and ports of the kerberos service host
    ##### The format is host_name-or-ip_address#protocol#port
    ##### Protocol can be 0 or 1. 0 is for UDP. 1 is for TCP.
    olcAttributeTypes: ( 2.16.840.1.113719.1.301.4.24.1
      NAME 'krbHostServer'
      EQUALITY caseExactIA5Match
      SYNTAX 1.3.6.1.4.1.1466.115.121.1.26)
    ##### This attribute holds the scope for searching the principals
    ##### under krbSubTree attribute of krbRealmContainer
    ##### The value can either be 1 (ONE) or 2 (SUB_TREE).
    olcAttributeTypes: ( 2.16.840.1.113719.1.301.4.25.1
      NAME 'krbSearchScope'
      EQUALITY integerMatch
      SYNTAX 1.3.6.1.4.1.1466.115.121.1.27
      SINGLE-VALUE)
    ##### FDNs pointing to Kerberos principals
    olcAttributeTypes: ( 2.16.840.1.113719.1.301.4.26.1
      NAME 'krbPrincipalReferences'
      EQUALITY distinguishedNameMatch
      SYNTAX 1.3.6.1.4.1.1466.115.121.1.12)
    ##### This attribute specifies which attribute of the user objects
    ##### be used as the principal name component for Kerberos.
    ##### The allowed values are cn, sn, uid, givenname, fullname.
    olcAttributeTypes: ( 2.16.840.1.113719.1.301.4.28.1
      NAME 'krbPrincNamingAttr'
      EQUALITY caseIgnoreMatch
      SYNTAX 1.3.6.1.4.1.1466.115.121.1.15
      SINGLE-VALUE)
    ##### A set of forward references to the Administration Service objects.
    ##### (FDNs of the krbAdmService objects).
    ##### Example:   cn=kadmindd - server 1, ou=uvw, o=xyz
    olcAttributeTypes: ( 2.16.840.1.113719.1.301.4.29.1
      NAME 'krbAdmServers'
      EQUALITY distinguishedNameMatch
      SYNTAX 1.3.6.1.4.1.1466.115.121.1.12)
    ##### Maximum lifetime of a principal's password
    olcAttributeTypes: ( 2.16.840.1.113719.1.301.4.30.1
      NAME 'krbMaxPwdLife'
      EQUALITY integerMatch
      SYNTAX 1.3.6.1.4.1.1466.115.121.1.27
      SINGLE-VALUE)
    ##### Minimum lifetime of a principal's password
    olcAttributeTypes: ( 2.16.840.1.113719.1.301.4.31.1
      NAME 'krbMinPwdLife'
      EQUALITY integerMatch
      SYNTAX 1.3.6.1.4.1.1466.115.121.1.27
      SINGLE-VALUE)
    ##### Minimum number of character clases allowed in a password
    olcAttributeTypes: ( 2.16.840.1.113719.1.301.4.32.1
      NAME 'krbPwdMinDiffChars'
      EQUALITY integerMatch
      SYNTAX 1.3.6.1.4.1.1466.115.121.1.27
      SINGLE-VALUE)
    ##### Minimum length of the password
    olcAttributeTypes: ( 2.16.840.1.113719.1.301.4.33.1
      NAME 'krbPwdMinLength'
      EQUALITY integerMatch
      SYNTAX 1.3.6.1.4.1.1466.115.121.1.27
      SINGLE-VALUE)
    ##### Number of previous versions of passwords that are stored
    olcAttributeTypes: ( 2.16.840.1.113719.1.301.4.34.1
      NAME 'krbPwdHistoryLength'
      EQUALITY integerMatch
      SYNTAX 1.3.6.1.4.1.1466.115.121.1.27
      SINGLE-VALUE)
    ##### Number of consecutive pre-authentication failures before lockout
    olcAttributeTypes: ( 1.3.6.1.4.1.5322.21.2.1
      NAME 'krbPwdMaxFailure'
      EQUALITY integerMatch
      SYNTAX 1.3.6.1.4.1.1466.115.121.1.27
      SINGLE-VALUE)
    ##### Period after which bad preauthentication count will be reset
    olcAttributeTypes: ( 1.3.6.1.4.1.5322.21.2.2
      NAME 'krbPwdFailureCountInterval'
      EQUALITY integerMatch
      SYNTAX 1.3.6.1.4.1.1466.115.121.1.27
      SINGLE-VALUE)
    ##### Period in which lockout is enforced
    olcAttributeTypes: ( 1.3.6.1.4.1.5322.21.2.3
      NAME 'krbPwdLockoutDuration'
      EQUALITY integerMatch
      SYNTAX 1.3.6.1.4.1.1466.115.121.1.27
      SINGLE-VALUE)
    ##### Policy attribute flags
    olcAttributeTypes: ( 1.2.840.113554.1.4.1.6.2
      NAME 'krbPwdAttributes'
      EQUALITY integerMatch
      SYNTAX 1.3.6.1.4.1.1466.115.121.1.27
      SINGLE-VALUE)
    ##### Policy maximum ticket lifetime
    olcAttributeTypes: ( 1.2.840.113554.1.4.1.6.3
      NAME 'krbPwdMaxLife'
      EQUALITY integerMatch
      SYNTAX 1.3.6.1.4.1.1466.115.121.1.27
      SINGLE-VALUE)
    ##### Policy maximum ticket renewable lifetime
    olcAttributeTypes: ( 1.2.840.113554.1.4.1.6.4
      NAME 'krbPwdMaxRenewableLife'
      EQUALITY integerMatch
      SYNTAX 1.3.6.1.4.1.1466.115.121.1.27
      SINGLE-VALUE)
    ##### Allowed enctype:salttype combinations for key changes
    olcAttributeTypes: ( 1.2.840.113554.1.4.1.6.5
      NAME 'krbPwdAllowedKeysalts'
      EQUALITY caseIgnoreIA5Match
      SYNTAX 1.3.6.1.4.1.1466.115.121.1.26
      SINGLE-VALUE)
    ##### FDN pointing to a Kerberos Password Policy object
    olcAttributeTypes: ( 2.16.840.1.113719.1.301.4.36.1
      NAME 'krbPwdPolicyReference'
      EQUALITY distinguishedNameMatch
      SYNTAX 1.3.6.1.4.1.1466.115.121.1.12
      SINGLE-VALUE)
    ##### The time at which the principal's password expires
    olcAttributeTypes: ( 2.16.840.1.113719.1.301.4.37.1
      NAME 'krbPasswordExpiration'
      EQUALITY generalizedTimeMatch
      SYNTAX 1.3.6.1.4.1.1466.115.121.1.24
      SINGLE-VALUE)
    ##### This attribute holds the principal's key (krbPrincipalKey) that is encrypted with
    ##### the master key (krbMKey).
    ##### The attribute is ASN.1 encoded.
    #####
    ##### The format of the value for this attribute is explained below,
    ##### KrbKeySet ::= SEQUENCE {
    ##### attribute-major-vno       [0] UInt16,
    ##### attribute-minor-vno       [1] UInt16,
    ##### kvno                      [2] UInt32,
    ##### mkvno                     [3] UInt32 OPTIONAL,
    ##### keys                      [4] SEQUENCE OF KrbKey,
    ##### ...
    ##### }
    #####
    ##### KrbKey ::= SEQUENCE {
    ##### salt      [0] KrbSalt OPTIONAL,
    ##### key       [1] EncryptionKey,
    ##### s2kparams [2] OCTET STRING OPTIONAL,
    ##### ...
    ##### }
    #####
    ##### KrbSalt ::= SEQUENCE {
    ##### type      [0] Int32,
    ##### salt      [1] OCTET STRING OPTIONAL
    ##### }
    #####
    ##### EncryptionKey ::= SEQUENCE {
    ##### keytype   [0] Int32,
    ##### keyvalue  [1] OCTET STRING
    ##### }
    olcAttributeTypes: ( 2.16.840.1.113719.1.301.4.39.1
      NAME 'krbPrincipalKey'
      EQUALITY octetStringMatch
      SYNTAX 1.3.6.1.4.1.1466.115.121.1.40)
    ##### FDN pointing to a Kerberos Ticket Policy object.
    olcAttributeTypes: ( 2.16.840.1.113719.1.301.4.40.1
      NAME 'krbTicketPolicyReference'
      EQUALITY distinguishedNameMatch
      SYNTAX 1.3.6.1.4.1.1466.115.121.1.12
      SINGLE-VALUE)
    ##### Forward reference to an entry that starts sub-trees
    ##### where principals and other kerberos objects in the realm are configured.
    ##### Example:   ou=acme, ou=pq, o=xyz
    olcAttributeTypes: ( 2.16.840.1.113719.1.301.4.41.1
      NAME 'krbSubTrees'
      EQUALITY distinguishedNameMatch
      SYNTAX 1.3.6.1.4.1.1466.115.121.1.12)
    ##### Holds the default encryption/salt type combinations of principals for
    ##### the Realm. Stores in the form of key:salt strings. This will be
    ##### subset of the supported encryption/salt types.
    ##### Example: aes256-cts-hmac-sha384-192:normal
    olcAttributeTypes: ( 2.16.840.1.113719.1.301.4.42.1
      NAME 'krbDefaultEncSaltTypes'
      EQUALITY caseIgnoreMatch
      SYNTAX 1.3.6.1.4.1.1466.115.121.1.15)
    ##### Holds the supported encryption/salt type combinations of principals for
    ##### the Realm. Stores in the form of key:salt strings.
    ##### The supported encryption types are mentioned in RFC 3961
    ##### The supported salt types are,
    ##### NORMAL
    ##### V4
    ##### NOREALM
    ##### ONLYREALM
    ##### SPECIAL
    ##### AFS3
    ##### Example: aes256-cts-hmac-sha384-192:normal
    olcAttributeTypes: ( 2.16.840.1.113719.1.301.4.43.1
      NAME 'krbSupportedEncSaltTypes'
      EQUALITY caseIgnoreMatch
      SYNTAX 1.3.6.1.4.1.1466.115.121.1.15)
    ##### This attribute holds the principal's old keys (krbPwdHistory) that is encrypted with
    ##### the kadmin/history key.
    ##### The attribute is ASN.1 encoded.
    #####
    ##### The format of the value for this attribute is explained below,
    ##### KrbKeySet ::= SEQUENCE {
    ##### attribute-major-vno       [0] UInt16,
    ##### attribute-minor-vno       [1] UInt16,
    ##### kvno                      [2] UInt32,
    ##### mkvno                     [3] UInt32 OPTIONAL -- actually kadmin/history key,
    ##### keys                      [4] SEQUENCE OF KrbKey,
    ##### ...
    ##### }
    #####
    ##### KrbKey ::= SEQUENCE {
    ##### salt      [0] KrbSalt OPTIONAL,
    ##### key       [1] EncryptionKey,
    ##### s2kparams [2] OCTET STRING OPTIONAL,
    ##### ...
    ##### }
    #####
    ##### KrbSalt ::= SEQUENCE {
    ##### type      [0] Int32,
    ##### salt      [1] OCTET STRING OPTIONAL
    ##### }
    #####
    ##### EncryptionKey ::= SEQUENCE {
    ##### keytype   [0] Int32,
    ##### keyvalue  [1] OCTET STRING
    ##### }
    olcAttributeTypes: ( 2.16.840.1.113719.1.301.4.44.1
      NAME 'krbPwdHistory'
      EQUALITY octetStringMatch
      SYNTAX 1.3.6.1.4.1.1466.115.121.1.40)
    ##### The time at which the principal's password last password change happened.
    olcAttributeTypes: ( 2.16.840.1.113719.1.301.4.45.1
      NAME 'krbLastPwdChange'
      EQUALITY generalizedTimeMatch
      SYNTAX 1.3.6.1.4.1.1466.115.121.1.24
      SINGLE-VALUE)
    ##### The time at which the principal was last administratively unlocked.
    olcAttributeTypes: ( 1.3.6.1.4.1.5322.21.2.5
      NAME 'krbLastAdminUnlock'
      EQUALITY generalizedTimeMatch
      SYNTAX 1.3.6.1.4.1.1466.115.121.1.24
      SINGLE-VALUE)
    ##### This attribute holds the kerberos master key.
    ##### This can be used to encrypt principal keys.
    ##### This attribute has to be secured in directory.
    #####
    ##### This attribute is ASN.1 encoded.
    ##### The format of the value for this attribute is explained below,
    ##### KrbMKey ::= SEQUENCE {
    ##### kvno    [0] UInt32,
    ##### key     [1] MasterKey
    ##### }
    #####
    ##### MasterKey ::= SEQUENCE {
    ##### keytype         [0] Int32,
    ##### keyvalue        [1] OCTET STRING
    ##### }
    olcAttributeTypes: ( 2.16.840.1.113719.1.301.4.46.1
      NAME 'krbMKey'
      EQUALITY octetStringMatch
      SYNTAX 1.3.6.1.4.1.1466.115.121.1.40)
    ##### This stores the alternate principal names for the principal in the RFC 1964 specified format
    olcAttributeTypes: ( 2.16.840.1.113719.1.301.4.47.1
      NAME 'krbPrincipalAliases'
      EQUALITY caseExactIA5Match
      SYNTAX 1.3.6.1.4.1.1466.115.121.1.26)
    ##### The time at which the principal's last successful authentication happened.
    olcAttributeTypes: ( 2.16.840.1.113719.1.301.4.48.1
      NAME 'krbLastSuccessfulAuth'
      EQUALITY generalizedTimeMatch
      SYNTAX 1.3.6.1.4.1.1466.115.121.1.24
      SINGLE-VALUE)
    ##### The time at which the principal's last failed authentication happened.
    olcAttributeTypes: ( 2.16.840.1.113719.1.301.4.49.1
      NAME 'krbLastFailedAuth'
      EQUALITY generalizedTimeMatch
      SYNTAX 1.3.6.1.4.1.1466.115.121.1.24
      SINGLE-VALUE)
    ##### This attribute stores the number of failed authentication attempts
    ##### happened for the principal since the last successful authentication.
    olcAttributeTypes: ( 2.16.840.1.113719.1.301.4.50.1
      NAME 'krbLoginFailedCount'
      EQUALITY integerMatch
      SYNTAX 1.3.6.1.4.1.1466.115.121.1.27
      SINGLE-VALUE)
    ##### This attribute holds the application specific data.
    olcAttributeTypes: ( 2.16.840.1.113719.1.301.4.51.1
      NAME 'krbExtraData'
      EQUALITY octetStringMatch
      SYNTAX 1.3.6.1.4.1.1466.115.121.1.40)
    ##### This attributes holds references to the set of directory objects.
    ##### This stores the DNs of the directory objects to which the
    ##### principal object belongs to.
    olcAttributeTypes: ( 2.16.840.1.113719.1.301.4.52.1
      NAME 'krbObjectReferences'
      EQUALITY distinguishedNameMatch
      SYNTAX 1.3.6.1.4.1.1466.115.121.1.12)
    ##### This attribute holds references to a Container object where
    ##### the additional principal objects and stand alone principal
    ##### objects (krbPrincipal) can be created.
    olcAttributeTypes: ( 2.16.840.1.113719.1.301.4.53.1
      NAME 'krbPrincContainerRef'
      EQUALITY distinguishedNameMatch
      SYNTAX 1.3.6.1.4.1.1466.115.121.1.12)
    ##### A list of authentication indicator strings, one of which must be satisfied
    ##### to authenticate to the principal as a service.
    ##### FreeIPA OID:
    #####  joint-iso-ccitt(3) country(16) us(840) organization(1) netscape(113730)
    #####  ldap(3) freeipa(8) krb5(15) attributes(2)
    olcAttributeTypes: ( 2.16.840.1.113730.3.8.15.2.1
      NAME 'krbPrincipalAuthInd'
      EQUALITY caseExactMatch
      SYNTAX 1.3.6.1.4.1.1466.115.121.1.15)
    ##### A list of services to which a service principal can delegate.
    olcAttributeTypes: ( 1.3.6.1.4.1.5322.21.2.4
      NAME 'krbAllowedToDelegateTo'
      EQUALITY caseExactIA5Match
      SUBSTR caseExactSubstringsMatch
      SYNTAX 1.3.6.1.4.1.1466.115.121.1.26)
    ########################################################################
    ########################################################################
    #                       Object Class Definitions                       #
    ########################################################################
    #### This is a kerberos container for all the realms in a tree.
    olcObjectClasses: ( 2.16.840.1.113719.1.301.6.1.1
      NAME 'krbContainer'
      SUP top
      STRUCTURAL
      MUST ( cn ) )
    ##### The krbRealmContainer is created per realm and holds realm specific data.
    olcObjectClasses: ( 2.16.840.1.113719.1.301.6.2.1
      NAME 'krbRealmContainer'
      SUP top
      STRUCTURAL
      MUST ( cn )
      MAY ( krbMKey $ krbUPEnabled $ krbSubTrees $ krbSearchScope $ krbLdapServers $ krbSupportedEncSaltTypes $ krbDefaultEncSaltTypes $ krbTicketPolicyReference $ krbKdcServers $ krbPwdServers $ krbAdmServers $ krbPrincNamingAttr $ krbPwdPolicyReference $ krbPrincContainerRef ) )
    ##### An instance of a class derived from krbService is created per
    ##### kerberos authentication or administration server in an realm and holds
    ##### references to the realm objects. These references is used to further read
    ##### realm specific data to service AS/TGS requests. Additionally this object
    ##### contains some server specific data like pathnames and ports that the
    ##### server uses. This is the identity the kerberos server logs in with. A key
    ##### pair for the same is created and the kerberos server logs in with the same.
    #####
    ##### krbKdcService, krbAdmService and krbPwdService derive from this class.
    olcObjectClasses: ( 2.16.840.1.113719.1.301.6.3.1
      NAME 'krbService'
      SUP top
      ABSTRACT
      MUST ( cn )
      MAY ( krbHostServer $ krbRealmReferences ) )
    ##### Representative object for the KDC server to bind into a LDAP directory
    ##### and have a connection to access Kerberos data with the required
    ##### access rights.
    olcObjectClasses: ( 2.16.840.1.113719.1.301.6.4.1
      NAME 'krbKdcService'
      SUP krbService
      STRUCTURAL )
    ##### Representative object for the Kerberos Password server to bind into a LDAP directory
    ##### and have a connection to access Kerberos data with the required
    ##### access rights.
    olcObjectClasses: ( 2.16.840.1.113719.1.301.6.5.1
      NAME 'krbPwdService'
      SUP krbService
      STRUCTURAL )
    ###### The principal data auxiliary class. Holds principal information
    ###### and is used to store principal information for Person, Service objects.
    olcObjectClasses: ( 2.16.840.1.113719.1.301.6.8.1
      NAME 'krbPrincipalAux'
      SUP top
      AUXILIARY
      MAY ( krbPrincipalName $ krbCanonicalName $ krbUPEnabled $ krbPrincipalKey $ krbTicketPolicyReference $ krbPrincipalExpiration $ krbPasswordExpiration $ krbPwdPolicyReference $ krbPrincipalType $ krbPwdHistory $ krbLastPwdChange $ krbLastAdminUnlock $ krbPrincipalAliases $ krbLastSuccessfulAuth $ krbLastFailedAuth $ krbLoginFailedCount $ krbExtraData $ krbAllowedToDelegateTo $ krbPrincipalAuthInd ) )
    ###### This class is used to create additional principals and stand alone principals.
    olcObjectClasses: ( 2.16.840.1.113719.1.301.6.9.1
      NAME 'krbPrincipal'
      SUP top
      MUST ( krbPrincipalName )
      MAY ( krbObjectReferences ) )
    ###### The principal references auxiliary class. Holds all principals referred
    ###### from a service
    olcObjectClasses: ( 2.16.840.1.113719.1.301.6.11.1
      NAME 'krbPrincRefAux'
      SUP top
      AUXILIARY
      MAY krbPrincipalReferences )
    ##### Representative object for the Kerberos Administration server to bind into a LDAP directory
    ##### and have a connection Id to access Kerberos data with the required access rights.
    olcObjectClasses: ( 2.16.840.1.113719.1.301.6.13.1
      NAME 'krbAdmService'
      SUP krbService
      STRUCTURAL )
    ##### The krbPwdPolicy object is a template password policy that
    ##### can be applied to principals when they are created.
    ##### These policy attributes will be in effect, when the Kerberos
    ##### passwords are different from users' passwords (UP).
    olcObjectClasses: ( 2.16.840.1.113719.1.301.6.14.1
      NAME 'krbPwdPolicy'
      SUP top
      MUST ( cn )
      MAY ( krbMaxPwdLife $ krbMinPwdLife $ krbPwdMinDiffChars $ krbPwdMinLength $ krbPwdHistoryLength $ krbPwdMaxFailure $ krbPwdFailureCountInterval $ krbPwdLockoutDuration $ krbPwdAttributes $ krbPwdMaxLife $ krbPwdMaxRenewableLife $ krbPwdAllowedKeysalts ) )
    ##### The krbTicketPolicyAux holds Kerberos ticket policy attributes.
    ##### This class can be attached to a principal object or realm object.
    olcObjectClasses: ( 2.16.840.1.113719.1.301.6.16.1
      NAME 'krbTicketPolicyAux'
      SUP top
      AUXILIARY
      MAY ( krbTicketFlags $ krbMaxTicketLife $ krbMaxRenewableAge ) )
    ##### The krbTicketPolicy object is an effective ticket policy that is associated with a realm or a principal
    olcObjectClasses: ( 2.16.840.1.113719.1.301.6.17.1
      NAME 'krbTicketPolicy'
      SUP top
      MUST ( cn ) )

  '';
  sudoers = pkgs.writeText "sudoers.ldif" ''
    dn: cn=sudo,cn=schema,cn=config
    objectClass: olcSchemaConfig
    cn: sudo
    olcAttributeTypes: {0}( 1.3.6.1.4.1.15953.9.1.1 NAME 'sudoUser' DESC 'User(s
     ) who may  run sudo' EQUALITY caseExactIA5Match SUBSTR caseExactIA5Substrin
     gsMatch SYNTAX 1.3.6.1.4.1.1466.115.121.1.26 )
    olcAttributeTypes: {1}( 1.3.6.1.4.1.15953.9.1.2 NAME 'sudoHost' DESC 'Host(s
     ) who may run sudo' EQUALITY caseExactIA5Match SUBSTR caseExactIA5Substring
     sMatch SYNTAX 1.3.6.1.4.1.1466.115.121.1.26 )
    olcAttributeTypes: {2}( 1.3.6.1.4.1.15953.9.1.3 NAME 'sudoCommand' DESC 'Com
     mand(s) to be executed by sudo' EQUALITY caseExactIA5Match SYNTAX 1.3.6.1.4
     .1.1466.115.121.1.26 )
    olcAttributeTypes: {3}( 1.3.6.1.4.1.15953.9.1.4 NAME 'sudoRunAs' DESC 'User(
     s) impersonated by sudo (deprecated)' EQUALITY caseExactIA5Match SYNTAX 1.3
     .6.1.4.1.1466.115.121.1.26 )
    olcAttributeTypes: {4}( 1.3.6.1.4.1.15953.9.1.5 NAME 'sudoOption' DESC 'Opti
     ons(s) followed by sudo' EQUALITY caseExactIA5Match SYNTAX 1.3.6.1.4.1.1466
     .115.121.1.26 )
    olcAttributeTypes: {5}( 1.3.6.1.4.1.15953.9.1.6 NAME 'sudoRunAsUser' DESC 'U
     ser(s) impersonated by sudo' EQUALITY caseExactIA5Match SYNTAX 1.3.6.1.4.1.
     1466.115.121.1.26 )
    olcAttributeTypes: {6}( 1.3.6.1.4.1.15953.9.1.7 NAME 'sudoRunAsGroup' DESC '
     Group(s) impersonated by sudo' EQUALITY caseExactIA5Match SYNTAX 1.3.6.1.4.
     1.1466.115.121.1.26 )
    olcAttributeTypes: {7}( 1.3.6.1.4.1.15953.9.1.8 NAME 'sudoNotBefore' DESC 'S
     tart of time interval for which the entry is valid' EQUALITY generalizedTim
     eMatch ORDERING generalizedTimeOrderingMatch SYNTAX 1.3.6.1.4.1.1466.115.12
     1.1.24 )
    olcAttributeTypes: {8}( 1.3.6.1.4.1.15953.9.1.9 NAME 'sudoNotAfter' DESC 'En
     d of time interval for which the entry is valid' EQUALITY generalizedTimeMa
     tch ORDERING generalizedTimeOrderingMatch SYNTAX 1.3.6.1.4.1.1466.115.121.1
     .24 )
    olcAttributeTypes: {9}( 1.3.6.1.4.1.15953.9.1.10 NAME 'sudoOrder' DESC 'an i
     nteger to order the sudoRole entries' EQUALITY integerMatch ORDERING intege
     rOrderingMatch SYNTAX 1.3.6.1.4.1.1466.115.121.1.27 )
    olcObjectClasses: {0}( 1.3.6.1.4.1.15953.9.2.1 NAME 'sudoRole' DESC 'Sudoer
     Entries' SUP top STRUCTURAL MUST cn MAY ( sudoUser $ sudoHost $ sudoCommand
      $ sudoRunAs $ sudoRunAsUser $ sudoRunAsGroup $ sudoOption $ sudoOrder $ su
     doNotBefore $ sudoNotAfter $ description ) )

  '';

  installPhase = ''
    mkdir -p $out;
    cp ${kerberos} $out/kerberos.ldif;
    cp ${sudoers} $out/sudoers.ldif;
  '';
}
