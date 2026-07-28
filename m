Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FDDAC53219
	for <xen-devel@archiver.kernel.org>; Tue, 28 Jul 2026 12:05:16 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1372466.1619862 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wogYR-000834-PZ; Tue, 28 Jul 2026 12:05:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1372466.1619862; Tue, 28 Jul 2026 12:05:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wogYR-00081v-H4; Tue, 28 Jul 2026 12:05:03 +0000
Received: by outflank-mailman (input) for mailman id 1372466;
 Tue, 28 Jul 2026 12:05:02 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrewcoop@xenbits.xen.org>)
 id 1wogYP-000752-8s; Tue, 28 Jul 2026 12:05:01 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wogYO-004OSi-Kv; Tue, 28 Jul 2026 14:05:00 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrewcoop@xenbits.xen.org>)
 id 6a689ae7-5cb7-0a2a0a5109dd-0a2a450ad736-18
 for <multiple-recipients>; Tue, 28 Jul 2026 14:05:00 +0200
Received: from [104.130.215.37] (helo=mail.xenproject.org)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrewcoop@xenbits.xen.org>)
 id 6a689aeb-f2d2-0a2a450a0019-6882d725aa00-3
 for <multiple-recipients>; Tue, 28 Jul 2026 14:05:00 +0200
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <andrewcoop@xenbits.xen.org>) id 1wogYJ-00DP8U-1f;
 Tue, 28 Jul 2026 12:04:55 +0000
Received: from andrewcoop by xenbits.xenproject.org with local (Exim 4.96)
 (envelope-from <andrewcoop@xenbits.xen.org>) id 1wogYJ-003Ddz-0e;
 Tue, 28 Jul 2026 12:04:55 +0000
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
Subject: Xen Security Advisory 497 v2 (CVE-2026-42494,CVE-2026-42495,CVE-2026-62423,CVE-2026-62424,CVE-2026-62425)
 - buffer overruns in libfsimage iso9660 handling
Message-Id: <E1wogYJ-003Ddz-0e@xenbits.xenproject.org>
Date: Tue, 28 Jul 2026 12:04:55 +0000
X-purgate-ID: tlsNG-4011c0/1785240300-4BED2CFC-6E1EE151/0/0
X-purgate-type: clean
X-purgate-size: 13351

--=separator
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

 Xen Security Advisory CVE-2026-42494,CVE-2026-42495,CVE-2026-62423,CVE-2026-62424,CVE-2026-62425 / XSA-497
                                                  version 2

            buffer overruns in libfsimage iso9660 handling

UPDATES IN VERSION 2
====================

Public release.

ISSUE DESCRIPTION
=================

The directory and Rock Ridge / SUSP walk in libfsimage's iso9660 driver
derives several lengths directly from attacker-controlled on-disk fields
without validating them:

 * The directory loop itself assumes a good record length.  This is
   CVE-2026-42494.

 * The calculation of the System Use area may underflow.  This is
   CVE-2026-42495.

 * The Rock Ridge extension loop assumes a good (inner) record length.
   This is CVE-2026-62423.

 * The Rock Ridge NM record processing assumes a good entry length.
   This is CVE-2026-62424.

 * The Rock Ridge CE record processing assumes a good size and offset.
   This is CVE-2026-62425.

IMPACT
======

A guest using pygrub can escalate its privilege to that of the domain
construction tools (i.e., normally, to control of the host).

If the mechanism introduced by XSA-443 (see the mitigation section below)
is in use, then the guest can only escalate to this limited context.

VULNERABLE SYSTEMS
==================

All Xen versions from at least 3.2 onwards are affected.  Older versions
have not been inspected.

MITIGATION
==========

XSA-443 added a mechanism to run pygrub de-privileged.  Using this mode
will mitigate the vulnerability.

Ensuring that guests do not use the pygrub bootloader will avoid this
vulnerability.

