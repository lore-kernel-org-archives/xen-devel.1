Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C3E1CA9ED2
	for <xen-devel@archiver.kernel.org>; Tue, 13 Oct 2026 12:28:48 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1447103.1663276 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGbcS-0004tg-Uk; Tue, 13 Oct 2026 12:28:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1447103.1663276; Tue, 13 Oct 2026 12:28:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGbcS-0004sr-Oz; Tue, 13 Oct 2026 12:28:36 +0000
Received: by outflank-mailman (input) for mailman id 1447103;
 Tue, 13 Oct 2026 12:28:35 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrewcoop@xenbits.xen.org>)
 id 1xGbcR-0004oV-4U; Tue, 13 Oct 2026 12:28:35 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGbcQ-00FMeE-HP; Tue, 13 Oct 2026 14:28:34 +0200
Received: from [10.42.69.1] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrewcoop@xenbits.xen.org>)
 id 6ace23ec-bab6-0a2a0a5309dd-0a2a4501bdb4-6
 for <multiple-recipients>; Tue, 13 Oct 2026 14:28:34 +0200
Received: from [104.130.215.37] (helo=mail.xenproject.org)
 by tlsNG-d62444.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrewcoop@xenbits.xen.org>)
 id 6ace23f0-5984-0a2a45010019-6882d725c4a6-3
 for <multiple-recipients>; Tue, 13 Oct 2026 14:28:34 +0200
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <andrewcoop@xenbits.xen.org>)
 id 1xGbcM-00000003NGC-2C5h; Tue, 13 Oct 2026 12:28:30 +0000
Received: from andrewcoop by xenbits.xenproject.org with local (Exim 4.98.2)
 (envelope-from <andrewcoop@xenbits.xen.org>)
 id 1xGbcM-0000000F8M0-0z6F; Tue, 13 Oct 2026 12:28:30 +0000
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
Subject: Xen Security Advisory 514 v2 (CVE-2026-79607) - Xenstore: Guests
 can crash xenstored during Live Update
Message-Id: <E1xGbcM-0000000F8M0-0z6F@xenbits.xenproject.org>
Date: Tue, 13 Oct 2026 12:28:30 +0000
X-purgate-ID: tlsNG-d62444/1791894514-1F66C757-68071524/0/0
X-purgate-type: clean
X-purgate-size: 5581

--=separator
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

            Xen Security Advisory CVE-2026-79607 / XSA-514
                               version 2

        Xenstore: Guests can crash xenstored during Live Update

UPDATES IN VERSION 2
====================

Public release.

ISSUE DESCRIPTION
=================

During Xenstore live update the state record for a Xenstore watch with
specified watch depth is written with two bytes missing.  This results
in an inconsistent state when reading the state back in the new Xenstore,
causing a crash of Xenstore or wrong Xenstore data.

IMPACT
======

An unprivileged guest can cause the Xenstore service to crash or to get
corrupted during a live update of Xenstore, causing a DoS of the host
regarding further domain administration actions.

VULNERABLE SYSTEMS
==================

Only systems running Xen 4.22 are vulnerable.  Systems running Xen 4.21
or older are not vulnerable.

Only systems running C xenstore either as daemon or as stubdom are
vulnerable. Systems running oxenstored are not vulnerable.

MITIGATION
==========

Not doing a live update of Xenstore avoids the vulnerability.

Switching to oxenstored avoids the vulnerability.

CREDITS
=======

This issue was discovered by Andrii Sultanov of Vates.

RESOLUTION
==========

Applying the attached patch resolves this issue.

Note that patches for released versions are generally prepared to
apply to the stable branches, and may not apply cleanly to the most
recent release tarball.  Downstreams are encouraged to update to the
tip of the stable branch before applying these patches.

xsa514.patch           xen-unstable - Xen 4.22.x

$ sha256sum xsa514*
8774d9b45db75851560db70a9be06d5e379311bd3042d9049bc29456e141ae7d  xsa514.patch
$

DEPLOYMENT DURING EMBARGO
=========================

Deployment of the patches described above (or others which are substantially similar)
is permitted during the embargo, even on public-facing systems with untrusted guest
users and administrators.  Not doing a live update of Xenstore as a mitigation is
permitted.  Switching to oxenstored is not permitted, as this is a guest visible
configuration change.

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

