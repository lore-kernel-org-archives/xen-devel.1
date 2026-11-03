Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4D96606A324
	for <xen-devel@archiver.kernel.org>; Tue,  3 Nov 2026 12:00:45 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1469585.1678354 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xODBm-00042a-1R; Tue, 03 Nov 2026 12:00:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1469585.1678354; Tue, 03 Nov 2026 12:00:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xODBl-00041u-To; Tue, 03 Nov 2026 12:00:29 +0000
Received: by outflank-mailman (input) for mailman id 1469585;
 Tue, 03 Nov 2026 12:00:28 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrewcoop@xenbits.xen.org>)
 id 1xODBj-0003xy-Tf; Tue, 03 Nov 2026 12:00:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xODBj-00AceL-5y; Tue, 03 Nov 2026 13:00:27 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrewcoop@xenbits.xen.org>)
 id 6ae9ccd7-2eae-0a2a0a5409dd-0a2a450b94fc-16
 for <multiple-recipients>; Tue, 03 Nov 2026 13:00:26 +0100
Received: from [104.130.215.37] (helo=mail.xenproject.org)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrewcoop@xenbits.xen.org>)
 id 6ae9ccd8-b7e8-0a2a450b0019-6882d725bbde-3
 for <multiple-recipients>; Tue, 03 Nov 2026 13:00:25 +0100
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <andrewcoop@xenbits.xen.org>)
 id 1xODBc-0000000CZyb-3N5m; Tue, 03 Nov 2026 12:00:20 +0000
Received: from andrewcoop by xenbits.xenproject.org with local (Exim 4.98.2)
 (envelope-from <andrewcoop@xenbits.xen.org>)
 id 1xODBc-00000006KvR-33Pr; Tue, 03 Nov 2026 12:00:20 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; none
Content-Type: multipart/mixed; boundary="=separator"; charset="utf-8"
Content-Transfer-Encoding: binary
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Mailer: MIME-tools 5.515 (Entity 5.515)
To: xen-announce@lists.xen.org, xen-devel@lists.xen.org,
 xen-users@lists.xen.org, oss-security@lists.openwall.com
From: Xen.org security team <security@xen.org>
CC: Xen.org security team <security-team-members@xen.org>
Subject: Xen Security Advisory 523 v2 (CVE-2026-102703,CVE-2026-102704) -
 arbitrary read/write via grant copy
Message-Id: <E1xODBc-00000006KvR-33Pr@xenbits.xenproject.org>
Date: Tue, 03 Nov 2026 12:00:20 +0000
X-purgate-ID: tlsNG-42698a/1793707226-A86CA9EA-19267201/0/0
X-purgate-type: clean
X-purgate-size: 14589
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--=separator
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

   Xen Security Advisory CVE-2026-102703,CVE-2026-102704 / XSA-523
                              version 2

                    arbitrary read/write via grant copy

UPDATES IN VERSION 2
====================

Public release.

ISSUE DESCRIPTION
=================

A common access pattern is a batch of Grant Copy operations acting on
adjacent address ranges in the same source or destination page.  For
performance reasons, Xen caches details internally to reuse already
validated data.  The conditions on when to re-validate the internal data
were not correct in some cases:

 - Frame numbers and grant references could wrongly be mixed up.  This
   is CVE-2026-102703.

 - Copying by frame number (rather than grant reference) is permitted
   only when operating on the caller's own memory.  The check to enforce
   this restriction was misplaced.  This is CVE-2026-102704.

IMPACT
======

A malicious guest can read and write arbitrary memory, belonging to
other domains, including Dom0.

VULNERABLE SYSTEMS
==================

All Xen versions from 4.6 onwards are vulnerable.  Xen versions 4.5 and
earlier are not vulnerable.

MITIGATION
==========

There is no known mitigation.

CREDITS
=======

This issue was discovered by Anthropic using Claude, then validated by
Stephan Lipp of Ada Logics.

It was then independently reported by the CodeAnt AI Security Research
Team.

RESOLUTION
==========

