Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EC9EC53219
	for <xen-devel@archiver.kernel.org>; Tue, 28 Jul 2026 12:07:51 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1373153.1620230 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wogax-0004jz-5P; Tue, 28 Jul 2026 12:07:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1373153.1620230; Tue, 28 Jul 2026 12:07:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wogaw-0004jU-QI; Tue, 28 Jul 2026 12:07:38 +0000
Received: by outflank-mailman (input) for mailman id 1373153;
 Tue, 28 Jul 2026 12:07:36 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrewcoop@xenbits.xen.org>)
 id 1wogau-0004a7-Lq; Tue, 28 Jul 2026 12:07:36 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wogau-00EcR4-2W; Tue, 28 Jul 2026 14:07:36 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrewcoop@xenbits.xen.org>)
 id 6a689b7b-5cb7-0a2a0a5109dd-0a2a450ce798-34
 for <multiple-recipients>; Tue, 28 Jul 2026 14:07:36 +0200
Received: from [104.130.215.37] (helo=mail.xenproject.org)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrewcoop@xenbits.xen.org>)
 id 6a689b0e-f479-0a2a450c0019-6882d725b970-3
 for <multiple-recipients>; Tue, 28 Jul 2026 14:05:35 +0200
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <andrewcoop@xenbits.xen.org>) id 1wogYt-00DPGA-0x;
 Tue, 28 Jul 2026 12:05:31 +0000
Received: from andrewcoop by xenbits.xenproject.org with local (Exim 4.96)
 (envelope-from <andrewcoop@xenbits.xen.org>) id 1wogYs-003Dzb-3C;
 Tue, 28 Jul 2026 12:05:30 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; none
Content-Type: multipart/mixed; boundary="=separator"; charset="utf-8"
Content-Transfer-Encoding: binary
MIME-Version: 1.0
X-Mailer: MIME-tools 5.510 (Entity 5.510)
To: xen-announce@lists.xen.org, xen-devel@lists.xen.org,
 xen-users@lists.xen.org, oss-security@lists.openwall.com
From: Xen.org security team <security@xen.org>
CC: Xen.org security team <security-team-members@xen.org>
Subject: Xen Security Advisory 507 v2 (CVE-2026-62434) - PoD: Don't try to
 reclaim special pages
Message-Id: <E1wogYs-003Dzb-3C@xenbits.xenproject.org>
Date: Tue, 28 Jul 2026 12:05:30 +0000
X-purgate-ID: tlsNG-d25034/1785240335-01AC4A5B-4B6FAA98/0/0
X-purgate-type: clean
X-purgate-size: 6587

--=separator
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

            Xen Security Advisory CVE-2026-62434 / XSA-507
                               version 2

                PoD: Don't try to reclaim special pages

UPDATES IN VERSION 2
====================

Public release.

ISSUE DESCRIPTION
=================

A guest started with Populated on Demand enabled (PoD) can attempt to
reclaim pages which aren't regular guest RAM.  This can cause corruption
of memory management state in Xen.

IMPACT
======

A buggy or malicious guest can cause corruption of Xen's state, leading
to crashes or other malfunctions.  Information leak and privilege
escalation cannot be ruled out.

VULNERABLE SYSTEMS
==================

All Xen versions from 3.4 onwards are vulnerable.  Xen versions 3.3 and
earlier are not vulnerable.

Only x86 systems are vulnerable.

Only x86 HVM and PVH guests started in populate-on-demand mode are
believed to be able to leverage the vulnerability.  Populate-on-demand
mode is activated when the guest's xl configuration file specifies a
"maxmem" value which is larger than the "memory" value.

MITIGATION
==========

Running only PV guests or HVM/PVH guests without PoD will avoid the
vulnerability.

RESOLUTION
==========

Applying the attached patch resolves this issue.

Note that patches for released versions are generally prepared to
apply to the stable branches, and may not apply cleanly to the most
recent release tarball.  Downstreams are encouraged to update to the
tip of the stable branch before applying these patches.

