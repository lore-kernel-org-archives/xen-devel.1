Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 313B7CC6B03
	for <xen-devel@archiver.kernel.org>; Tue, 13 Oct 2026 12:28:56 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1447107.1663315 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGbcX-0005oE-V4; Tue, 13 Oct 2026 12:28:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1447107.1663315; Tue, 13 Oct 2026 12:28:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGbcX-0005ns-R9; Tue, 13 Oct 2026 12:28:41 +0000
Received: by outflank-mailman (input) for mailman id 1447107;
 Tue, 13 Oct 2026 12:28:39 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrewcoop@xenbits.xen.org>)
 id 1xGbcV-0005hb-LM; Tue, 13 Oct 2026 12:28:39 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGbcV-00DIG6-2E; Tue, 13 Oct 2026 14:28:39 +0200
Received: from [10.42.69.5] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrewcoop@xenbits.xen.org>)
 id 6ace23ef-2eae-0a2a0a5409dd-0a2a4505bd54-26
 for <multiple-recipients>; Tue, 13 Oct 2026 14:28:39 +0200
Received: from [104.130.215.37] (helo=mail.xenproject.org)
 by tlsNG-c201ff.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrewcoop@xenbits.xen.org>)
 id 6ace23f5-4cb1-0a2a45050019-6882d725d400-3
 for <multiple-recipients>; Tue, 13 Oct 2026 14:28:38 +0200
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <andrewcoop@xenbits.xen.org>)
 id 1xGbcR-00000003NGX-1oab; Tue, 13 Oct 2026 12:28:35 +0000
Received: from andrewcoop by xenbits.xenproject.org with local (Exim 4.98.2)
 (envelope-from <andrewcoop@xenbits.xen.org>)
 id 1xGbcR-0000000F8S9-0jrW; Tue, 13 Oct 2026 12:28:35 +0000
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
Subject: Xen Security Advisory 515 v2 (CVE-2026-79608) - x86/AMD:
 ineffectual Zenbleed workaround
Message-Id: <E1xGbcR-0000000F8S9-0jrW@xenbits.xenproject.org>
Date: Tue, 13 Oct 2026 12:28:35 +0000
X-purgate-ID: tlsNG-c201ff/1791894518-720AA2A1-ABEF8E1F/0/0
X-purgate-type: clean
X-purgate-size: 6623

--=separator
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

            Xen Security Advisory CVE-2026-79608 / XSA-515
                               version 2

               x86/AMD: ineffectual Zenbleed workaround

UPDATES IN VERSION 2
====================

Public release.

ISSUE DESCRIPTION
=================

The workaround for XSA-433 (Zenbleed, CVE-2023-20593) was later
re-worked to better integrate with other manipulations of the same MSR.
In this rework an inverted conditional was introduced, resulting in the
workaround to not be applied when needed and vice versa.

For more details, see:
  http://xenbits.xen.org/xsa/advisory-433.html

IMPACT
======

An attacker can exploit this bug to read data from different contexts on
the same core.  Examples of such data includes key material, cypher and
plaintext from the AES-NI instructions, or the contents of REP-MOVS
instructions, commonly used to implement memcpy().

VULNERABLE SYSTEMS
==================

Xen versions 4.19.4 and onwards, 4.20.3 and onwards, 4.21.1 and onwards,
and 4.22 are affected.  Xen versions 4.18, minor versions 4.19.3 and
earlier, minor versions 4.20.2 and earlier, and 4.21.0 are not affected.

The vulnerability can only be leveraged on systems running out-of-date
microcode.  Microcode fixing Zenbleed was published in late 2023.
Updated firmware subseqeuent to this, or e.g. updated amd-ucode from
linux-firmware (for the subset of CPUs covered by linux-firmware) are
not vulnerable.

The original issue and hence the applicability of the workaround is
specific to the AMD Zen2 microarchitecture.  AMD do not believe that
other microarchitectures are affected.

MITIGATION
==========

This issue can be mitigated by disabling AVX, either by booting Xen with
`cpuid=no-avx` on the command line, or by specifying `cpuid="host:avx=0"` in
the vm.cfg file of all untrusted VMs.  However, this will come with a
significant impact on the system and is not recommended for anyone able to
deploy the microcode or patch described below.

CREDITS
=======

This issue was discovered by Sashiko + Opus 5.0 and diagnosed as a
security issue by George Dunlap.

RESOLUTION
==========

Applying the attached patch resolves this issue.

Note that patches for released versions are generally prepared to
apply to the stable branches, and may not apply cleanly to the most
recent release tarball.  Downstreams are encouraged to update to the
tip of the stable branch before applying these patches.

xsa515.patch           xen-unstable - Xen 4.19.x

$ sha256sum xsa515*
d54c5f5443209e523c1d1b456063d105792058d402513bc1e56246b5938de6d8  xsa515.patch
$

DEPLOYMENT DURING EMBARGO
=========================

Deployment of the patches described above (or others which are
substantially similar) is permitted during the embargo, even on public-
facing systems with untrusted guest users and administrators.

