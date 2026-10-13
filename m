Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38CB3CC6B03
	for <xen-devel@archiver.kernel.org>; Tue, 13 Oct 2026 12:29:29 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1447164.1663492 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGbd8-0003j7-9C; Tue, 13 Oct 2026 12:29:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1447164.1663492; Tue, 13 Oct 2026 12:29:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGbd6-0003ee-B2; Tue, 13 Oct 2026 12:29:16 +0000
Received: by outflank-mailman (input) for mailman id 1447164;
 Tue, 13 Oct 2026 12:29:06 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrewcoop@xenbits.xen.org>)
 id 1xGbct-0001Do-CN; Tue, 13 Oct 2026 12:29:03 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGbcs-009dD9-Oe; Tue, 13 Oct 2026 14:29:02 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrewcoop@xenbits.xen.org>)
 id 6ace2403-2eae-0a2a0a5409dd-0a2a4501ece6-32
 for <multiple-recipients>; Tue, 13 Oct 2026 14:29:02 +0200
Received: from [104.130.215.37] (helo=mail.xenproject.org)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrewcoop@xenbits.xen.org>)
 id 6ace240d-5984-0a2a45010019-6882d725a7a2-3
 for <multiple-recipients>; Tue, 13 Oct 2026 14:29:02 +0200
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <andrewcoop@xenbits.xen.org>)
 id 1xGbcq-00000003NIa-0fu4; Tue, 13 Oct 2026 12:28:59 +0000
Received: from andrewcoop by xenbits.xenproject.org with local (Exim 4.98.2)
 (envelope-from <andrewcoop@xenbits.xen.org>)
 id 1xGbcp-0000000F9FM-3n4i; Tue, 13 Oct 2026 12:28:59 +0000
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
X-Mailer: MIME-tools 5.515 (Entity 5.515)
To: xen-announce@lists.xen.org, xen-devel@lists.xen.org,
 xen-users@lists.xen.org, oss-security@lists.openwall.com
From: Xen.org security team <security@xen.org>
CC: Xen.org security team <security-team-members@xen.org>
Subject: Xen Security Advisory 520 v2 (CVE-2026-102700) - gnttab:
 cache-flush handling may cause page reference leak
Message-Id: <E1xGbcp-0000000F9FM-3n4i@xenbits.xenproject.org>
Date: Tue, 13 Oct 2026 12:28:59 +0000
X-purgate-ID: tlsNG-d62444/1791894542-BEA66757-1FED5286/0/0
X-purgate-type: clean
X-purgate-size: 4719

--=separator
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

           Xen Security Advisory CVE-2026-102700 / XSA-520
                              version 2

      gnttab: cache-flush handling may cause page reference leak

UPDATES IN VERSION 2
====================

Public release.

ISSUE DESCRIPTION
=================

With its original introduction, GNTTAB_cache_flush was made available
uniformly.  XSA-232 (CVE-2017-14318) then covered an omitted NULL
pointer check, yet the addition of that check failed to adjust the
subsequent error path.  That error path fails to drop a page reference in
case the specified page is owned by a special system domain (DOM_IO and
DOM_COW are system domains which can have memory pages assigned to them.)

IMPACT
======

The most likely outcome is Denial of Service (DoS) of either Domain 0
(then likely affecting the entire host) or of another domain.

VULNERABLE SYSTEMS
==================

Xen versions 4.5 through 4.20 are affected.  Xen versions 4.21 and
newer as well as 4.4 and older are not affected.

Only x86 systems are vulnerable.  Arm systems are not vulnerable.

MITIGATION
==========

There is no known mitigation.

CREDITS
=======

This issue was discovered independently by Andrew Cooper of Citrix and
Yehyeong Lee.

RESOLUTION
==========

Applying the appropriate attached patch resolves this issue.

Note that patches for released versions are generally prepared to
apply to the stable branches, and may not apply cleanly to the most
recent release tarball.  Downstreams are encouraged to update to the
tip of the stable branch before applying these patches.

xsa520.patch           Xen 4.20.x - Xen 4.17.x

$ sha256sum xsa520*
e6814fe4a77d38f83c7bf3b92e8d24a0d95508572b845c622985e7021338cca9  xsa520.patch
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

iQFABAEBCAAqFiEEI+MiLBRfRHX6gGCng/4UyVfoK9kFAmrOItgMHHBncEB4ZW4u
b3JnAAoJEIP+FMlX6CvZw3AIALH4pnPt5g51TX1HIUUjtyqxK9j6IyFtYgHqptRA
XTaZAD+NlU9R97SKGG8/YkMwdIDOQ43HE0sjJpARScQbCXcoq781yf4U1xbuy56z
prClo+bFT61BnbJnzpQuhmZ1kfPYhqqeYSEsm9TUj6g1Z3j2oq45aISrgyDJgsRJ
/t8Reelp/kFhQHql7Bt7uRy0xYTHcYuN56dGDAJJ1MsExsbEdLW4hgIcTjBkD04A
29MSv3j1WlCpWSCIEs27dzJv3i5mrcp1hSXfDo84NYMzxEY9FRcSGPNaGiG0/5pG
gRe67qr5htHW8rYiTjJRc2b/Sp6D1f7+QThqcq010NwdrzE=
=v0su
-----END PGP SIGNATURE-----

--=separator
Content-Type: application/octet-stream; name="xsa520.patch"
Content-Disposition: attachment; filename="xsa520.patch"
Content-Transfer-Encoding: base64

RnJvbTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgpTdWJqZWN0OiBnbnR0YWI6IHBy
b3Blcmx5IGRyb3AgcGFnZSByZWYgb24gYSBHTlRUQUJfY2FjaGVfZmx1c2ggZXJyb3IgcGF0aAoK
T3JkaW5hcnkgZG9tYWlucyBhbHdheXMgaGF2ZSBhIGdyYW50IHRhYmxlLiBTeXN0ZW0gZG9tYWlu
cyBkb24ndCwgYnV0IHRoZXkKYWxzbyBkb24ndCBub3JtYWxseSAib3duIiBwYWdlcyAtIGV4Y2Vw
dCBmb3IgRE9NX0lPIGFuZCBET01fQ09XIG9uIHg4Ni4KClRoaXMgaXMgWFNBLTUyMCAvIENWRS0y
MDI2LTEwMjcwMC4KClJlcG9ydGVkLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0Bj
aXRyaXguY29tPgpSZXBvcnRlZC1ieTogWWVoeWVvbmcgTGVlIDx5aGxlZUBpc3NsYWIua29yZWEu
YWMua3I+ClNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCi0t
LSBhL3hlbi9jb21tb24vZ3JhbnRfdGFibGUuYworKysgYi94ZW4vY29tbW9uL2dyYW50X3RhYmxl
LmMKQEAgLTM2MjQsNiArMzYyNCw4IEBAIHN0YXRpYyBpbnQgX2NhY2hlX2ZsdXNoKGNvbnN0IGdu
dHRhYl9jYWMKICAgICBvd25lciA9IHBhZ2VfZ2V0X293bmVyX2FuZF9yZWZlcmVuY2UocGFnZSk7
CiAgICAgaWYgKCAhb3duZXIgfHwgIW93bmVyLT5ncmFudF90YWJsZSApCiAgICAgeworICAgICAg
ICBpZiAoIG93bmVyICkKKyAgICAgICAgICAgIHB1dF9wYWdlKHBhZ2UpOwogICAgICAgICByY3Vf
dW5sb2NrX2RvbWFpbihkKTsKICAgICAgICAgcmV0dXJuIC1FUEVSTTsKICAgICB9Cg==

--=separator--

