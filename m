Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BE4CC54F52
	for <xen-devel@archiver.kernel.org>; Tue, 28 Jul 2026 12:05:29 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1372479.1619939 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wogYf-0001zm-DP; Tue, 28 Jul 2026 12:05:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1372479.1619939; Tue, 28 Jul 2026 12:05:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wogYe-0001x4-Mf; Tue, 28 Jul 2026 12:05:16 +0000
Received: by outflank-mailman (input) for mailman id 1372479;
 Tue, 28 Jul 2026 12:05:14 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrewcoop@xenbits.xen.org>)
 id 1wogYb-0001KN-Fw; Tue, 28 Jul 2026 12:05:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wogYa-00EbnI-Ro; Tue, 28 Jul 2026 14:05:12 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrewcoop@xenbits.xen.org>)
 id 6a689af5-bab6-0a2a0a5309dd-0a2a4507dc4c-28
 for <multiple-recipients>; Tue, 28 Jul 2026 14:05:12 +0200
Received: from [104.130.215.37] (helo=mail.xenproject.org)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrewcoop@xenbits.xen.org>)
 id 6a689af7-b4ea-0a2a45070019-6882d725a2aa-3
 for <multiple-recipients>; Tue, 28 Jul 2026 14:05:12 +0200
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <andrewcoop@xenbits.xen.org>) id 1wogYW-00DP9S-0I;
 Tue, 28 Jul 2026 12:05:07 +0000
Received: from andrewcoop by xenbits.xenproject.org with local (Exim 4.96)
 (envelope-from <andrewcoop@xenbits.xen.org>) id 1wogYV-003DkN-2W;
 Tue, 28 Jul 2026 12:05:07 +0000
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
Subject: Xen Security Advisory 500 v2 (CVE-2026-62428) - grant-table: type
 confusion in grant-copy
Message-Id: <E1wogYV-003DkN-2W@xenbits.xenproject.org>
Date: Tue, 28 Jul 2026 12:05:07 +0000
X-purgate-ID: tlsNG-ef75cf/1785240312-370DDAE4-1BAE9ED8/0/0
X-purgate-type: clean
X-purgate-size: 9147

--=separator
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

            Xen Security Advisory CVE-2026-62428 / XSA-500
                               version 2

               grant-table: type confusion in grant-copy

UPDATES IN VERSION 2
====================

Public release.

ISSUE DESCRIPTION
=================

When grant-copy operations are processed, the respective grant may or may
not already be in use by another operation (a mapping or another copy).
For all copy operations the referenced guest frame is looked up.  When
another operation is already active for the grant (the grant is "pinned"),
what is being supplied back to actually carry out permission checks and
copy operation may not be consistent: The permission check may be carried
out on a page different from the one involved in the copy.

IMPACT
======

An unprivileged guest may be able to elevate its privileges to that of the
host.  Information leaks and Denial of Service (DoS) are possible as well.

VULNERABLE SYSTEMS
==================

All Xen versions from 4.2 onwards are vulnerable.  Xen versions 4.1 and
earlier are not vulnerable.

Xen versions 4.13 and newer offer a way to build Xen without grant table
support.  Such hypervisors (CONFIG_GRANT_TABLE turned off) are not
vulnerable.

MITIGATION
==========

There is no known mitigation.

CREDITS
=======

This issue was discovered by Roman S.

RESOLUTION
==========

Applying the appropriate attached patch resolves this issue.

Note that patches for released versions are generally prepared to
apply to the stable branches, and may not apply cleanly to the most
recent release tarball.  Downstreams are encouraged to update to the
tip of the stable branch before applying these patches.

xsa500.patch           xen-unstable - Xen 4.18.x
xsa500-4.17.patch      Xen 4.17.x

$ sha256sum xsa500*
e09e06ef5d4044b4c6104ae83d5e509d45495d7bab1da73f2beb7a916d24f462  xsa500.patch
5fabb02fd4cc62f58a07a8322883b04c638832f65fdf0216a0efde6229d1fd73  xsa500-4.17.patch
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