HOWEVER, deployment of the mitigation is NOT permitted (except where
all the affected systems and VMs are administered and used only by
organisations which are members of the Xen Project Security Issues
Predisclosure List).  Specifically, deployment on public cloud systems
is NOT permitted.

This is because altering exposure of AVX is a guest visible configuration
change, which may lead to re-discovery of the issue.

Deployment of this mitigation is permitted only AFTER the embargo ends.

AND: Distribution of updated software is prohibited (except to other
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

iQFABAEBCAAqFiEEI+MiLBRfRHX6gGCng/4UyVfoK9kFAmrOIhsMHHBncEB4ZW4u
b3JnAAoJEIP+FMlX6CvZKrYIAIKTxPm+Rvb9K2SvRJoHgjFDGTG0OxXqWFDjPnUR
DKTx/URFmXCFT4PCGuAearWnkw25x0e80TdNfCrdHxDJzENSCcmb+5iIuM8nUtgo
hMwNON4YUWn0GhBe3fcgAdlmxwWfhIJZHWt0LDrZrO9Nr21hmgVhvzME2VtH0EkA
Yafi6ZixVwheA48w2to1cBjx27J5XucmvFoMgSRfW40YhpCmWDLDMv1F0vwxioyy
vWVrk7pfYEj8n/hiap2MoI/pTDD6PruF+lWsO1fzHFwZHcUPOU+rV/elfEAA027E
rRVsxob58ljY1IH/sMYOmSm7OQaGjau0kS7vC9kXtm7lmBQ=
=NxYd
-----END PGP SIGNATURE-----

--=separator
Content-Type: application/octet-stream; name="xsa515.patch"
Content-Disposition: attachment; filename="xsa515.patch"
Content-Transfer-Encoding: base64

RnJvbTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KU3ViamVjdDog
eDg2L2FtZDogRml4IGludmVydGVkIGNvbmRpdGlvbiBpbiB6ZW5ibGVlZF91c2VfY2hpY2tlbmJp
dCgpCgpUaGUgaWRlbnRpZmllZCBjb21taXQgaW52ZXJ0ZWQgdGhlIGNvbmRpdGlvbiB1bmRlciB3
aGljaCBYZW4gY2hvb3Nlcwp0byBzZXQgdGhlIFplbmJsZWVkIGNoaWNrZW5iaXQuCgpVbmRvIHRo
YXQsIGFuZCBsZWF2ZSBhIGJldHRlciBjb21tZW50IGV4cGxhaW5pbmcgd2h5LgoKRm91bmQgYnkg
QUkgcmV2aWV3IG9mIHRoZSByZWZlcmVuY2VkIGNvbW1pdC4KClRoaXMgaXMgWFNBLTUxNSAvIENW
RS0yMDI2LTc5NjA4LgoKRml4ZXM6IGQwYzc1ZGM0YzAyOCAoIng4Ni9hbWQ6IEZpeCByYWNlIGVk
aXRpbmcgREVfQ0ZHIikKQXNzaXN0ZWQtYnk6IFNhc2hpa28gKyBPcHVzIDUuMApSZXBvcnRlZC1i
eTogR2VvcmdlIER1bmxhcCA8ZHVubGFwZ0B1bWljaC5lZHU+ClNpZ25lZC1vZmYtYnk6IEFuZHJl
dyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+ClJldmlld2VkLWJ5OiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgpkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2NwdS9h
bWQuYyBiL3hlbi9hcmNoL3g4Ni9jcHUvYW1kLmMKaW5kZXggNzA3ODNjOWEwYWYwLi4xNDg4ODZm
ZTJlYTEgMTAwNjQ0Ci0tLSBhL3hlbi9hcmNoL3g4Ni9jcHUvYW1kLmMKKysrIGIveGVuL2FyY2gv
eDg2L2NwdS9hbWQuYwpAQCAtODg3LDcgKzg4NywxMiBAQCBzdGF0aWMgYm9vbCB6ZW5ibGVlZF91
c2VfY2hpY2tlbmJpdCh2b2lkKQogICAgICAgICByZXR1cm4gaXNfemVuMl91YXJjaCgpOwogICAg
IH0KIAotICAgIHJldHVybiAodWludDhfdCljdXJyX3JldiA+PSBmaXhlZF9yZXY7CisgICAgLyoK
KyAgICAgKiBaZW5ibGVlZCBjYW4gYmUgbWl0aWdhdGVkIGJ5IGRpc2FibGluZyBGbG9hdGluZy1Q
b2ludAorICAgICAqIE1vdi1FbGltaW5hdGlvbiwgYnV0IHRoaXMgaXMgZXhwZW5zaXZlLiAgT25s
eSBkbyBzbyB3aGVuIHdlCisgICAgICogZG9uJ3QgaGF2ZSBhIGZpeCBpbiBtaWNyb2NvZGUuCisg
ICAgICovCisgICAgcmV0dXJuICh1aW50OF90KWN1cnJfcmV2IDwgZml4ZWRfcmV2OwogfQogCiB2
b2lkIGFtZF9pbml0X2RlX2NmZyhjb25zdCBzdHJ1Y3QgY3B1aW5mb194ODYgKmMpCg==

--=separator--

