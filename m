Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FC64CA9ED2
	for <xen-devel@archiver.kernel.org>; Tue, 13 Oct 2026 12:29:12 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1447120.1663395 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGbcl-00082h-8k; Tue, 13 Oct 2026 12:28:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1447120.1663395; Tue, 13 Oct 2026 12:28:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xGbck-00080O-Ec; Tue, 13 Oct 2026 12:28:54 +0000
Received: by outflank-mailman (input) for mailman id 1447120;
 Tue, 13 Oct 2026 12:28:52 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <andrewcoop@xenbits.xen.org>)
 id 1xGbci-0007Kx-05; Tue, 13 Oct 2026 12:28:52 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xGbch-00FMox-CS; Tue, 13 Oct 2026 14:28:51 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <andrewcoop@xenbits.xen.org>)
 id 6ace2401-bab6-0a2a0a5309dd-0a2a4509de3a-6
 for <multiple-recipients>; Tue, 13 Oct 2026 14:28:51 +0200
Received: from [104.130.215.37] (helo=mail.xenproject.org)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <andrewcoop@xenbits.xen.org>)
 id 6ace2402-be1a-0a2a45090019-6882d725a2c4-3
 for <multiple-recipients>; Tue, 13 Oct 2026 14:28:51 +0200
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.98.2)
 (envelope-from <andrewcoop@xenbits.xen.org>)
 id 1xGbce-00000003NHL-0WzF; Tue, 13 Oct 2026 12:28:47 +0000
Received: from andrewcoop by xenbits.xenproject.org with local (Exim 4.98.2)
 (envelope-from <andrewcoop@xenbits.xen.org>)
 id 1xGbcd-0000000F8nY-3bRd; Tue, 13 Oct 2026 12:28:47 +0000
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
Subject: Xen Security Advisory 517 v2 (CVE-2026-79610) - grant-table:
 double version change race
Message-Id: <E1xGbcd-0000000F8nY-3bRd@xenbits.xenproject.org>
Date: Tue, 13 Oct 2026 12:28:47 +0000
X-purgate-ID: tlsNG-bad1c0/1791894531-FD469034-5AEEE705/0/0
X-purgate-type: clean
X-purgate-size: 7295

--=separator
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

            Xen Security Advisory CVE-2026-79610 / XSA-517
                               version 2

                grant-table: double version change race

UPDATES IN VERSION 2
====================

Public release.

ISSUE DESCRIPTION
=================

XSA-501 was about issues with v1 -> v2 and v2 -> v1 changes racing certain
other grant table operations.  Sadly a v2 -> v1 -> v2 change has yet
another effect which wasn't accounted for: During the first change, status
pages would be freed.  During the second change they would be allocated
again.  Hence across the full pair of change the addresses of the status
pages may change, rendering stale previously calculated pointers into the
status array.

IMPACT
======

An unprivileged guest may be able to elevate its privileges to that of the
host.  Information leaks and Denial of Service (DoS) are possible as well.

VULNERABLE SYSTEMS
==================

All Xen versions from 4.0 onwards are vulnerable.  Xen versions 3.4 and
earlier are not vulnerable.

Only x86 guests permitted to use grant table version 2 interfaces can
leverage this vulnerability.  On Arm, grant table v2 use is explicitly
unsupported.

Only multi-vCPU guests can leverage this vulnerability.

Xen versions 4.13 and newer offer a way to build Xen without grant table
support.  Such hypervisors (CONFIG_GRANT_TABLE turned off) are not
vulnerable.

MITIGATION
==========

Using the "gnttab=max-ver:1" hypervisor command line option will avoid
the vulnerability.

Using the "max_grant_version=1" guest configuration option for guests will
also avoid the vulnerability.

CREDITS
=======

This issue was discovered by Claude Opus and diagnosed as a security issue
by Teddy Astie of Vates.

RESOLUTION
==========