For cases where the PV guest is known to be 64bit, and uses grub2 as a
bootloader, pvgrub is a suitable alternative to pygrub.

Running only HVM or PVH guests will avoid the vulnerability.

CREDITS
=======

This issue was discovered by Syed Abdul Khaliq of BugQore.

RESOLUTION
==========

Applying the attached patch resolves this issue.

Note that patches for released versions are generally prepared to
apply to the stable branches, and may not apply cleanly to the most
recent release tarball.  Downstreams are encouraged to update to the
tip of the stable branch before applying these patches.

xsa497.patch           xen-unstable - Xen 4.17.x

$ sha256sum xsa497*
65925ac5a322b9eacc8538d6486e3e37ddcb83fe6f02f61c18216ccd2770f964  xsa497.patch
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

iQFABAEBCAAqFiEEI+MiLBRfRHX6gGCng/4UyVfoK9kFAmpomq0MHHBncEB4ZW4u
b3JnAAoJEIP+FMlX6CvZyesH/0dz6MuK3DsILiWvYuGNuX//RcdpBlQtLmyQR382
vpoicCuEAJLJlZFZsPddIxjTxte77nbFs2Ih51br95J//ou6sX7q6V9wDGt4EHDK
pF4ECI8SCkHDszogIDGDFiSdi7V7VknGpLCjFtINaAcaRLMHx+MMcdMV80IZyoXw
8p2XY7xvaXyo90I1FiecN7yU0H49sYJswLvihJU55hDuBZ25HLe2K59UGs2uaVm2
J0QKIBi3k20kZ5p9diny+cjU81fVu8LwGPKjvK3KUoyNnFsNbsO5owrAq2w/FSbE
1K54Lj6FXk0w08c4S0kz4zLXKLhSeCl7hFvqUpmQAXaN7ew=
=0lw8
-----END PGP SIGNATURE-----

--=separator
Content-Type: application/octet-stream; name="xsa497.patch"
Content-Disposition: attachment; filename="xsa497.patch"
Content-Transfer-Encoding: base64

