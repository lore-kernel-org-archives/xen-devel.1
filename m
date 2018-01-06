From: Xen.org security team <security@xen.org>
Subject: Xen Security Advisory 249 (CVE-2017-17563) - broken x86
 shadow mode refcount overflow check
Date: Sat, 06 Jan 2018 16:15:55 +0000
Message-ID: <E1eXr8V-0004gc-K0@xenbits.xenproject.org>
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

            Xen Security Advisory CVE-2017-17563 / XSA-249
                              version 3

            broken x86 shadow mode refcount overflow check

UPDATES IN VERSION 3
====================

CVE assigned.

ISSUE DESCRIPTION
=================

Pages being used to run x86 guests in shadow mode are reference counted
to track their uses.  Unfortunately the overflow check when trying to
obtain a new reference used a mask one bit wider than the reference
count actually is, rendering the entire check ineffective.

IMPACT
======

A malicious or buggy guest may cause a hypervisor crash, resulting in
a Denial of Service (DoS) affecting the entire host, or cause hypervisor
memory corruption.  We cannot rule out a guest being able to escalate
its privilege.

VULNERABLE SYSTEMS
==================

Xen versions 4.1 and later are affected.  Xen versions 4.0 and earlier
are not affected.

x86 systems are vulnerable.  ARM systems are not vulnerable.

Only guests run in shadow mode can exploit the vulnerability.

PV guests typically only run in shadow mode during live migration, as
well as for features like VM snapshot.

Note that save / restore does *not* use shadow mode, and so does not
expose this vulnerability.  Some downstreams also include a "non-live
migration" feature, which also does not use shadow mode (and thus does
not expose this vulnerability).

HVM guests run in shadow mode on hardware without HAP support, or when
HAP is disabled (globally or in the VM configuration file).  Live
migration does not affect an HVM guest's use of shadow mode.

MITIGATION
==========