iQFABAEBCAAqFiEEI+MiLBRfRHX6gGCng/4UyVfoK9kFAmpomrEMHHBncEB4ZW4u
b3JnAAoJEIP+FMlX6CvZ4B4H/1dGUPMt2yREv0C6uHyxT50MoAwaZ01A6Dwm2CNm
2eIjsJGeF3mtlw0T4c6hCmF7fcULFJMcPkJi09TS38ADIOBpivgP+tRkRa+ZRPtG
E6vpRtlHmD57WVPWRfTM0uk6UL/CCyvlUILR8A9lu7tF5PFef3Dzeiqpuh/rMNPx
DmEcn3Mw8DpKvkoMIVJd1TgAtFX0KwWwByxClUIV84K2SBvcNxVoiw2fkKkx1HRa
lB7sVEkKliUyIN/uWmh1VcLshQuulHYNcnkq7ErCEIQqo30ay6WER6W5TS0cfh/F
OUSQWlWzkht2GY0pRXp5UQaBFc8UCsOnVty8DhvLrCyllSk=
=gRtn
-----END PGP SIGNATURE-----

--=separator
Content-Type: application/octet-stream; name="xsa500.patch"
Content-Disposition: attachment; filename="xsa500.patch"
Content-Transfer-Encoding: base64

RnJvbTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgpTdWJqZWN0
OiBnbnR0YWI6IGNoZWNrIHZhbHVlcyBhZ2FpbnN0IGFjdGl2ZSBlbnRyeSB3
aGVuIGNvcHlpbmcgYW4KIGFscmVhZHktcGlubmVkIG9uZQoKYWNxdWlyZV9n
cmFudF9mb3JfY29weSgpIHBhc3NlcyB0byBpdHMgY2FsbGVyIGJvdGggYW4g
TUZOIGFuZCBhIHN0cnVjdApwYWdlX2luZm8gKi4gVGhlIHR3byByZWFsbHkg
bmVlZCB0byBiZSBpbiBzeW5jIGZvciB0aGUgZ2V0X3BhZ2UoKQp1bmRlcmx5
aW5nIGdldF9wYWdlZF9mcmFtZSgpIGFuZCBnZXRfcGFnZV90eXBlKCkgKGJv
dGggYWN0aW5nIG9uIHRoZQpwYXNzZWQgYmFjayBzdHJ1Y3QgcGFnZV9pbmZv
ICopIGFuZCB0aGUgbWFwX2RvbWFpbl9wYWdlKCkgKGFjdGluZyBvbiB0aGUK
cGFzc2VkIGJhY2sgTUZOKSB0byBhY2hpZXZlIHRoZSBpbnRlbmRlZCBlZmZl
Y3QuCgpHbyBmdXJ0aGVyIGFuZCBhbHNvIGNoZWNrIG90aGVyIHByb3BlcnRp
ZXM6IEdURl90cmFuc2l0aXZlIC8gR1RGX3N1Yl9wYWdlCm1heSBoYXZlIGJl
ZW4gZmxpcHBlZCBpbiB0aGUgc2hhcmVkIGVudHJ5LCBzbyByZXNwZWN0aXZl
IGZpZWxkcyAvIHZhbHVlcwphbHNvIG1heSBub3QgbWF0Y2guCgpUaGUgb25l
IGZpZWxkIHdoaWNoIHdlIGNhbiBiZSBzdXJlIGRvZXMgbWF0Y2ggKGFzIGl0
IHdhcyBjaGVja2VkIGVhcmxpZXIKaW4gdGhlIGZ1bmN0aW9uKSBpcyAtPmRv
bWlkLiBBZGQgYW4gYXNzZXJ0aW9uIG5ldmVydGhlbGVzcy4KClRoaXMgaXMg
Q1ZFLTIwMjYtNjI0MjggLyBYU0EtNTAwLgoKRml4ZXM6IGQ4Y2JlY2IxZWVl
ZCAoImdyYW50LXRhYmxlczogVXNlIGdldF9wYWdlX2Zyb21fZ2ZuKCkgaW5z
dGVhZCBvZiBnZXRfZ2ZuKCkvcHV0X2dmbiIpClNpZ25lZC1vZmYtYnk6IEph
biBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KUmV2aWV3ZWQtYnk6IEp1
ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KCmRpZmYgLS1naXQgYS94
ZW4vY29tbW9uL2dyYW50X3RhYmxlLmMgYi94ZW4vY29tbW9uL2dyYW50X3Rh
YmxlLmMKaW5kZXggMTdlMWFmOWZjZjhhLi5iODNkZDdiYzJhZjIgMTAwNjQ0
Ci0tLSBhL3hlbi9jb21tb24vZ3JhbnRfdGFibGUuYworKysgYi94ZW4vY29t
bW9uL2dyYW50X3RhYmxlLmMKQEAgLTI4MDQsNiArMjgwNCwyMSBAQCBhY3F1
aXJlX2dyYW50X2Zvcl9jb3B5KAogICAgICAgICAgICAgYWN0LT50cmFuc19n
cmVmID0gdHJhbnNfZ3JlZjsKICAgICAgICAgICAgIGFjdC0+bWZuID0gZ3Jh
bnRfbWZuOwogICAgICAgICB9CisgICAgICAgIGVsc2UgaWYgKCAhbWZuX2Vx
KGFjdC0+bWZuLCBncmFudF9tZm4pIHx8CisgICAgICAgICAgICAgICAgICBh
Y3QtPnNyY19kb21pZCAhPSB0ZC0+ZG9tYWluX2lkIHx8CisgICAgICAgICAg
ICAgICAgICBhY3QtPnRyYW5zX2dyZWYgIT0gdHJhbnNfZ3JlZiB8fAorICAg
ICAgICAgICAgICAgICAgKGFjdC0+aXNfc3ViX3BhZ2UgJiYKKyAgICAgICAg
ICAgICAgICAgICAoIWlzX3N1Yl9wYWdlIHx8CisgICAgICAgICAgICAgICAg
ICAgIGFjdC0+c3RhcnQgIT0gdHJhbnNfcGFnZV9vZmYgfHwKKyAgICAgICAg
ICAgICAgICAgICAgYWN0LT5sZW5ndGggIT0gdHJhbnNfbGVuZ3RoKSkgKQor
ICAgICAgICB7CisgICAgICAgICAgICBwdXRfcGFnZSgqcGFnZSk7CisgICAg
ICAgICAgICAqcGFnZSA9IE5VTEw7CisgICAgICAgICAgICByYyA9IEdOVFNU
X2dlbmVyYWxfZXJyb3I7CisgICAgICAgICAgICBnb3RvIHVubG9ja19vdXRf
Y2xlYXI7CisgICAgICAgIH0KKyAgICAgICAgZWxzZQorICAgICAgICAgICAg
QVNTRVJUKGFjdC0+ZG9taWQgPT0gbGRvbSk7CiAgICAgfQogICAgIGVsc2UK
ICAgICB7Cg==

