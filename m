From: Xen.org security team <security@xen.org>
Subject: Xen Security Advisory 271 v2 (CVE-2018-14007) - XAPI
 HTTP directory traversal
Date: Tue, 14 Aug 2018 17:18:03 +0000
Message-ID: <E1fpcxH-0007Gh-9J@xenbits.xenproject.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=separator"; charset="utf-8"
Content-Transfer-Encoding: binary
Return-path: <xen-devel-bounces@lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-announce@lists.xen.org, xen-devel@lists.xen.org, xen-users@lists.xen.org, oss-security@lists.openwall.com
Cc: "Xen.org security team" <security-team-members@xen.org>
List-Id: xen-devel@lists.xenproject.org

--=separator
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

            Xen Security Advisory CVE-2018-14007 / XSA-271
                               version 2

                     XAPI HTTP directory traversal

UPDATES IN VERSION 2
====================

Public release.

ISSUE DESCRIPTION
=================

XAPI has an unauthenticated HTTP endpoint update/ which exports the
contents of /var/update for other hosts to use.

However, the resolution of . and .. in paths is performed before url
unquoting is performed.  This allows an attacker to traverse out of the
web root.

IMPACT
======

An unauthenticated user with access to the management network can read
arbitrary files from the dom0 filesystem.  This includes the pool secret
/etc/xensource/ptoken which grants the attacker full administrator
access.

VULNERABLE SYSTEMS
==================

All versions of XAPI since v1.13.0 are vulnerable.

If the directory /var/update doesn't exist, the vulnerability is not
exposed.

MITIGATION
==========

In the recommended configuration, the management network is isolated and
isn't reachable from untrusted hosts, or by general network traffic.

CREDITS
=======

This issue was discovered by Ronald Volgers of Computest
https://www.computest.nl/en/

RESOLUTION
==========

Applying the appropriate attached patch resolves this issue.

xsa271-xapi.patch

$ sha256sum xsa271*
ffefb71cd328e0ee5654c135bf9b08f48abedd013f1c68d5589132e2a03a01f8  xsa271-xapi.patch
$

REGENERATION OF POOL SECRET
===========================

There are no known exploits in the wild.  If there is a risk that
credentials could have been stolen, they should be reset.

Most credentials can be reset via normal administrative means, but the
pool secret doesn't have any mechanism to reset.  The following
instructions should be used:

 1) On all pool members, stop Xapi:
    # service xapi stop

 2) On the pool master:
    # rm /etc/xensource/ptoken
    # /opt/xensource/libexec/genptoken -f -o /etc/xensource/ptoken

 3) Copy /etc/xensource/ptoken to all pool slaves

 4) On the pool master, restart the toolstack:
    # xe-toolstack-restart

 5) On all pool slaves, restart the toolstack:
    # xe-toolstack-restart

Once the pool secret has been regenerated, the root password can be
changed with:
    # xe user-password-change

Furthermore, consideration should be given to other credentials, such as
(but not limited to) SSL keys, Storage SAN/iSCSI/NFS details, as well as
secrets contained within VMs disks/snapshots/etc.

DEPLOYMENT DURING EMBARGO
=========================

Deployment of the patches and/or mitigations described above (or
others which are substantially similar) is permitted during the
embargo, even on public-facing systems with untrusted guest users and
administrators.

But: Distribution of updated software is prohibited (except to other
members of the predisclosure list).

Predisclosure list members who wish to deploy significantly different
patches and/or mitigations, please contact the Xen Project Security
Team.