For HVM guest explicitly configured to use shadow paging (e.g. via the
`hap=0' xl domain configuration file parameter), changing to HAP (e.g.
by setting `hap=1') will avoid exposing the vulnerability to those
guests.  HAP is the default (in upstream Xen), where the hardware
supports it; so this mitigation is only applicable if HAP has been
disabled by configuration.

For PV guests, avoiding their live migration avoids the vulnerability.

CREDITS
=======

This issue was discovered by Jan Beulich of SUSE.

RESOLUTION
==========

Applying the attached patch resolves this issue.

xsa249.patch           xen-unstable, Xen 4.9.x ... 4.5.x

$ sha256sum xsa249*
38a4b8033d634e22939ad42b882c35e46482782619e3e03b968a2f6489e459c9  xsa249.meta
e99066b0171d4757c6a66e1223aabe01e990de2d0dc50416936e064e6e750d00  xsa249.patch
$

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

iQEcBAEBCAAGBQJaUPXbAAoJEIP+FMlX6CvZdqQH/2b6yXlcScNp9SWs2VIoDLcc
Hh3Wxmvx4oRBkdUOiE7/YNJK3yScnW2Jled+fLrBd7yuFNmztlA6Hue1thxgQmFN
N2qDReHVBhLDQSv4Xolyifqx/leMo/s7jYkL8zBEPvRrf4DMkj7+i9/JBn8gri8G
hiImDmIet9pKL9OP+jQDsgQia5p7ygPVLommMVS/2VZp4O4sBnpvfrAIHNvmmLPy
xbr3Jw8cska7gspfmsXU1PziBFmawxk21pvozef9XN1lxC/ZY56yODtph/6KoBvr
KGtGleF0QVtj/Nvt42yBr5nMagl9XsjdFz4Jero0K4hOE1Kw7IgO0Oigav8nap8=
=Z+E8
-----END PGP SIGNATURE-----

--=separator
Content-Type: application/octet-stream; name="xsa249.meta"
Content-Disposition: attachment; filename="xsa249.meta"
Content-Transfer-Encoding: base64

ewogICJYU0EiOiAyNDksCiAgIlN1cHBvcnRlZFZlcnNpb25zIjogWwogICAg
Im1hc3RlciIsCiAgICAiNC4xMCIsCiAgICAiNC45IiwKICAgICI0LjgiLAog
ICAgIjQuNyIsCiAgICAiNC42IiwKICAgICI0LjUiCiAgXSwKICAiVHJlZXMi
OiBbCiAgICAieGVuIgogIF0sCiAgIlJlY2lwZXMiOiB7CiAgICAiNC4xMCI6
IHsKICAgICAgIlhlblZlcnNpb24iOiAiNC4xMCIsCiAgICAgICJSZWNpcGVz
IjogewogICAgICAgICJ4ZW4iOiB7CiAgICAgICAgICAiU3RhYmxlUmVmIjog
IjM0NWJiOWNkNjM0NDIxZjUwYjczMmQ0ZjljODlhNjQ5YTdhMWQwZGIiLAog
ICAgICAgICAgIlByZXJlcXMiOiBbCiAgICAgICAgICAgIDI0OAogICAgICAg
ICAgXSwKICAgICAgICAgICJQYXRjaGVzIjogWwogICAgICAgICAgICAieHNh
MjQ5LnBhdGNoIgogICAgICAgICAgXQogICAgICAgIH0KICAgICAgfQogICAg
fSwKICAgICI0LjUiOiB7CiAgICAgICJYZW5WZXJzaW9uIjogIjQuNSIsCiAg
ICAgICJSZWNpcGVzIjogewogICAgICAgICJ4ZW4iOiB7CiAgICAgICAgICAi
U3RhYmxlUmVmIjogIjQxZjZkZDA1ZDEwZmQxYjQyODFjMTcyMmUyZDhmMjll
Mzc4YWJlOWEiLAogICAgICAgICAgIlByZXJlcXMiOiBbCiAgICAgICAgICAg
IDI0OAogICAgICAgICAgXSwKICAgICAgICAgICJQYXRjaGVzIjogWwogICAg
ICAgICAgICAieHNhMjQ5LnBhdGNoIgogICAgICAgICAgXQogICAgICAgIH0K
ICAgICAgfQogICAgfSwKICAgICI0LjYiOiB7CiAgICAgICJYZW5WZXJzaW9u
IjogIjQuNiIsCiAgICAgICJSZWNpcGVzIjogewogICAgICAgICJ4ZW4iOiB7
CiAgICAgICAgICAiU3RhYmxlUmVmIjogIjliMGMyYTIyMzEzMmEwN2YwNmYw
YmU4ZTg1ZGEzOTBkZWZlOTk4ZjUiLAogICAgICAgICAgIlByZXJlcXMiOiBb
CiAgICAgICAgICAgIDI0OAogICAgICAgICAgXSwKICAgICAgICAgICJQYXRj
aGVzIjogWwogICAgICAgICAgICAieHNhMjQ5LnBhdGNoIgogICAgICAgICAg
XQogICAgICAgIH0KICAgICAgfQogICAgfSwKICAgICI0LjciOiB7CiAgICAg
ICJYZW5WZXJzaW9uIjogIjQuNyIsCiAgICAgICJSZWNpcGVzIjogewogICAg
ICAgICJ4ZW4iOiB7CiAgICAgICAgICAiU3RhYmxlUmVmIjogImJjYzllMjQ1
YWFmYmRhZTQ0Yzc2MTA1M2M4OThiZWRiMzU4MmNjNGQiLAogICAgICAgICAg
IlByZXJlcXMiOiBbCiAgICAgICAgICAgIDI0OAogICAgICAgICAgXSwKICAg
ICAgICAgICJQYXRjaGVzIjogWwogICAgICAgICAgICAieHNhMjQ5LnBhdGNo
IgogICAgICAgICAgXQogICAgICAgIH0KICAgICAgfQogICAgfSwKICAgICI0
LjgiOiB7CiAgICAgICJYZW5WZXJzaW9uIjogIjQuOCIsCiAgICAgICJSZWNp
cGVzIjogewogICAgICAgICJ4ZW4iOiB7CiAgICAgICAgICAiU3RhYmxlUmVm
IjogIjliYTY3ODNlNDdkYjcxMzc5YzUxMjAwMzliODc4ZjYwNWJkZjMxZjMi
LAogICAgICAgICAgIlByZXJlcXMiOiBbCiAgICAgICAgICAgIDI0OAogICAg
ICAgICAgXSwKICAgICAgICAgICJQYXRjaGVzIjogWwogICAgICAgICAgICAi
eHNhMjQ5LnBhdGNoIgogICAgICAgICAgXQogICAgICAgIH0KICAgICAgfQog
ICAgfSwKICAgICI0LjkiOiB7CiAgICAgICJYZW5WZXJzaW9uIjogIjQuOSIs
CiAgICAgICJSZWNpcGVzIjogewogICAgICAgICJ4ZW4iOiB7CiAgICAgICAg
ICAiU3RhYmxlUmVmIjogImFlMzRhYjhjNWQyZTk3N2Y2ZDgwODFjMmNlNDQ5
NDg3NTIzMmY1NjMiLAogICAgICAgICAgIlByZXJlcXMiOiBbCiAgICAgICAg
ICAgIDI0OAogICAgICAgICAgXSwKICAgICAgICAgICJQYXRjaGVzIjogWwog
ICAgICAgICAgICAieHNhMjQ5LnBhdGNoIgogICAgICAgICAgXQogICAgICAg
IH0KICAgICAgfQogICAgfSwKICAgICJtYXN0ZXIiOiB7CiAgICAgICJYZW5W
ZXJzaW9uIjogIjQuMTAiLAogICAgICAiUmVjaXBlcyI6IHsKICAgICAgICAi
eGVuIjogewogICAgICAgICAgIlN0YWJsZVJlZiI6ICIzNDViYjljZDYzNDQy
MWY1MGI3MzJkNGY5Yzg5YTY0OWE3YTFkMGRiIiwKICAgICAgICAgICJQcmVy
ZXFzIjogWwogICAgICAgICAgICAyNDgKICAgICAgICAgIF0sCiAgICAgICAg
ICAiUGF0Y2hlcyI6IFsKICAgICAgICAgICAgInhzYTI0OS5wYXRjaCIKICAg
ICAgICAgIF0KICAgICAgICB9CiAgICAgIH0KICAgIH0KICB9Cn0=

--=separator
Content-Type: application/octet-stream; name="xsa249.patch"
Content-Disposition: attachment; filename="xsa249.patch"
Content-Transfer-Encoding: base64

RnJvbTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgpTdWJqZWN0
OiB4ODYvc2hhZG93OiBmaXggcmVmY291bnQgb3ZlcmZsb3cgY2hlY2sKCkNv
bW1pdCBjMzg1ZDI3MDc5ICgieDg2IHNoYWRvdzogZm9yIG11bHRpLXBhZ2Ug
c2hhZG93cywgZXhwbGljaXRseSB0cmFjawp0aGUgZmlyc3QgcGFnZSIpIHJl
ZHVjZWQgdGhlIHJlZmNvdW50IHdpZHRoIHRvIDI1LCB3aXRob3V0IGFkanVz
dGluZyB0aGUKb3ZlcmZsb3cgY2hlY2suIEVsaW1pbmF0ZSB0aGUgZGlzY29u
bmVjdCBieSB1c2luZyBhIG1hbmlmZXN0IGNvbnN0YW50LgoKSW50ZXJlc3Rp
bmdseSwgdXAgdG8gY29tbWl0IDA0Nzc4MmZhMDEgKCJPdXQtb2Ytc3luYyBM
MSBzaGFkb3dzOiBPT1MKc25hcHNob3QiKSB0aGUgcmVmY291bnQgd2FzIDI3
IGJpdHMgd2lkZSwgeWV0IHRoZSBjaGVjayB3YXMgYWxyZWFkeQp1c2luZyAy
Ni4KClRoaXMgaXMgWFNBLTI0OS4KClNpZ25lZC1vZmYtYnk6IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KUmV2aWV3ZWQtYnk6IEdlb3JnZSBE
dW5sYXAgPGdlb3JnZS5kdW5sYXBAY2l0cml4LmNvbT4KUmV2aWV3ZWQtYnk6
IFRpbSBEZWVnYW4gPHRpbUB4ZW4ub3JnPgotLS0KdjI6IFNpbXBsaWZ5IGV4
cHJlc3Npb24gYmFjayB0byB0aGUgc3R5bGUgaXQgd2FzLgoKLS0tIGEveGVu
L2FyY2gveDg2L21tL3NoYWRvdy9wcml2YXRlLmgKKysrIGIveGVuL2FyY2gv
eDg2L21tL3NoYWRvdy9wcml2YXRlLmgKQEAgLTUyOSw3ICs1MjksNyBAQCBz
dGF0aWMgaW5saW5lIGludCBzaF9nZXRfcmVmKHN0cnVjdCBkb21hCiAgICAg
eCA9IHNwLT51LnNoLmNvdW50OwogICAgIG54ID0geCArIDE7CiAKLSAgICBp
ZiAoIHVubGlrZWx5KG54ID49IDFVPDwyNikgKQorICAgIGlmICggdW5saWtl
bHkobnggPj0gKDFVIDw8IFBBR0VfU0hfUkVGQ09VTlRfV0lEVEgpKSApCiAg
ICAgewogICAgICAgICBTSEFET1dfUFJJTlRLKCJzaGFkb3cgcmVmIG92ZXJm
bG93LCBnbWZuPSVseCBzbWZuPSVseFxuIiwKICAgICAgICAgICAgICAgICAg
ICAgICAgX19iYWNrcG9pbnRlcihzcCksIG1mbl94KHNtZm4pKTsKLS0tIGEv
eGVuL2luY2x1ZGUvYXNtLXg4Ni9tbS5oCisrKyBiL3hlbi9pbmNsdWRlL2Fz
bS14ODYvbW0uaApAQCAtODIsNyArODIsOCBAQCBzdHJ1Y3QgcGFnZV9pbmZv
CiAgICAgICAgICAgICB1bnNpZ25lZCBsb25nIHR5cGU6NTsgICAvKiBXaGF0
IGtpbmQgb2Ygc2hhZG93IGlzIHRoaXM/ICovCiAgICAgICAgICAgICB1bnNp
Z25lZCBsb25nIHBpbm5lZDoxOyAvKiBJcyB0aGUgc2hhZG93IHBpbm5lZD8g
Ki8KICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgaGVhZDoxOyAgIC8qIElz
IHRoaXMgdGhlIGZpcnN0IHBhZ2Ugb2YgdGhlIHNoYWRvdz8gKi8KLSAgICAg
ICAgICAgIHVuc2lnbmVkIGxvbmcgY291bnQ6MjU7IC8qIFJlZmVyZW5jZSBj
b3VudCAqLworI2RlZmluZSBQQUdFX1NIX1JFRkNPVU5UX1dJRFRIIDI1Cisg
ICAgICAgICAgICB1bnNpZ25lZCBsb25nIGNvdW50OlBBR0VfU0hfUkVGQ09V
TlRfV0lEVEg7IC8qIFJlZmVyZW5jZSBjb3VudCAqLwogICAgICAgICB9IHNo
OwogCiAgICAgICAgIC8qIFBhZ2UgaXMgb24gYSBmcmVlIGxpc3Q6ICgoY291
bnRfaW5mbyAmIFBHQ19jb3VudF9tYXNrKSA9PSAwKS4gKi8K

--=separator
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--=separator--