xsa507.patch           xen-unstable - Xen 4.17.x

$ sha256sum xsa507*
41485ddf0912cfa53fa05e236aa27c3c6490919ac2dab5b9f57ed69f5b38f60a  xsa507.patch
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

iQFABAEBCAAqFiEEI+MiLBRfRHX6gGCng/4UyVfoK9kFAmpomr4MHHBncEB4ZW4u
b3JnAAoJEIP+FMlX6CvZ+04H/i3UMWbGcPG2kp978waMmF3Gtfb/r8mw3UBzVGCi
cIOBWf/FizjWu54SQEQtjwYPfi0nKftFN1UPqAGs+OUtyiZ8EcPL5x9i7arrqA2T
uGfpCTb3NtFmacBbrpGnqkNahMtSLWtE8aSVEQhLxvZcLTPB6OPzIi/MVPGyA7jl
/LSGWs4vd99Y8ZvAN20rhxaEAjYynfd7N4tXn38EoW9WiQBuPZ5eNzsbieah8PEo
Ajntyx774ipvtYYStA4fhsLwO+6LyqH7okDR1g8Xkq6IVrOshP194mxnsuEfcMIO
4TCkWbzhmspfxQ1E2aW2VVPzIC2X2b+i8JieUK/z3mmrRSU=
=AfG5
-----END PGP SIGNATURE-----

--=separator
Content-Type: application/octet-stream; name="xsa507.patch"
Content-Disposition: attachment; filename="xsa507.patch"
Content-Transfer-Encoding: base64

