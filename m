Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90FA7C54F4C
	for <xen-devel@archiver.kernel.org>; Tue, 28 Jul 2026 12:06:20 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1372558.1620087 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wogZL-0000Pv-0v; Tue, 28 Jul 2026 12:05:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1372558.1620087; Tue, 28 Jul 2026 12:05:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wogZI-0000GE-H4; Tue, 28 Jul 2026 12:05:56 +0000
Received: by outflank-mailman (input) for mailman id 1372558;
 Tue, 28 Jul 2026 12:05:30 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrewcoop@xenbits.xen.org>)
 id 1wogYn-0003Yx-WB; Tue, 28 Jul 2026 12:05:26 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wogYn-00Ebq5-7I; Tue, 28 Jul 2026 14:05:25 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrewcoop@xenbits.xen.org>)
 id 6a689b05-5cb7-0a2a0a5109dd-0a2a45039fd6-2
 for <multiple-recipients>; Tue, 28 Jul 2026 14:05:25 +0200
Received: from [104.130.215.37] (helo=mail.xenproject.org)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrewcoop@xenbits.xen.org>)
 id 6a689b03-fae8-0a2a45030019-6882d725a78e-3
 for <multiple-recipients>; Tue, 28 Jul 2026 14:05:25 +0200
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <andrewcoop@xenbits.xen.org>) id 1wogYi-00DPEj-20;
 Tue, 28 Jul 2026 12:05:20 +0000
Received: from andrewcoop by xenbits.xenproject.org with local (Exim 4.96)
 (envelope-from <andrewcoop@xenbits.xen.org>) id 1wogYi-003Drz-0y;
 Tue, 28 Jul 2026 12:05:20 +0000
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
Subject: Xen Security Advisory 504 v2 (CVE-2026-62431) - Viridian STIMER
 division by zero
Message-Id: <E1wogYi-003Drz-0y@xenbits.xenproject.org>
Date: Tue, 28 Jul 2026 12:05:20 +0000
X-purgate-ID: tlsNG-33051d/1785240325-6E6CE4E9-78BE6C56/0/0
X-purgate-type: clean
X-purgate-size: 6429

--=separator
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

            Xen Security Advisory CVE-2026-62431 / XSA-504
                               version 2

                   Viridian STIMER division by zero

UPDATES IN VERSION 2
====================

Public release.

ISSUE DESCRIPTION
=================

The logic to handle periodic Viridian STIMERs performs a division with an
unchecked user-controlled divisor value, that can be set to zero to cause a #DE
fault.

IMPACT
======

Enabling Viridian STIMERs to unprivileged HVM guests can result in a Denial
of Service (DoS) affecting the entire host.

VULNERABLE SYSTEMS
==================

All Xen versions from 4.13 onwards are vulnerable.  Xen versions 4.12 and
earlier are not vulnerable.

Only HVM guests with Viridian STIMERs enabled can trigger the vulnerability.

MITIGATION
==========

Not enabling Viridian STIMERs for HVM guests will avoid the vulnerability.

Note Viridian extensions are not enabled by default.

RESOLUTION
==========

Applying the attached patch resolves this issue.

Note that patches for released versions are generally prepared to
apply to the stable branches, and may not apply cleanly to the most
recent release tarball.  Downstreams are encouraged to update to the
tip of the stable branch before applying these patches.

xsa504.patch           xen-unstable - Xen 4.17.x

$ sha256sum xsa504*
cc142e53866a27f3c97bd8532f42df2197f9e8e85fb3846b6fcd682d854e5689  xsa504.patch
$

DEPLOYMENT DURING EMBARGO
=========================

Deployment of the patches above (or others which are substantially similar) is
permitted during the embargo, even on public-facing systems with untrusted
guest users and administrators.

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