--=separator
Content-Type: application/octet-stream; name="xsa500-4.17.patch"
Content-Disposition: attachment; filename="xsa500-4.17.patch"
Content-Transfer-Encoding: base64

RnJvbTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgpTdWJqZWN0
OiBnbnR0YWI6IGNoZWNrIHZhbHVlcyBhZ2FpbnN0IGFjdGl2ZSBlbnRyeSB3
aGVuIGNvcHlpbmcgYW4KIGFscmVhZHktcGlubmVkIG9uZQoKYWNxdWlyZV9n
cmFudF9mb3JfY29weSgpIHBhc3NlcyB0byBpdHMgY2FsbGVyIGJvdGggYW4g
TUZOIGFuZCBhIHN0cnVjdApwYWdlX2luZm8gKi4gVGhlIHR3byByZWFsbHkg
bmVlZCB0byBiZSBpbiBzeW5jIGZvciB0aGUgZ2V0X3BhZ2UoKQp1bmRlcmx5
aW5nIGdldF9wYWdlZF9mcmFtZSgpIGFuZCBnZXRfcGFnZV90eXBlKCkgKGJv
dGggYWN0aW5nIG9uIHRoZQpwYXNzZWQgYmFjayBzdHJ1Y3QgcGFnZV9pbmZv
ICopIGFuZCB0aGUgbWFwX2RvbWFpbl9wYWdlKCkgKGFjdGluZyBvbiB0aGUK
cGFzc2VkIGJhY2sgTUZOKSB0byBhY2hpZXZlIHRoZSBpbnRlbmRlZCBlZmZl
Y3QuCgpHbyBmdXJ0aGVyIGFuZCBhbHNvIGNoZWNrIG90aGVyIHByb3BlcnRp
ZXM6IEdURl90cmFuc2l0aXZlIC8gR1RGX3N1Yl9wYWdlCm1heSBoYXZlIGJl
ZW4gZmxpcHBlZCBpbiB0aGUgc2hhcmVkIGVudHJ5LCBzbyByZXNwZWN0aXZl
IGZpZWxkcyAvIHZhbHVlcwphbHNvIG1heSBub3QgbWF0Y2guCgpUaGUgb25l
IGZpZWxkIHdoaWNoIHdlIGNhbiBiZSBzdXJlIGRvZXMgbWF0Y2ggKGFzIGl0
IHdhcyBjaGVja2VkIGVhcmxpZXIKaW4gdGhlIGZ1bmN0aW9uKSBpcyAtPmRv
bWlkLiBBZGQgYW4gYXNzZXJ0aW9uIG5ldmVydGhlbGVzcy4KClRoaXMgaXMg
Q1ZFLTIwMjYtNjI0MjggLyBYU0EtNTAwLgoKRml4ZXM6IGQ4Y2JlY2IxZWVl
ZCAoImdyYW50LXRhYmxlczogVXNlIGdldF9wYWdlX2Zyb21fZ2ZuKCkgaW5z
dGVhZCBvZiBnZXRfZ2ZuKCkvcHV0X2dmbiIpClNpZ25lZC1vZmYtYnk6IEph
biBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KUmV2aWV3ZWQtYnk6IEp1
ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KCmRpZmYgLS1naXQgYS94
ZW4vY29tbW9uL2dyYW50X3RhYmxlLmMgYi94ZW4vY29tbW9uL2dyYW50X3Rh
YmxlLmMKaW5kZXggY2M3ZjJiZDgyMTAzLi5iZjFiMGQzNjc3NDYgMTAwNjQ0
Ci0tLSBhL3hlbi9jb21tb24vZ3JhbnRfdGFibGUuYworKysgYi94ZW4vY29t
bW9uL2dyYW50X3RhYmxlLmMKQEAgLTI3NTUsNiArMjc1NSwyMSBAQCBhY3F1
aXJlX2dyYW50X2Zvcl9jb3B5KAogICAgICAgICAgICAgYWN0LT50cmFuc19n
cmVmID0gdHJhbnNfZ3JlZjsKICAgICAgICAgICAgIGFjdC0+bWZuID0gZ3Jh
bnRfbWZuOwogICAgICAgICB9CisgICAgICAgIGVsc2UgaWYgKCAhbWZuX2Vx
KGFjdC0+bWZuLCBncmFudF9tZm4pIHx8CisgICAgICAgICAgICAgICAgICBh
Y3QtPnRyYW5zX2RvbWFpbiAhPSB0ZCB8fAorICAgICAgICAgICAgICAgICAg
YWN0LT50cmFuc19ncmVmICE9IHRyYW5zX2dyZWYgfHwKKyAgICAgICAgICAg
ICAgICAgIChhY3QtPmlzX3N1Yl9wYWdlICYmCisgICAgICAgICAgICAgICAg
ICAgKCFpc19zdWJfcGFnZSB8fAorICAgICAgICAgICAgICAgICAgICBhY3Qt
PnN0YXJ0ICE9IHRyYW5zX3BhZ2Vfb2ZmIHx8CisgICAgICAgICAgICAgICAg
ICAgIGFjdC0+bGVuZ3RoICE9IHRyYW5zX2xlbmd0aCkpICkKKyAgICAgICAg
eworICAgICAgICAgICAgcHV0X3BhZ2UoKnBhZ2UpOworICAgICAgICAgICAg
KnBhZ2UgPSBOVUxMOworICAgICAgICAgICAgcmMgPSBHTlRTVF9nZW5lcmFs
X2Vycm9yOworICAgICAgICAgICAgZ290byB1bmxvY2tfb3V0X2NsZWFyOwor
ICAgICAgICB9CisgICAgICAgIGVsc2UKKyAgICAgICAgICAgIEFTU0VSVChh
Y3QtPmRvbWlkID09IGxkb20pOwogICAgIH0KICAgICBlbHNlCiAgICAgewo=

--=separator--