RnJvbSBjMWZlN2QxMGU4YjQ4OWRkNjZhZDVhMmQ3NTA4ZTk4ZTljOGRhYmM2
IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBSb2dlciBQYXUgTW9u
bmUgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgpEYXRlOiBUdWUsIDE0IEp1bCAy
MDI2IDE3OjA1OjQ1ICswMjAwClN1YmplY3Q6IHg4Ni9wb2Q6IGRvIG5vdCBy
ZWNsYWltIHNwZWNpYWwgcGFnZXMgZm9yIFBvRCBjYWNoZQpNSU1FLVZlcnNp
b246IDEuMApDb250ZW50LVR5cGU6IHRleHQvcGxhaW47IGNoYXJzZXQ9VVRG
LTgKQ29udGVudC1UcmFuc2Zlci1FbmNvZGluZzogOGJpdAoKV2hlbiBkb2lu
ZyBQb0QgY2FjaGUgcmVjbGFpbSBhcyBwYXJ0IG9mIGEgZGVjcmVhc2UgcmVz
ZXJ2YXRpb24gY2FsbCwgYXZvaWQKcmVjbGFpbWluZyBzcGVjaWFsIHBhZ2Vz
IGZvciB0aGUgUG9EIGNhY2hlLiAgT3RoZXJ3aXNlIHN1Y2ggcGFnZXMgZ2V0
IG1vdmVkCmZyb20gdGhlIGRvbWFpbiAtPnhlbnBhZ2VfbGlzdCB0byB0aGUg
LT5wYWdlX2xpc3QsIHdoaWxlIHN0aWxsIGJlaW5nCnJlZmVyZW5jZWQgaW4g
LT5zaGFyZWRfaW5mbyBkb21haW4gZmllbGQuCgpQcmV2ZW50IFBvRCBjYWNo
ZSBmcm9tIHJlY2xhaW1pbmcgc3BlY2lhbCBwYWdlcywgYXMgbm90aGluZyBn
b29kIGNhbiBjb21lCm91dCBvZiBpdC4KClRoaXMgaXMgWFNBLTUwNyAvIENW
RS0yMDI2LTYyNDM0LgoKRml4ZXM6IDQxYWEwYjYyNjk5ZSAoIlBvRCBtZW1v
cnkgNC85OiBEZWNyZWFzZSByZXNlcnZhdGlvbiIpClNpZ25lZC1vZmYtYnk6
IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgpSZXZp
ZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgotLS0K
IHhlbi9hcmNoL3g4Ni9tbS9wMm0tcG9kLmMgfCA4ICsrKysrKy0tCiAxIGZp
bGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL3hlbi9hcmNoL3g4Ni9tbS9wMm0tcG9kLmMgYi94ZW4v
YXJjaC94ODYvbW0vcDJtLXBvZC5jCmluZGV4IDdhMGJlYmQyZDNiNS4uNDYw
MmMzMmNmZmFmIDEwMDY0NAotLS0gYS94ZW4vYXJjaC94ODYvbW0vcDJtLXBv
ZC5jCisrKyBiL3hlbi9hcmNoL3g4Ni9tbS9wMm0tcG9kLmMKQEAgLTUzNiwx
MiArNTM2LDEzIEBAIGRlY3JlYXNlX3Jlc2VydmF0aW9uKHN0cnVjdCBkb21h
aW4gKmQsIGdmbl90IGdmbiwgdW5zaWduZWQgaW50IG9yZGVyKQogICAgICAg
ICBwMm1fYWNjZXNzX3QgYTsKICAgICAgICAgcDJtX3R5cGVfdCB0OwogICAg
ICAgICB1bnNpZ25lZCBpbnQgY3VyX29yZGVyOworICAgICAgICBtZm5fdCBt
Zm4gPSBwMm0tPmdldF9lbnRyeShwMm0sIGdmbl9hZGQoZ2ZuLCBpKSwgJnQs
ICZhLCAwLCAmY3VyX29yZGVyLAorICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBOVUxMKTsKIAotICAgICAgICBwMm0tPmdldF9lbnRyeShw
Mm0sIGdmbl9hZGQoZ2ZuLCBpKSwgJnQsICZhLCAwLCAmY3VyX29yZGVyLCBO
VUxMKTsKICAgICAgICAgbiA9IDFVTCA8PCBtaW4ob3JkZXIsIGN1cl9vcmRl
cik7CiAgICAgICAgIGlmICggcDJtX2lzX3BvZCh0KSApCiAgICAgICAgICAg
ICBwb2QgKz0gbjsKLSAgICAgICAgZWxzZSBpZiAoIHAybV9pc19yYW0odCkg
KQorICAgICAgICBlbHNlIGlmICggcDJtX2lzX3JhbSh0KSAmJiAhaXNfc3Bl
Y2lhbF9wYWdlKG1mbl90b19wYWdlKG1mbikpICkKICAgICAgICAgICAgIHJh
bSArPSBuOwogICAgIH0KIApAQCAtNjQ0LDYgKzY0NSw5IEBAIGRlY3JlYXNl
X3Jlc2VydmF0aW9uKHN0cnVjdCBkb21haW4gKmQsIGdmbl90IGdmbiwgdW5z
aWduZWQgaW50IG9yZGVyKQogICAgICAgICAgICAgQVNTRVJUKG1mbl92YWxp
ZChtZm4pKTsKIAogICAgICAgICAgICAgcGFnZSA9IG1mbl90b19wYWdlKG1m
bik7CisgICAgICAgICAgICBpZiAoIGlzX3NwZWNpYWxfcGFnZShwYWdlKSAp
CisgICAgICAgICAgICAgICAgLyogRG8gbm90IHRvdWNoIHNwZWNpYWwgcGFn
ZXMsIGxldCBnZW5lcmljIGNvZGUgaGFuZGxlIHRoZW0uICovCisgICAgICAg
ICAgICAgICAgY29udGludWU7CiAKICAgICAgICAgICAgIC8qIFRoaXMgc2hv
dWxkbid0IGJlIGFibGUgdG8gZmFpbCAqLwogICAgICAgICAgICAgaWYgKCBw
Mm1fc2V0X2VudHJ5KHAybSwgZ2ZuX2FkZChnZm4sIGkpLCBJTlZBTElEX01G
TiwgY3VyX29yZGVyLAotLSAKMi41My4wCgo=

--=separator--