iQFABAEBCAAqFiEEI+MiLBRfRHX6gGCng/4UyVfoK9kFAmpomroMHHBncEB4ZW4u
b3JnAAoJEIP+FMlX6CvZiF4H+QFl08pzXWh5Zd2uOlbjYCaQMoDFeWSGCAkCcG8z
PlKv4yVLPwxUB0W5cPVV61M/fFDgihZh0usNZ/xm5aTt0uhPE31kXItsYRRLPpmg
zbV5OgUgIJxeAABML030lNjlAyLBpVculHAWbyFZdMh/xf0bQc1ty8U/xQDLU+IE
cohmtH8v6WvK2PxTA8nNj39EB9rUcz1gYInLh2QltW14di7+FUHGISxiIr/eNcUv
9d/at8ESSH1WNeSRSr+sbE0dMRxAQgoMa93GvU7sEvuZtdwOnnET8l1nVN/84kXM
sCMq6mjgVDUmSNOH2aBXxewimjp9DV0BLkmliqHrHDKer3s=
=intH
-----END PGP SIGNATURE-----

--=separator
Content-Type: application/octet-stream; name="xsa504.patch"
Content-Disposition: attachment; filename="xsa504.patch"
Content-Transfer-Encoding: base64

RnJvbSBiM2ZlN2JkM2JmNmMyYWM3MzI0ZWEwYjMzY2E2YWZjMzhkODFmMTU5
IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBSb2dlciBQYXUgTW9u
bmUgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgpEYXRlOiBGcmksIDEwIEp1bCAy
MDI2IDE1OjE4OjEyICswMjAwClN1YmplY3Q6IHg4Ni92aXJpZGlhbjogZW5z
dXJlIGNvdW50IGlzIGFsd2F5cyBzZXQgd2hlbiBzdGFydGluZyBhIHRpbWVy
Ck1JTUUtVmVyc2lvbjogMS4wCkNvbnRlbnQtVHlwZTogdGV4dC9wbGFpbjsg
Y2hhcnNldD1VVEYtOApDb250ZW50LVRyYW5zZmVyLUVuY29kaW5nOiA4Yml0
CgpPdGhlcndpc2UgaW4gcGVyaW9kaWMgbW9kZSBhIGRpdmlzaW9uIGJ5IDAg
d291bGQgaGFwcGVuIG9uIHRoZSBzZWNvbmQgY2FsbAp0byBzdGFydF9zdGlt
ZXIoKSB3aGVuIHVzaW5nIHBlcmlvZGljIG1vZGUuCgpOb3RlIHRoYXQgdGhl
IEh5cGVyViBzcGVjaWZpY2F0aW9uIHN0YXRlczogIldyaXRpbmcgdGhlIHZh
bHVlIHplcm8gdG8gdGhlCkNvdW50IHJlZ2lzdGVyIHdpbGwgc3RvcCB0aGUg
Y291bnRlciwgdGhlcmVieSBkaXNhYmxpbmcgdGhlIHRpbWVyLAppbmRlcGVu
ZGVudCBvZiB0aGUgc2V0dGluZyBvZiBBdXRvRW5hYmxlIGluIHRoZSBjb25m
aWd1cmF0aW9uIHJlZ2lzdGVyLiIKc28gYSB0aW1lciB3aXRoIGEgMCBjb3Vu
dCBzaG91bGQgbmV2ZXIgYmUgaW4gdGhlIGVuYWJsZWQgc3RhdGUuCgpUaGlz
IGlzIFhTQS01MDQgLyBDVkUtMjAyNi02MjQzMS4KCkZpeGVzOiAyNmZiYTNj
ODU1NzEgKCJ2aXJpZGlhbjogYWRkIGltcGxlbWVudGF0aW9uIG9mIHN5bnRo
ZXRpYyB0aW1lcnMiKQpTaWduZWQtb2ZmLWJ5OiBSb2dlciBQYXUgTW9ubsOp
IDxyb2dlci5wYXVAY2l0cml4LmNvbT4KUmV2aWV3ZWQtYnk6IEphbiBCZXVs
aWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KLS0tCiB4ZW4vYXJjaC94ODYvaHZt
L3ZpcmlkaWFuL3RpbWUuYyB8IDEzICsrKysrKysrKysrKy0KIDEgZmlsZSBj
aGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZm
IC0tZ2l0IGEveGVuL2FyY2gveDg2L2h2bS92aXJpZGlhbi90aW1lLmMgYi94
ZW4vYXJjaC94ODYvaHZtL3ZpcmlkaWFuL3RpbWUuYwppbmRleCA5MzExODU4
ZDYzYzAuLjE1ZjYyOWFmMGYzOSAxMDA2NDQKLS0tIGEveGVuL2FyY2gveDg2
L2h2bS92aXJpZGlhbi90aW1lLmMKKysrIGIveGVuL2FyY2gveDg2L2h2bS92
aXJpZGlhbi90aW1lLmMKQEAgLTE1NSw2ICsxNTUsMTQgQEAgc3RhdGljIHZv
aWQgc3RhcnRfc3RpbWVyKHN0cnVjdCB2aXJpZGlhbl9zdGltZXIgKnZzKQog
ICAgICAgICBwcmludGsoWEVOTE9HX0dfSU5GTyAiJXB2OiBWSVJJRElBTiBT
VElNRVIldTogZW5hYmxlZFxuIiwgdiwKICAgICAgICAgICAgICAgIHN0aW1l
cngpOwogCisgICAgaWYgKCAhdnMtPmNvdW50ICkKKyAgICB7CisgICAgICAg
IGdwcmludGsoWEVOTE9HX0VSUiwgIlZJUklESUFOIFNUSU1FUiBzdGFydGVk
IHdpdGggMCBjb3VudFxuIik7CisgICAgICAgIEFTU0VSVF9VTlJFQUNIQUJM
RSgpOworICAgICAgICBkb21haW5fY3Jhc2godi0+ZG9tYWluKTsKKyAgICAg
ICAgcmV0dXJuOworICAgIH0KKwogICAgIGlmICggdnMtPmNvbmZpZy5wZXJp
b2RpYyApCiAgICAgewogICAgICAgICAvKgpAQCAtMzY0LDcgKzM3Miw3IEBA
IGludCB2aXJpZGlhbl90aW1lX3dybXNyKHN0cnVjdCB2Y3B1ICp2LCB1aW50
MzJfdCBpZHgsIHVpbnQ2NF90IHZhbCkKIAogICAgICAgICB2cy0+Y29uZmln
LmFzX3VpbnQ2NCA9IHZhbDsKIAotICAgICAgICBpZiAoICF2cy0+Y29uZmln
LnNpbnR4ICkKKyAgICAgICAgaWYgKCAhdnMtPmNvbmZpZy5zaW50eCB8fCAh
dnMtPmNvdW50ICkKICAgICAgICAgICAgIHZzLT5jb25maWcuZW5hYmxlID0g
MDsKIAogICAgICAgICBpZiAoIHZzLT5jb25maWcuZW5hYmxlICkKQEAgLTU3
NSw2ICs1ODMsOSBAQCB2b2lkIHZpcmlkaWFuX3RpbWVfbG9hZF92Y3B1X2N0
eHQoCiAKICAgICAgICAgdnMtPmNvbmZpZy5hc191aW50NjQgPSBjdHh0LT5z
dGltZXJfY29uZmlnX21zcltpXTsKICAgICAgICAgdnMtPmNvdW50ID0gY3R4
dC0+c3RpbWVyX2NvdW50X21zcltpXTsKKyAgICAgICAgaWYgKCAhdnMtPmNv
bmZpZy5zaW50eCB8fCAhdnMtPmNvdW50ICkKKyAgICAgICAgICAgIC8qIFJl
amVjdCBlbmFibGluZyB3aXRoIGEgemVybyBzaW50eCBvciBjb3VudCBmaWVs
ZHMuICovCisgICAgICAgICAgICB2cy0+Y29uZmlnLmVuYWJsZSA9IDA7CiAg
ICAgfQogfQogCi0tIAoyLjUzLjAKCg==

--=separator--