Applying the appropriate attached patch resolves this issue.

Note that patches for released versions are generally prepared to
apply to the stable branches, and may not apply cleanly to the most
recent release tarball.  Downstreams are encouraged to update to the
tip of the stable branch before applying these patches.

xsa517.patch           xen-unstable - Xen 4.17.x

$ sha256sum xsa517*
0f114af84cd925f8bc69b26386e2e4a95a52f947bc400f961a9e1ba46c0a2e05  xsa517.patch
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

This is because restricting the available grant table version is a guest
visible configuration change, which may lead to re-discovery of the issue.

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

iQFABAEBCAAqFiEEI+MiLBRfRHX6gGCng/4UyVfoK9kFAmrOIlkMHHBncEB4ZW4u
b3JnAAoJEIP+FMlX6CvZAGUH/3wERoCBP6lIwfFmIMiAcqVVctqz6/8OgplQEp8A
inNRPR8Avx++0lt4AdERiNYy3xwxGAZzJsxYC3ipCaHvMwOmm11DiMX5yuhvefNw
TJxWaWut2QmF0Vi0G4acvvlfslb9JA9quEgLDzF/2dMiyHzTL4xvdeJ5OR5zXAoD
hexjk0DCSDcYRHnD0OautofMGTaBaGJVHz08uRNkz3gOxumAeKnxmfelF8QgnTb3
jRYIt5z+Kye8oXZ0uTVY86YR7YbuiaHAJx1YZzceyfaVjJzvS8ZsTFt2CXshcex8
33fw3iQnY9ImA/NC11y4OLt8F8nb+Ge2Cge98wBt8NPSoBc=
=SAIu
-----END PGP SIGNATURE-----

--=separator
Content-Type: application/octet-stream; name="xsa517.patch"
Content-Disposition: attachment; filename="xsa517.patch"
Content-Transfer-Encoding: base64

RnJvbTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgpTdWJqZWN0OiBnbnR0YWI6IGFk
ZHJlc3MgZmFsbG91dCBmcm9tIFhTQS01MDEKCkEgdjEgLT4gdjIgY2hhbmdlIGlzbid0IHRoZSBv
bmx5IHNjZW5hcmlvIHdoZXJlICJzdGF0dXMiIG1heSBnbyBzdGFsZSBpbgptYXBfZ3JhbnRfcmVm
KCkuIEFjcm9zcyBhIHYyIC0+IHYxIC0+IHYyIGNoYW5nZSB0aGUgc3RhdHVzIHBhZ2VzIHdvdWxk
CmhhdmUgYmVlbiBmcmVlZCBhbmQgcmUtcG9wdWxhdGVkLCBwb3NzaWJseSBjaGFuZ2luZyB0aGUg
cGFnZXMgdXNlZCBmb3IgdGhlCmFycmF5LiBDaGVjayB0aGUgcG9pbnRlciBhZ2FpbnN0IHRoZSBl
eHBlY3RlZCB2ZXJzaW9uLWRlcGVuZGVudCB2YWx1ZS4KClRoaXMgaXMgWFNBLTUxNyAvIENWRS0y
MDI2LTc5NjEwLgoKRml4ZXM6IDk2ZGZlYjQxNzc0YSAoImdudHRhYjogY29wZSB3aXRoIHZlcnNp
b24gY2hhbmdlcyByYWNpbmcgb3RoZXIgb3BlcmF0aW9ucyIpCkFzc2lzdGVkLWJ5OiBDbGF1ZGUK
UmVwb3J0ZWQtYnk6IFRlZGR5IEFzdGllIDx0ZWRkeS5hc3RpZUB2YXRlcy50ZWNoPgpTaWduZWQt
b2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+ClJldmlld2VkLWJ5OiBUZWRk
eSBBc3RpZSA8dGVkZHkuYXN0aWVAdmF0ZXMudGVjaD4KLS0tCnYyOiBBZGQgcGFyZW50aGVzZXMg
YXJvdW5kIHRoZSB8fCBleHByZXNzaW9uLgoKLS0tIGEveGVuL2NvbW1vbi9ncmFudF90YWJsZS5j
CisrKyBiL3hlbi9jb21tb24vZ3JhbnRfdGFibGUuYwpAQCAtMTM1MCwxMyArMTM1MCwxOSBAQCBt
YXBfZ3JhbnRfcmVmKAogCiAgICAgZ3JhbnRfcmVhZF9sb2NrKHJndCk7CiAKLSAgICBpZiAoIHVu
bGlrZWx5KGV2YWx1YXRlX25vc3BlYygocmd0LT5ndF92ZXJzaW9uID09IDEpICE9Ci0gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgKHN0YXR1cyA9PSAmc2hhaC0+ZmxhZ3MpKSkgKQor
ICAgIC8qCisgICAgICogQWZ0ZXIgYSB2MSAtPiB2MiBjaGFuZ2UgYmVoaW5kIG91ciBiYWNrcyAi
cmVmIiBtYXkgbm93IGJlIG91dCBvZgorICAgICAqIGJvdW5kcy4gIFdoaWxlIGFmdGVyIGEgdjIg
LT4gdjEgLT4gdjIgY2hhbmdlICJyZWYiIHdvdWxkIHN0aWxsIGJlCisgICAgICogc3VpdGFibHkg
Ym91bmRlZCwgdGhlIHVuZGVybHlpbmcgc3RhdHVzIHBhZ2UgbWF5IGhhdmUgbW92ZWQuCisgICAg
ICovCisgICAgaWYgKCBldmFsdWF0ZV9ub3NwZWMocmd0LT5ndF92ZXJzaW9uID09IDEKKyAgICAg
ICAgICAgICAgICAgICAgICAgICA/IHN0YXR1cyAhPSAmc2hhaC0+ZmxhZ3MKKyAgICAgICAgICAg
ICAgICAgICAgICAgICA6IChyZWYgPj0gbnJfZ3JhbnRfZW50cmllcyhyZ3QpIHx8CisgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgc3RhdHVzICE9ICZzdGF0dXNfZW50cnkocmd0LCByZWYpKSkg
KQogICAgIHsKICAgICAgICAgLyoKLSAgICAgICAgICogQWZ0ZXIgYSB2MSAtPiB2MiBjaGFuZ2Ug
YmVoaW5kIG91ciBiYWNrcyAicmVmIiBtYXkgbm93IGJlIG91dCBvZgotICAgICAgICAgKiBib3Vu
ZHMuICBSZWNhbGN1bGF0ZSBpdCwgYnV0IG9ubHkgZm9yIHJlc2VydmVkIGVudHJpZXMuICBPdGhl
cnMKLSAgICAgICAgICogd2lsbCBoYXZlIGJlZW4gY2xlYXJlZCBhbnl3YXkgYnkgdGhlIHZlcnNp
b24gY2hhbmdlLgorICAgICAgICAgKiBSZWNhbGN1bGF0ZSBzdGF0dXMsIGJ1dCBvbmx5IGZvciBy
ZXNlcnZlZCBlbnRyaWVzLiAgT3RoZXJzIHdpbGwKKyAgICAgICAgICogaGF2ZSBiZWVuIGNsZWFy
ZWQgYW55d2F5IGJ5IHRoZSB2ZXJzaW9uIGNoYW5nZShzKS4KICAgICAgICAgICovCiAgICAgICAg
IGlmICggcmVmIDwgR05UVEFCX05SX1JFU0VSVkVEX0VOVFJJRVMgKQogICAgICAgICAgICAgc3Rh
dHVzID0gZXZhbHVhdGVfbm9zcGVjKHJndC0+Z3RfdmVyc2lvbiA9PSAxKQo=

--=separator--