(Note: this during-embargo deployment notice is retained in
post-embargo publicly released Xen Project advisories, even though it
is then no longer applicable.  This is to enable the community to have
oversight of the Xen Project Security Team's decisionmaking.)

For more information about permissible uses of embargoed information,
consult the Xen Project community's agreed Security Policy:
  http://www.xenproject.org/security-policy.html
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQEcBAEBCAAGBQJbcw6vAAoJEIP+FMlX6CvZx6cH/0qaq4PDDHSrIONP7v35ZYWe
nZEoA+IWk0u35t4MwSRA8qcXZ9m+d7icHdE0c5Jwdh2sBOSFKzoehCuZOFXVpYTv
SHdr/J3ilZRN1KV7Zo/agZJFYClV5QxR118PnVYFqsAHVGjxh6RzazyBNPUTkoIa
qw/FBQwsib4Wkj5/RPympYscxetzAUoYiFeVtTgtqknXlt3UbXqzwg/lXTrMZwtG
nBSjFEW+EURlkKR0HF85mtFBmqA1I3xsKgJDaob5KWl+HmlIj0SY9knQ2le3lgxn
7zXiPSwOARg2E+vl3GB1Xd1fgcRGykBtjVWPX9uAgdb/C7qx6DN2PYEdyz1xZtI=
=5lIm
-----END PGP SIGNATURE-----

--=separator
Content-Type: application/octet-stream; name="xsa271-xapi.patch"
Content-Disposition: attachment; filename="xsa271-xapi.patch"
Content-Transfer-Encoding: base64

RnJvbTogUm9iIEhvZXMgPHJvYi5ob2VzQGNpdHJpeC5jb20+CkRhdGU6IFdl
ZCwgMTggSnVsIDIwMTggMTE6MTg6MjcgKzAxMDAKU3ViamVjdDogRml4IHBh
dGggdmVyaWZpY2F0aW9uIGluIC91cGRhdGUvIGhhbmRsZXIKClRoZSBoYW5k
bGVyIGRlY29kZWQgdGhlIHBlcmNlbnQtc3ltYm9scyBpbiB0aGUgZ2l2ZW4g
cGF0aCBhZnRlciByZXNvbHZpbmcgdGhlIC4KYW5kIC4uIHBhdHRlcm5zLiBU
aGlzIG1lYW50IHRoYXQgYW55ICIlMmUlMmUiIHN0cmluZ3MgaW4gdGhlIHBh
dGggd291bGQgc3RpbGwKcmVzdWx0IGluIC4uIHN0cmluZ3MgaW4gdGhlIHZh
bGlkYXRlIHBhdGgsIHdoaWNoIG1hZGUgaXQgcG9zc2libGUgdG8gZG93bmxv
YWQKZmlsZXMgb3V0c2lkZSB0aGUgZGVzaWduYXRlZCBkaXJlY3RvcnkgZm9y
IHVwZGF0ZXMuCgpSZXBvcnRlZC1ieTogUm9uYWxkIFZvbGdlcnMgPHJ2b2xn
ZXJzQGNvbXB1dGVzdC5ubD4KU2lnbmVkLW9mZi1ieTogUm9iIEhvZXMgPHJv
Yi5ob2VzQGNpdHJpeC5jb20+CgpkaWZmIC0tZ2l0IGEvb2NhbWwveGFwaS94
YXBpX3Bvb2xfdXBkYXRlLm1sIGIvb2NhbWwveGFwaS94YXBpX3Bvb2xfdXBk
YXRlLm1sCmluZGV4IDI3NWE4ZTUuLmNjYzFkODggMTAwNjQ0Ci0tLSBhL29j
YW1sL3hhcGkveGFwaV9wb29sX3VwZGF0ZS5tbAorKysgYi9vY2FtbC94YXBp
L3hhcGlfcG9vbF91cGRhdGUubWwKQEAgLTUzNiw4ICs1MzYsOCBAQCBsZXQg
cGF0aF9mcm9tX3VyaSB1cmkgPQogICAoKiByZW1vdmUgYW55IGRvZGd5IHVz
ZSBvZiAiLiIgb3IgIi4uIiBOQiB3ZSBkb24ndCBwcmV2ZW50IHRoZSB1c2Ug
b2Ygc3ltbGlua3MgKikKICAgU3RyaW5nLnN1Yl90b19lbmQgdXJpIChTdHJp
bmcubGVuZ3RoIENvbnN0YW50cy5nZXRfcG9vbF91cGRhdGVfZG93bmxvYWRf
dXJpKQogICB8PiBGaWxlbmFtZS5jb25jYXQgIVhhcGlfZ2xvYnMuaG9zdF91
cGRhdGVfZGlyCi0gIHw+IFN0ZGV4dC5Vbml4ZXh0LnJlc29sdmVfZG90X2Fu
ZF9kb3Rkb3QKICAgfD4gVXJpLnBjdF9kZWNvZGUKKyAgfD4gU3RkZXh0LlVu
aXhleHQucmVzb2x2ZV9kb3RfYW5kX2RvdGRvdAogCiBsZXQgcG9vbF91cGRh
dGVfZG93bmxvYWRfaGFuZGxlciAocmVxOiBSZXF1ZXN0LnQpIHMgXyA9CiAg
IGRlYnVnICJwb29sX3VwZGF0ZS5wb29sX3VwZGF0ZV9kb3dubG9hZF9oYW5k
bGVyIFVSTCAlcyIgcmVxLlJlcXVlc3QudXJpOwo=

--=separator
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--=separator--