Applying the appropriate set of attached patches resolves this issue.

Note that patches for released versions are generally prepared to
apply to the stable branches, and may not apply cleanly to the most
recent release tarball.  Downstreams are encouraged to update to the
tip of the stable branch before applying these patches.

xsa523-?.patch           xen-unstable - Xen 4.19.x
xsa523-4.18-?.patch      Xen 4.18.x - Xen 4.17.x

$ sha256sum xsa523*
87562e68c584dcc6b568348e7ba6cfde592798cb89f372364792afda65aa6895  xsa523-1.patch
9cd4e76fa3587f491f5bb0f895f375fcf24df8bd9bdf602c343081e7411b92f0  xsa523-2.patch
c1accb1fa55176cb6191e091d93198068630acbc6529966738669a43d5c2e38e  xsa523-4.18-1.patch
efc16fe8830066276fb50f01f24a358194a752507077fdb61a60f891dc1a7019  xsa523-4.18-2.patch
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

iQFABAEBCAAqFiEEI+MiLBRfRHX6gGCng/4UyVfoK9kFAmrpzHcMHHBncEB4ZW4u
b3JnAAoJEIP+FMlX6CvZYTAIALOhpiCcbIvbmpr8/yLSFfLXJ30HIq+rihtrrwHi
IYuUujGKDMMfZ+peGDzjUvWdSpeccHVqzxYyQbeqKN+bxeiRHyPaquaKGgMJgPgg
aI8/Ee5zeCBESEsAAI6Z6REXPT/ViL1MY4+gI8cGjD3CIfoBoBhHqDBxtDlkNtH6
bFH4E6CsLGPe1PELDBjEaqwFPiY03DItRBywXi9ygfATn47EnViQOlGSZm4cMIaX
wdT5dJKydXjvscrglijQSKUzhqC8qaTPwxF7pNPZWjw06QNBQUvLQi68iWgA1Hp/
ACiQV+gJuY+qEH93+UbQkxl7k0DBXfZLo6CxdrKupI3MVB4=
=SYnT
-----END PGP SIGNATURE-----

--=separator
Content-Type: application/octet-stream; name="xsa523-1.patch"
Content-Disposition: attachment; filename="xsa523-1.patch"
Content-Transfer-Encoding: base64

RnJvbTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgpTdWJqZWN0OiBnbnR0YWI6IGNv
bXBsZXRlIGNoZWNraW5nIGluIGdudHRhYl9jb3B5X2J1Zl92YWxpZCgpCgpUaGUgLT5oYXZlX2dy
YW50IGZpZWxkIG5lZWRzIGNoZWNraW5nIG5vdCBvbmx5IGFoZWFkIG9mIGNvbXBhcmluZyBHUkVG
cywKYnV0IGFsc28gYWhlYWQgb2YgY29tcGFyaW5nIE1GTnMuIEVsc2UgYSAobGlrZWx5IGludmFs
aWQpIEdSRUYgZnJvbSBhbgplYXJsaWVyIGJhdGNoIGVsZW1lbnQgY2FuIGJlIG1pc3Rha2VuIGZv
ciBhIChwb3NzaWJseSB2YWxpZCkgTUZOLgoKVGhpcyBpcyBDVkUtMjAyNi0xMDI3MDMsIHBhcnQg
b2YgWFNBLTUyMy4KCkZpeGVzOiBkMjhmNDJmMjcwM2UgKCJncmFudC10YWJsZTogZGVmZXIgcmVs
ZWFzaW5nIHBhZ2VzIGFjcXVpcmVkIGluIGEgZ3JhbnQgY29weSIpCkFzc2lzdGVkLWJ5OiBDbGF1
ZGUKUmVwb3J0ZWQtYnk6IFN0ZXBoYW4gTGlwcCA8U3RlcGhhbkBBZGFsb2dpY3MuY29tPgpSZXBv
cnRlZC1ieTogQ29kZUFudCBBSSBTZWN1cml0eSBSZXNlYXJjaCA8c2VjdXJpdHlyZXNlYXJjaEBj
b2RlYW50LmFpPgpTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+
ClJldmlld2VkLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgoK
ZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vZ3JhbnRfdGFibGUuYyBiL3hlbi9jb21tb24vZ3JhbnRf
dGFibGUuYwppbmRleCBiMTU4MDVmM2Y5NGQuLjNkYzVmZjg4ZGE4NSAxMDA2NDQKLS0tIGEveGVu
L2NvbW1vbi9ncmFudF90YWJsZS5jCisrKyBiL3hlbi9jb21tb24vZ3JhbnRfdGFibGUuYwpAQCAt
MzA4MywxMCArMzA4MywxMCBAQCBzdGF0aWMgYm9vbCBnbnR0YWJfY29weV9idWZfdmFsaWQoCiAg
ICAgY29uc3Qgc3RydWN0IGdudHRhYl9jb3B5X3B0ciAqcCwgY29uc3Qgc3RydWN0IGdudHRhYl9j
b3B5X2J1ZiAqYiwKICAgICBib29sIGhhc19ncmVmKQogewotICAgIGlmICggIWItPnZpcnQgKQor
ICAgIGlmICggIWItPnZpcnQgfHwgYi0+aGF2ZV9ncmFudCAhPSBoYXNfZ3JlZiApCiAgICAgICAg
IHJldHVybiAwOwogICAgIGlmICggaGFzX2dyZWYgKQotICAgICAgICByZXR1cm4gYi0+aGF2ZV9n
cmFudCAmJiBwLT51LnJlZiA9PSBiLT5wdHIudS5yZWY7CisgICAgICAgIHJldHVybiBwLT51LnJl
ZiA9PSBiLT5wdHIudS5yZWY7CiAgICAgcmV0dXJuIHAtPnUuZ21mbiA9PSBiLT5wdHIudS5nbWZu
OwogfQogCg==

--=separator
Content-Type: application/octet-stream; name="xsa523-2.patch"
Content-Disposition: attachment; filename="xsa523-2.patch"
Content-Transfer-Encoding: base64

RnJvbTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgpTdWJqZWN0OiBnbnR0YWI6IG1v
dmUgIm9ubHkgbG9jYWwgZG9tYWluIG1heSBjb3B5IGJ5IGZyYW1lIiBjaGVjawoKZ250dGFiX2Nv
cHlfb25lKCkgY2FsbHMgZ250dGFiX2NvcHlfbG9ja19kb21haW57cyx9KCkgb25seSBjb25kaXRp
b25hbGx5LgpUaGUgbm9uLUdSRUYgY2hlY2sgdG93YXJkcyB0aGUgcmVxdWVzdG9yIGJlaW5nIERP
TUlEX1NFTEYsIGhvd2V2ZXIsIG5lZWRzCmRvaW5nIG9uIGV2ZXJ5IGJhdGNoIGVsZW1lbnQuIE1v
dmUgdGhlIGNoZWNrIGludG8gZ250dGFiX2NvcHlfY2xhaW1fYnVmKCkKdG8gYWNoaWV2ZSB0aGF0
LgoKVGhpcyBpcyBDVkUtMjAyNi0xMDI3MDQsIHBhcnQgb2YgWFNBLTUyMy4KCkZpeGVzOiBkMjhm
NDJmMjcwM2UgKCJncmFudC10YWJsZTogZGVmZXIgcmVsZWFzaW5nIHBhZ2VzIGFjcXVpcmVkIGlu
IGEgZ3JhbnQgY29weSIpCkFzc2lzdGVkLWJ5OiBDbGF1ZGUKUmVwb3J0ZWQtYnk6IFN0ZXBoYW4g
TGlwcCA8U3RlcGhhbkBBZGFsb2dpY3MuY29tPgpSZXBvcnRlZC1ieTogQ29kZUFudCBBSSBTZWN1
cml0eSBSZXNlYXJjaCA8c2VjdXJpdHlyZXNlYXJjaEBjb2RlYW50LmFpPgpTaWduZWQtb2ZmLWJ5
OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+ClJldmlld2VkLWJ5OiBBbmRyZXcgQ29v
cGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgoKZGlmZiAtLWdpdCBhL3hlbi9jb21tb24v
Z3JhbnRfdGFibGUuYyBiL3hlbi9jb21tb24vZ3JhbnRfdGFibGUuYwppbmRleCAzZGM1ZmY4OGRh
ODUuLjVlNzljMDEyYjY5NSAxMDA2NDQKLS0tIGEveGVuL2NvbW1vbi9ncmFudF90YWJsZS5jCisr
KyBiL3hlbi9jb21tb24vZ3JhbnRfdGFibGUuYwpAQCAtMjkzNiwxMyArMjkzNiw4IEBAIHN0cnVj
dCBnbnR0YWJfY29weV9idWYgewogICAgIGJvb2wgaGF2ZV90eXBlOwogfTsKIAotc3RhdGljIGlu
dCBnbnR0YWJfY29weV9sb2NrX2RvbWFpbihkb21pZF90IGRvbWlkLCBib29sIGlzX2dyZWYsCi0g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBnbnR0YWJfY29weV9idWYg
KmJ1ZikKK3N0YXRpYyBpbnQgZ250dGFiX2NvcHlfbG9ja19kb21haW4oZG9taWRfdCBkb21pZCwg
c3RydWN0IGdudHRhYl9jb3B5X2J1ZiAqYnVmKQogewotICAgIC8qIE9ubHkgRE9NSURfU0VMRiBt
YXkgcmVmZXJlbmNlIHZpYSBmcmFtZS4gKi8KLSAgICBpZiAoIGRvbWlkICE9IERPTUlEX1NFTEYg
JiYgIWlzX2dyZWYgKQotICAgICAgICByZXR1cm4gR05UU1RfcGVybWlzc2lvbl9kZW5pZWQ7Ci0K
ICAgICBidWYtPmRvbWFpbiA9IHJjdV9sb2NrX2RvbWFpbl9ieV9hbnlfaWQoZG9taWQpOwogCiAg
ICAgaWYgKCAhYnVmLT5kb21haW4gKQpAQCAtMjk3NCwxMiArMjk2OSwxMCBAQCBzdGF0aWMgaW50
IGdudHRhYl9jb3B5X2xvY2tfZG9tYWlucyhjb25zdCBzdHJ1Y3QgZ250dGFiX2NvcHkgKm9wLAog
ewogICAgIGludCByYzsKIAotICAgIHJjID0gZ250dGFiX2NvcHlfbG9ja19kb21haW4ob3AtPnNv
dXJjZS5kb21pZCwKLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG9wLT5mbGFncyAm
IEdOVENPUFlfc291cmNlX2dyZWYsIHNyYyk7CisgICAgcmMgPSBnbnR0YWJfY29weV9sb2NrX2Rv
bWFpbihvcC0+c291cmNlLmRvbWlkLCBzcmMpOwogICAgIGlmICggcmMgPCAwICkKICAgICAgICAg
Z290byBlcnJvcjsKLSAgICByYyA9IGdudHRhYl9jb3B5X2xvY2tfZG9tYWluKG9wLT5kZXN0LmRv
bWlkLAotICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgb3AtPmZsYWdzICYgR05UQ09Q
WV9kZXN0X2dyZWYsIGRlc3QpOworICAgIHJjID0gZ250dGFiX2NvcHlfbG9ja19kb21haW4ob3At
PmRlc3QuZG9taWQsIGRlc3QpOwogICAgIGlmICggcmMgPCAwICkKICAgICAgICAgZ290byBlcnJv
cjsKIApAQCAtMzA0Miw2ICszMDM1LDkgQEAgc3RhdGljIGludCBnbnR0YWJfY29weV9jbGFpbV9i
dWYoY29uc3Qgc3RydWN0IGdudHRhYl9jb3B5ICpvcCwKICAgICAgICAgYnVmLT5wdHIudS5yZWYg
PSBwdHItPnUucmVmOwogICAgICAgICBidWYtPmhhdmVfZ3JhbnQgPSAxOwogICAgIH0KKyAgICAv
KiBPbmx5IERPTUlEX1NFTEYgbWF5IHJlZmVyZW5jZSB2aWEgZnJhbWUuICovCisgICAgZWxzZSBp
ZiAoIHB0ci0+ZG9taWQgIT0gRE9NSURfU0VMRiApCisgICAgICAgIHJldHVybiBHTlRTVF9wZXJt
aXNzaW9uX2RlbmllZDsKICAgICBlbHNlCiAgICAgewogICAgICAgICByYyA9IGdldF9wYWdlZF9m
cmFtZShwdHItPnUuZ21mbiwgJmJ1Zi0+bWZuLCAmYnVmLT5wYWdlLAo=