RnJvbTogU3llZCBBYmR1bCBLaGFsaXEgPGFiZHVsQGJ1Z3FvcmUuY29tPgpT
dWJqZWN0OiBsaWJmc2ltYWdlL2lzbzk2NjA6IGhhcmRlbiBSb2NrIFJpZGdl
IFNVU1AgcGFyc2luZyBhZ2FpbnN0IG1hbGZvcm1lZCBsZW5ndGhzCgpUaGUg
ZGlyZWN0b3J5IGFuZCBSb2NrIFJpZGdlIC8gU1VTUCB3YWxrIGluIGlzbzk2
NjBfZGlyKCkgZGVyaXZlcyBzZXZlcmFsCmxlbmd0aHMgZGlyZWN0bHkgZnJv
bSBhdHRhY2tlci1jb250cm9sbGVkIG9uLWRpc2sgZmllbGRzIHdpdGhvdXQg
dmFsaWRhdGluZwp0aGVtLiAgbGliZnNpbWFnZSBpcyB1c2VkIGJ5IHB5Z3J1
Yiwgd2hpY2ggcGFyc2VzIHRoZSBmaWxlc3lzdGVtIG9mIGFuCnVudHJ1c3Rl
ZCBndWVzdCBkaXNrIGltYWdlIGZyb20gZG9tMCwgc28gdGhlc2UgYXJlIHJl
YWNoYWJsZSBhY3Jvc3MgYSB0cnVzdApib3VuZGFyeS4KCkZpdmUgcmVsYXRl
ZCBwcm9ibGVtcyBhcmUgYWRkcmVzc2VkOgoKICAqIFRoZSBkaXJlY3Rvcnkg
cmVjb3JkIGxvb3AgYWR2YW5jZXMgYnkKCiAgICAgICAgaWRyID0gKGNoYXIg
KilpZHIgKyBpZHItPmxlbmd0aC5sCgogICAgYW5kIG9ubHkgc3RvcHMgb24g
bGVuZ3RoLmwgPT0gMC4gIEEgcmVjb3JkIHdob3NlIGxlbmd0aCBpcyBzbWFs
bGVyIHRoYW4KICAgIHRoZSBmaXhlZCBwYXJ0IG9mIHRoZSBvbi1kaXNrIGxh
eW91dCBjYW5ub3QgaG9sZCBpdHMgb3duIG1hbmRhdG9yeQogICAgZmllbGRz
LCB5ZXQgdGhlIGJvZHkgc3RpbGwgcmVhZHMgbmFtZV9sZW4vZXh0ZW50L3Np
emUgYW5kIGNvbXB1dGVzIHRoZQogICAgU3lzdGVtIFVzZSBhcmVhIGxlbmd0
aCBmcm9tIGl0LiAgUmVxdWlyZSBsZW5ndGggdG8gY292ZXIgYXQgbGVhc3Qg
dGhlCiAgICBmaXhlZCByZWNvcmQgKHNpemVvZigqaWRyKSAtIHNpemVvZihp
ZHItPm5hbWUpKSBiZWZvcmUgZW50ZXJpbmcgdGhlIGJvZHkuCgogICAgVGhp
cyBpcyBDVkUtMjAyNi00MjQ5NC4KCiAgKiBUaGUgU3lzdGVtIFVzZSBhcmVh
IGxlbmd0aCBpcyBjb21wdXRlZCBiZWZvcmUgdGhlIGlubmVyIGxvb3AgYXMK
CiAgICAgICAgcnJfbGVuID0gaWRyLT5sZW5ndGgubCAtIGlkci0+bmFtZV9s
ZW4ubAogICAgICAgICAgICAgICAgIC0gc2l6ZW9mKHN0cnVjdCBpc29fZGly
ZWN0b3J5X3JlY29yZCkgKyBzaXplb2YoaWRyLT5uYW1lKTsKCiAgICBpbiB1
bnNpZ25lZCBhcml0aG1ldGljLiAgSWYgbGVuZ3RoLmwgaXMgc21hbGxlciB0
aGFuIG5hbWVfbGVuLmwgcGx1cyB0aGUKICAgIGZpeGVkIHJlY29yZCBzaXpl
LCBycl9sZW4gdW5kZXJmbG93cyB0byBhIGh1Z2UgdmFsdWUgYW5kIHRoZSB3
aG9sZSBTVVNQCiAgICB3YWxrIHJ1bnMgb2ZmIHRoZSBkaXJlY3RvcnkgYnVm
ZmVyLiAgR3VhcmQgdGhlIHN1YnRyYWN0aW9uIGFuZCB0cmVhdCBzdWNoCiAg
ICByZWNvcmRzIGFzIGhhdmluZyBubyBTeXN0ZW0gVXNlIGFyZWEuCgogICAg
VGhpcyBpcyBDVkUtMjAyNi00MjQ5NS4KCiAgKiBJbnNpZGUgdGhlIGxvb3As
IGVhY2ggZW50cnkgaXMgY29uc3VtZWQgd2l0aAoKICAgICAgICBycl9sZW4g
LT0gcnJfcHRyLnJyLT5sZW47CiAgICAgICAgcnJfcHRyLnB0ciArPSBycl9w
dHIucnItPmxlbjsKCiAgICB3aXRoIG5vIGxvd2VyIG9yIHVwcGVyIGJvdW5k
IG9uIHRoZSBlbnRyeSdzIG93biBsZW4gYnl0ZS4gIEEgbGVuIG9mIDAKICAg
IHNwaW5zIGZvcmV2ZXI7IGEgbGVuIGdyZWF0ZXIgdGhhbiB0aGUgcmVtYWlu
aW5nIHJyX2xlbiB1bmRlcmZsb3dzIGl0IGFuZAogICAgd2Fsa3MgcGFzdCB0
aGUgYnVmZmVyLiAgVmFsaWRhdGUgNCA8PSBsZW4gPD0gcnJfbGVuIGF0IHRo
ZSB0b3Agb2YgdGhlCiAgICBsb29wIGFuZCBzdG9wIG9uIHZpb2xhdGlvbjog
YSBzdHJ1Y3R1cmFsbHkgYnJva2VuIGVudHJ5IHN0cmVhbSBjYW5ub3QgYmUK
ICAgIGFkdmFuY2VkIHJlbGlhYmx5LCBzbyBjb250aW51aW5nIGlzIG5vdCBt
ZWFuaW5nZnVsLgoKICAgIFRoaXMgaXMgQ1ZFLTIwMjYtNjI0MjMuCgogICog
VGhlIE5NIGhhbmRsZXIgc3VidHJhY3RlZCB0aGUgNS1ieXRlIFNVU1AvTk0g
aGVhZGVyIGZyb20gbGVuIHdpdGhvdXQgYQogICAgbG93ZXItYm91bmQgY2hl
Y2ssIHVuZGVyZmxvd2luZyBuYW1lX2xlbiAodGhlIG9yaWdpbmFsIHJlcG9y
dCkuICBUaGUKICAgIGdlbmVyaWMgY2hlY2sgYWJvdmUgb25seSBndWFyYW50
ZWVzIGxlbiA+PSA0OyBOTSBoYXMgYW4gZXh0cmEgZmxhZ3MgYnl0ZSwKICAg
IHNvIGtlZXAgYW4gTk0tc3BlY2lmaWMgbGVuID49IDUgY2hlY2suCgogICAg
VGhpcyBpcyBDVkUtMjAyNi02MjQyNC4KCiAgKiBUaGUgQ0UgY29udGludWF0
aW9uIHJlc2V0cyBycl9wdHIvcnJfbGVuIGZyb20gY2Uub2Zmc2V0IGFuZCBj
ZS5zaXplLCBib3RoCiAgICBpbWFnZS1jb250cm9sbGVkLCBpbnRvIHRoZSBm
aXhlZCBzaW5nbGUtc2VjdG9yIFJSQ09OVF9CVUYgd2l0aCBubyBib3VuZHMK
ICAgIGNoZWNrLiAgUmVqZWN0IGEgd2luZG93IHRoYXQgZG9lcyBub3QgZml0
IGluIHRoZSBidWZmZXIuCgogICAgVGhpcyBpcyBDVkUtMjAyNi02MjQyNS4K
ClRoaXMgaXMgWFNBLTQ5Ny4KClNpZ25lZC1vZmYtYnk6IFN5ZWQgQWJkdWwg
S2hhbGlxIDxhYmR1bEBidWdxb3JlLmNvbT4KUmV2aWV3ZWQtYnk6IEphbiBC
ZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KCi0tLSBhL3Rvb2xzL2xpYmZz
aW1hZ2UvaXNvOTY2MC9mc3lzX2lzbzk2NjAuYworKysgYi90b29scy9saWJm
c2ltYWdlL2lzbzk2NjAvZnN5c19pc285NjYwLmMKQEAgLTE4MCw3ICsxODAs
MTUgQEAgaXNvOTY2MF9kaXIgKGZzaV9maWxlX3QgKmZmaSwgY2hhciAqZGly
bgogCSAgZXh0ZW50Kys7CiAKIAkgIGlkciA9IChzdHJ1Y3QgaXNvX2RpcmVj
dG9yeV9yZWNvcmQgKilESVJSRUM7Ci0JICBmb3IgKDsgaWRyLT5sZW5ndGgu
bCA+IDA7CisJICAvKgorCSAgICogIGxlbmd0aCBpcyB0YWtlbiB2ZXJiYXRp
bSBmcm9tIHRoZSAodW50cnVzdGVkKSBpbWFnZS4gIEEgcmVjb3JkCisJICAg
KiAgc2hvcnRlciB0aGFuIHRoZSBmaXhlZCBwYXJ0IG9mIHRoZSBvbi1kaXNr
IGxheW91dCBjYW5ub3QgaG9sZCBpdHMKKwkgICAqICBvd24gbWFuZGF0b3J5
IGZpZWxkcyAobmFtZV9sZW4sIGV4dGVudCwgc2l6ZSwgLi4uKSwgd2hpY2gg
dGhlIGxvb3AKKwkgICAqICBib2R5IHJlYWRzIGJlbG93OyBzdG9wIHRoZSB3
YWxrIHJhdGhlciB0aGFuIGRlcmVmZXJlbmNlIHBhc3QgaXQuCisJICAgKi8K
KwkgIGZvciAoOyBpZHItPmxlbmd0aC5sID49IHNpemVvZigqaWRyKSAtIHNp
emVvZihpZHItPm5hbWUpCisJCSAmJiBpZHItPmxlbmd0aC5sCisJCSAgICA+
PSBzaXplb2YoKmlkcikgLSBzaXplb2YoaWRyLT5uYW1lKSArIGlkci0+bmFt
ZV9sZW4ubDsKIAkgICAgICAgaWRyID0gKHN0cnVjdCBpc29fZGlyZWN0b3J5
X3JlY29yZCAqKSgoY2hhciAqKWlkciArIGlkci0+bGVuZ3RoLmwpICkKIAkg
ICAgewogCSAgICAgIGNvbnN0IGNoYXIgKm5hbWUgPSAoY29uc3QgY2hhciAq
KWlkci0+bmFtZTsKQEAgLTIwMSwyMSArMjA5LDM5IEBAIGlzbzk2NjBfZGly
IChmc2lfZmlsZV90ICpmZmksIGNoYXIgKmRpcm4KIAkJfQogCiAJICAgICAg
LyoKLQkgICAgICAgKiAgUGFyc2UgUm9jay1SaWRnZSBleHRlbnNpb24KKwkg
ICAgICAgKiAgUGFyc2UgUm9jay1SaWRnZSBleHRlbnNpb24uCisJICAgICAg
ICoKKwkgICAgICAgKiAgbGVuZ3RoIGFuZCBuYW1lX2xlbiBhcmUgdGFrZW4g
dmVyYmF0aW0gZnJvbSB0aGUgKHVudHJ1c3RlZCkKKwkgICAgICAgKiAgaW1h
Z2UuICBSZWplY3QgYSByZWNvcmQgd2hvc2UgbmFtZSB3b3VsZCBhbHJlYWR5
IG92ZXJydW4gdGhlCisJICAgICAgICogIGZpeGVkIG9uLWRpc2sgbGF5b3V0
LCBzbyB0aGF0IHRoZSBTeXN0ZW0gVXNlIGFyZWEgbGVuZ3RoIGRvZXMKKwkg
ICAgICAgKiAgbm90IHVuZGVyZmxvdyB0byBhIGh1Z2UgdmFsdWUgYmVsb3cu
CiAJICAgICAgICovCi0JICAgICAgcnJfbGVuID0gKGlkci0+bGVuZ3RoLmwg
LSBpZHItPm5hbWVfbGVuLmwKLQkJCS0gc2l6ZW9mKHN0cnVjdCBpc29fZGly
ZWN0b3J5X3JlY29yZCkKLQkJCSsgc2l6ZW9mKGlkci0+bmFtZSkpOworCSAg
ICAgIGlmIChpZHItPmxlbmd0aC5sIDwgaWRyLT5uYW1lX2xlbi5sCisJCSAg
KyBzaXplb2Yoc3RydWN0IGlzb19kaXJlY3RvcnlfcmVjb3JkKSAtIHNpemVv
ZihpZHItPm5hbWUpKQorCQlycl9sZW4gPSAwOworCSAgICAgIGVsc2UKKwkJ
cnJfbGVuID0gKGlkci0+bGVuZ3RoLmwgLSBpZHItPm5hbWVfbGVuLmwKKwkJ
CSAgLSBzaXplb2Yoc3RydWN0IGlzb19kaXJlY3RvcnlfcmVjb3JkKQorCQkJ
ICArIHNpemVvZihpZHItPm5hbWUpKTsKIAkgICAgICBycl9wdHIucHRyID0g
KChjaGFyICopaWRyICsgaWRyLT5uYW1lX2xlbi5sCiAJCQkgICAgKyBzaXpl
b2Yoc3RydWN0IGlzb19kaXJlY3RvcnlfcmVjb3JkKQogCQkJICAgIC0gc2l6
ZW9mKGlkci0+bmFtZSkpOwotCSAgICAgIGlmIChycl9wdHIuaSAmIDEpCisJ
ICAgICAgaWYgKChycl9wdHIuaSAmIDEpICYmIHJyX2xlbikKIAkJcnJfcHRy
LmkrKywgcnJfbGVuLS07CiAJICAgICAgY2VfcHRyID0gTlVMTDsKIAkgICAg
ICBycl9mbGFnID0gUlJfRkxBR19OTSB8IFJSX0ZMQUdfUFggLyp8IFJSX0ZM
QUdfU0wqLzsKIAogCSAgICAgIHdoaWxlIChycl9sZW4gPj0gNCkKIAkJewor
CQkgIC8qCisJCSAgICogQSBTVVNQIGVudHJ5IGlzIGF0IGxlYXN0IDQgYnl0
ZXMgKHNpZ25hdHVyZSwgbGVuZ3RoLAorCQkgICAqIHZlcnNpb24pIGFuZCBt
dXN0IGZpdCBpbiB0aGUgcmVtYWluaW5nIFN5c3RlbSBVc2UgYXJlYS4KKwkJ
ICAgKiBBIHNob3J0ZXIgb3Igb3ZlcmxvbmcgbGVuIGlzIHVucGFyc2VhYmxl
OiBzdG9wLCByYXRoZXIKKwkJICAgKiB0aGFuIHNwaW4gZm9yZXZlciAobGVu
ID09IDApIG9yIHVuZGVyZmxvdyBycl9sZW4gaW4gdGhlCisJCSAgICogYWR2
YW5jZSBiZWxvdyAobGVuID4gcnJfbGVuKS4KKwkJICAgKi8KKwkJICBpZiAo
cnJfcHRyLnJyLT5sZW4gPCA0IHx8IHJyX3B0ci5yci0+bGVuID4gcnJfbGVu
KQorCQkgICAgYnJlYWs7CiAJCSAgaWYgKHJyX3B0ci5yci0+dmVyc2lvbiAh
PSAxKQogCQkgICAgewogI2lmbmRlZiBTVEFHRTFfNQpAQCAtMjM2LDkgKzI2
MiwxNyBAQCBpc285NjYwX2RpciAoZnNpX2ZpbGVfdCAqZmZpLCBjaGFyICpk
aXJuCiAJCQkgICAgcnJfZmxhZyAmPSBycl9wdHIucnItPnUucnIuZmxhZ3Mu
bDsKIAkJCSAgYnJlYWs7CiAJCQljYXNlIFJSTUFHSUMoJ04nLCAnTScpOgot
CQkJICBuYW1lID0gKGNvbnN0IGNoYXIgKilycl9wdHIucnItPnUubm0ubmFt
ZTsKLQkJCSAgbmFtZV9sZW4gPSBycl9wdHIucnItPmxlbiAtICg0K3NpemVv
ZihzdHJ1Y3QgTk0pKTsKLQkJCSAgcnJfZmxhZyAmPSB+UlJfRkxBR19OTTsK
KwkJCSAgLyoKKwkJCSAgICogVGhlIGdlbmVyaWMgY2hlY2sgYWJvdmUgb25s
eSBndWFyYW50ZWVzIGxlbiA+PSA0OworCQkJICAgKiBOTSBhZGRpdGlvbmFs
bHkgaGFzIGEgZmxhZ3MgYnl0ZSwgc28gbGVuIG11c3QgYmUgYXQKKwkJCSAg
ICogbGVhc3QgNSBmb3IgbmFtZV9sZW4gbm90IHRvIHVuZGVyZmxvdy4KKwkJ
CSAgICovCisJCQkgIGlmIChycl9wdHIucnItPmxlbiA+PSAoNCtzaXplb2Yo
c3RydWN0IE5NKSkpCisJCQkgICAgeworCQkJICAgICAgbmFtZSA9IChjb25z
dCBjaGFyICopcnJfcHRyLnJyLT51Lm5tLm5hbWU7CisJCQkgICAgICBuYW1l
X2xlbiA9IHJyX3B0ci5yci0+bGVuIC0gKDQrc2l6ZW9mKHN0cnVjdCBOTSkp
OworCQkJICAgICAgcnJfZmxhZyAmPSB+UlJfRkxBR19OTTsKKwkJCSAgICB9
CiAJCQkgIGJyZWFrOwogCQkJY2FzZSBSUk1BR0lDKCdQJywgJ1gnKToKIAkJ
CSAgaWYgKHJyX3B0ci5yci0+bGVuID49ICg0K3NpemVvZihzdHJ1Y3QgUFgp
KSkKQEAgLTMzOSw2ICszNzMsMTUgQEAgaXNvOTY2MF9kaXIgKGZzaV9maWxl
X3QgKmZmaSwgY2hhciAqZGlybgogCQkJICBtZW1jcHkoTkFNRV9CVUYsIG5h
bWUsIG5hbWVfbGVuKTsKIAkJCSAgbmFtZSA9IChjb25zdCBjaGFyICopTkFN
RV9CVUY7CiAJCQl9CisJCSAgICAgIC8qCisJCSAgICAgICAqIG9mZnNldCBh
bmQgc2l6ZSBhcmUgaW1hZ2UtY29udHJvbGxlZDsgdGhlIGxvYWRlZAorCQkg
ICAgICAgKiBjb250aW51YXRpb24gbGl2ZXMgaW4gYSBzaW5nbGUtc2VjdG9y
IGJ1ZmZlci4gIEJhaWwKKwkJICAgICAgICogb3V0IGlmIHRoZSByZWZlcmVu
Y2VkIHdpbmRvdyBkb2VzIG5vdCBmaXQgaW5zaWRlIGl0LgorCQkgICAgICAg
Ki8KKwkJICAgICAgaWYgKGNlX3B0ci0+dS5jZS5vZmZzZXQubCA+PSBJU09f
U0VDVE9SX1NJWkUKKwkJCSAgfHwgY2VfcHRyLT51LmNlLnNpemUubAorCQkJ
ICAgICA+IElTT19TRUNUT1JfU0laRSAtIGNlX3B0ci0+dS5jZS5vZmZzZXQu
bCkKKwkJCWJyZWFrOwogCQkgICAgICBycl9wdHIucHRyID0gKGNoYXIgKilS
UkNPTlRfQlVGICsgY2VfcHRyLT51LmNlLm9mZnNldC5sOwogCQkgICAgICBy
cl9sZW4gPSBjZV9wdHItPnUuY2Uuc2l6ZS5sOwogCQkgICAgICBpZiAoIWlz
bzk2NjBfZGV2cmVhZChmZmksIGNlX3B0ci0+dS5jZS5leHRlbnQubCwgMCwg
SVNPX1NFQ1RPUl9TSVpFLCAoY2hhciAqKVJSQ09OVF9CVUYpKQo=

--=separator--