iQFABAEBCAAqFiEEI+MiLBRfRHX6gGCng/4UyVfoK9kFAmrOIa8MHHBncEB4ZW4u
b3JnAAoJEIP+FMlX6CvZB5YH+wf2251Z1DOOtQcCB1LV9vsunIaEGd5l7pHdIZ3a
3j9A6r/KGc+RtSgDB9TWCMgjKLbBfwivOxBHHhxjhejsfnUKUJNryJFLn86plFdu
VRrdk5pHmypNgb9mCf3KQ8BQputnuAu36QuIlw3F5z5XAanmyurT1QJKV0RXLrQF
J3ROkGAGYp6gHhPDBFwCi/dWE/I1PRfvi53oyPPflj2kAh3DPwycpPQV0JZommjC
ljh1uvyPMnwr76nnh5e4LmismWa9Gks/p3BQuF01w3Prj/vR4wRxLEMCPjhK6xV6
PLcKgrt+DGn/xwj7fEdaAVlXyh4YcxQlmUWHzaNm94Knq+8=
=BuOZ
-----END PGP SIGNATURE-----

--=separator
Content-Type: application/octet-stream; name="xsa514.patch"
Content-Disposition: attachment; filename="xsa514.patch"
Content-Transfer-Encoding: base64

RnJvbSA2ODE2M2U3MzI5OTQ5ZjUwOWQ2MGMyMzllMDRlNWVkN2YwYzZiYzBlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+CkRhdGU6
IEZyaSwgMTggU2VwIDIwMjYgMTI6MjU6MDcgKzAyMDAKU3ViamVjdDogW1BBVENIXSB0b29scy94
ZW5zdG9yZWQ6IGZpeCBsaXZlIHVwZGF0ZSB3aXRoIHdhdGNoZXMgc3BlY2lmeWluZwogZGVwdGgK
CkR1ZSB0byBhIHR5cG8gdGhlIHN0YXRlIHJlY29yZCBmb3IgYSB3YXRjaCBzcGVjaWZ5aW5nIGEg
ZGVwdGggaXMKd3JpdHRlbiBvbmx5IHBhcnRpYWxseS4gSW5zdGVhZCBvZiB1c2luZyB0aGUgY29y
cmVjdCBsZW5ndGggb2YgdGhlCnhzX3N0YXRlX3dhdGNoX2V4dCBzdHJ1Y3R1cmUgb25seSB0aGUg
bGVuZ3RoIG9mIHRoZSB4c19zdGF0ZV93YXRjaApzdHJ1Y3R1cmUgd2FzIHVzZWQgd2hlbiB3cml0
aW5nIHRoZSBkYXRhLgoKRml4IHRoYXQgYnkgdXNpbmcgdGhlIGNvcnJlY3QgbGVuZ3RoLgoKVGhp
cyBpcyBYU0EtNTE0IC8gQ1ZFLTIwMjYtNzk2MDcKCkZpeGVzOiBkYjk4ZGUxMjBjYjggKCJ0b29s
cy94ZW5zdG9yZWQ6IGFkZCBkZXB0aCBpbmZvcm1hdGlvbiB0byB3YXRjaGVzIikKUmVwb3J0ZWQt
Ynk6IEFuZHJpaSBTdWx0YW5vdiA8YW5kcml5LnN1bHRhbm92QHZhdGVzLnRlY2g+ClNpZ25lZC1v
ZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4KLS0tCiB0b29scy94ZW5zdG9y
ZWQvd2F0Y2guYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxl
dGlvbigtKQoKZGlmZiAtLWdpdCBhL3Rvb2xzL3hlbnN0b3JlZC93YXRjaC5jIGIvdG9vbHMveGVu
c3RvcmVkL3dhdGNoLmMKaW5kZXggYzE0M2U2ZmJjZi4uNzA5N2FiMGIwZCAxMDA2NDQKLS0tIGEv
dG9vbHMveGVuc3RvcmVkL3dhdGNoLmMKKysrIGIvdG9vbHMveGVuc3RvcmVkL3dhdGNoLmMKQEAg
LTM1NCw3ICszNTQsNyBAQCBjb25zdCBjaGFyICpkdW1wX3N0YXRlX3dhdGNoZXMoRklMRSAqZnAs
IHN0cnVjdCBjb25uZWN0aW9uICpjb25uLAogCQkJcmV0dXJuICJEdW1wIHdhdGNoIHN0YXRlIGVy
cm9yIjsKIAogCQlpZiAod2F0Y2gtPmRlcHRoID49IDApIHsKLQkJCWlmIChmd3JpdGUoJnN3ZSwg
c2l6ZW9mKHN3KSwgMSwgZnApICE9IDEpCisJCQlpZiAoZndyaXRlKCZzd2UsIHNpemVvZihzd2Up
LCAxLCBmcCkgIT0gMSkKIAkJCQlyZXR1cm4gIkR1bXAgd2F0Y2ggc3RhdGUgZXh0IGVycm9yIjsK
IAkJfSBlbHNlIHsKIAkJCWlmIChmd3JpdGUoJnN3LCBzaXplb2Yoc3cpLCAxLCBmcCkgIT0gMSkK
LS0gCjIuNTUuMAoK

--=separator--