--=separator
Content-Type: application/octet-stream; name="xsa523-4.18-1.patch"
Content-Disposition: attachment; filename="xsa523-4.18-1.patch"
Content-Transfer-Encoding: base64

RnJvbTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgpTdWJqZWN0OiBnbnR0YWI6IGNv
bXBsZXRlIGNoZWNraW5nIGluIGdudHRhYl9jb3B5X2J1Zl92YWxpZCgpCgpUaGUgLT5oYXZlX2dy
YW50IGZpZWxkIG5lZWRzIGNoZWNraW5nIG5vdCBvbmx5IGFoZWFkIG9mIGNvbXBhcmluZyBHUkVG
cywKYnV0IGFsc28gYWhlYWQgb2YgY29tcGFyaW5nIE1GTnMuIEVsc2UgYSAobGlrZWx5IGludmFs
aWQpIEdSRUYgZnJvbSBhbgplYXJsaWVyIGJhdGNoIGVsZW1lbnQgY2FuIGJlIG1pc3Rha2VuIGZv
ciBhIChwb3NzaWJseSB2YWxpZCkgTUZOLgoKVGhpcyBpcyBDVkUtMjAyNi0xMDI3MDMsIHBhcnQg
b2YgWFNBLTUyMy4KCkZpeGVzOiBkMjhmNDJmMjcwM2UgKCJncmFudC10YWJsZTogZGVmZXIgcmVs
ZWFzaW5nIHBhZ2VzIGFjcXVpcmVkIGluIGEgZ3JhbnQgY29weSIpCkFzc2lzdGVkLWJ5OiBDbGF1
ZGUKUmVwb3J0ZWQtYnk6IFN0ZXBoYW4gTGlwcCA8U3RlcGhhbkBBZGFsb2dpY3MuY29tPgpSZXBv
cnRlZC1ieTogQ29kZUFudCBBSSBTZWN1cml0eSBSZXNlYXJjaCA8c2VjdXJpdHlyZXNlYXJjaEBj
b2RlYW50LmFpPgpTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+
ClJldmlld2VkLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgoK
ZGlmZiAtLWdpdCBhL3hlbi9jb21tb24vZ3JhbnRfdGFibGUuYyBiL3hlbi9jb21tb24vZ3JhbnRf
dGFibGUuYwppbmRleCA3NDJjOTc5N2M1MzUuLjg0MmQ0MzY4NDg0OSAxMDA2NDQKLS0tIGEveGVu
L2NvbW1vbi9ncmFudF90YWJsZS5jCisrKyBiL3hlbi9jb21tb24vZ3JhbnRfdGFibGUuYwpAQCAt
MzA4MSwxMCArMzA4MSwxMCBAQCBzdGF0aWMgYm9vbF90IGdudHRhYl9jb3B5X2J1Zl92YWxpZChj
b25zdCBzdHJ1Y3QgZ250dGFiX2NvcHlfcHRyICpwLAogICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgY29uc3Qgc3RydWN0IGdudHRhYl9jb3B5X2J1ZiAqYiwKICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIGJvb2xfdCBoYXNfZ3JlZikKIHsKLSAgICBpZiAoICFi
LT52aXJ0ICkKKyAgICBpZiAoICFiLT52aXJ0IHx8IGItPmhhdmVfZ3JhbnQgIT0gaGFzX2dyZWYg
KQogICAgICAgICByZXR1cm4gMDsKICAgICBpZiAoIGhhc19ncmVmICkKLSAgICAgICAgcmV0dXJu
IGItPmhhdmVfZ3JhbnQgJiYgcC0+dS5yZWYgPT0gYi0+cHRyLnUucmVmOworICAgICAgICByZXR1
cm4gcC0+dS5yZWYgPT0gYi0+cHRyLnUucmVmOwogICAgIHJldHVybiBwLT51LmdtZm4gPT0gYi0+
cHRyLnUuZ21mbjsKIH0KIAo=

--=separator
Content-Type: application/octet-stream; name="xsa523-4.18-2.patch"
Content-Disposition: attachment; filename="xsa523-4.18-2.patch"
Content-Transfer-Encoding: base64

RnJvbTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgpTdWJqZWN0OiBnbnR0YWI6IG1v
dmUgIm9ubHkgbG9jYWwgZG9tYWluIG1heSBjb3B5IGJ5IGZyYW1lIiBjaGVjawoKZ250dGFiX2Nv
cHlfb25lKCkgY2FsbHMgZ250dGFiX2NvcHlfbG9ja19kb21haW57cyx9KCkgb25seSBjb25kaXRp
b25hbGx5LgpUaGUgbm9uLUdSRUYgY2hlY2sgdG93YXJkcyB0aGUgcmVxdWVzdG9yIGJlaW5nIERP
TUlEX1NFTEYsIGhvd2V2ZXIsIG5lZWRzCmRvaW5nIG9uIGV2ZXJ5IGJhdGNoIGVsZW1lbnQuIE1v
dmUgdGhlIGNoZWNrIGludG8gZ250dGFiX2NvcHlfY2xhaW1fYnVmKCkKdG8gYWNoaWV2ZSB0aGF0
LgoKVGhpcyBpcyBDVkUtMjAyNi0xMDI3MDQsIHBhcnQgb2YgWFNBLTUyMy4KCkZpeGVzOiBkMjhm
NDJmMjcwM2UgKCJncmFudC10YWJsZTogZGVmZXIgcmVsZWFzaW5nIHBhZ2VzIGFjcXVpcmVkIGlu
IGEgZ3JhbnQgY29weSIpCkFzc2lzdGVkLWJ5OiBDbGF1ZGUKUmVwb3J0ZWQtYnk6IFN0ZXBoYW4g
TGlwcCA8U3RlcGhhbkBBZGFsb2dpY3MuY29tPgpSZXBvcnRlZC1ieTogQ29kZUFudCBBSSBTZWN1
cml0eSBSZXNlYXJjaCA8c2VjdXJpdHlyZXNlYXJjaEBjb2RlYW50LmFpPgpTaWduZWQtb2ZmLWJ5
OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+ClJldmlld2VkLWJ5OiBBbmRyZXcgQ29v
cGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgoKZGlmZiAtLWdpdCBhL3hlbi9jb21tb24v
Z3JhbnRfdGFibGUuYyBiL3hlbi9jb21tb24vZ3JhbnRfdGFibGUuYwppbmRleCA4NDJkNDM2ODQ4
NDkuLjAzNTQzZmMzMzVhOSAxMDA2NDQKLS0tIGEveGVuL2NvbW1vbi9ncmFudF90YWJsZS5jCisr
KyBiL3hlbi9jb21tb24vZ3JhbnRfdGFibGUuYwpAQCAtMjkzNCwxMyArMjkzNCw4IEBAIHN0cnVj
dCBnbnR0YWJfY29weV9idWYgewogICAgIGJvb2xfdCBoYXZlX3R5cGU7CiB9OwogCi1zdGF0aWMg
aW50IGdudHRhYl9jb3B5X2xvY2tfZG9tYWluKGRvbWlkX3QgZG9taWQsIGJvb2wgaXNfZ3JlZiwK
LSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IGdudHRhYl9jb3B5X2J1
ZiAqYnVmKQorc3RhdGljIGludCBnbnR0YWJfY29weV9sb2NrX2RvbWFpbihkb21pZF90IGRvbWlk
LCBzdHJ1Y3QgZ250dGFiX2NvcHlfYnVmICpidWYpCiB7Ci0gICAgLyogT25seSBET01JRF9TRUxG
IG1heSByZWZlcmVuY2UgdmlhIGZyYW1lLiAqLwotICAgIGlmICggZG9taWQgIT0gRE9NSURfU0VM
RiAmJiAhaXNfZ3JlZiApCi0gICAgICAgIHJldHVybiBHTlRTVF9wZXJtaXNzaW9uX2RlbmllZDsK
LQogICAgIGJ1Zi0+ZG9tYWluID0gcmN1X2xvY2tfZG9tYWluX2J5X2FueV9pZChkb21pZCk7CiAK
ICAgICBpZiAoICFidWYtPmRvbWFpbiApCkBAIC0yOTcyLDEyICsyOTY3LDEwIEBAIHN0YXRpYyBp
bnQgZ250dGFiX2NvcHlfbG9ja19kb21haW5zKGNvbnN0IHN0cnVjdCBnbnR0YWJfY29weSAqb3As
CiB7CiAgICAgaW50IHJjOwogCi0gICAgcmMgPSBnbnR0YWJfY29weV9sb2NrX2RvbWFpbihvcC0+
c291cmNlLmRvbWlkLAotICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgb3AtPmZsYWdz
ICYgR05UQ09QWV9zb3VyY2VfZ3JlZiwgc3JjKTsKKyAgICByYyA9IGdudHRhYl9jb3B5X2xvY2tf
ZG9tYWluKG9wLT5zb3VyY2UuZG9taWQsIHNyYyk7CiAgICAgaWYgKCByYyA8IDAgKQogICAgICAg
ICBnb3RvIGVycm9yOwotICAgIHJjID0gZ250dGFiX2NvcHlfbG9ja19kb21haW4ob3AtPmRlc3Qu
ZG9taWQsCi0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBvcC0+ZmxhZ3MgJiBHTlRD
T1BZX2Rlc3RfZ3JlZiwgZGVzdCk7CisgICAgcmMgPSBnbnR0YWJfY29weV9sb2NrX2RvbWFpbihv
cC0+ZGVzdC5kb21pZCwgZGVzdCk7CiAgICAgaWYgKCByYyA8IDAgKQogICAgICAgICBnb3RvIGVy
cm9yOwogCkBAIC0zMDQwLDYgKzMwMzMsOSBAQCBzdGF0aWMgaW50IGdudHRhYl9jb3B5X2NsYWlt
X2J1Zihjb25zdCBzdHJ1Y3QgZ250dGFiX2NvcHkgKm9wLAogICAgICAgICBidWYtPnB0ci51LnJl
ZiA9IHB0ci0+dS5yZWY7CiAgICAgICAgIGJ1Zi0+aGF2ZV9ncmFudCA9IDE7CiAgICAgfQorICAg
IC8qIE9ubHkgRE9NSURfU0VMRiBtYXkgcmVmZXJlbmNlIHZpYSBmcmFtZS4gKi8KKyAgICBlbHNl
IGlmICggcHRyLT5kb21pZCAhPSBET01JRF9TRUxGICkKKyAgICAgICAgcmV0dXJuIEdOVFNUX3Bl
cm1pc3Npb25fZGVuaWVkOwogICAgIGVsc2UKICAgICB7CiAgICAgICAgIHJjID0gZ2V0X3BhZ2Vk
X2ZyYW1lKHB0ci0+dS5nbWZuLCAmYnVmLT5tZm4sICZidWYtPnBhZ2UsCg==

--=separator--

