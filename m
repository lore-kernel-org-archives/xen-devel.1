Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D033ACA5FED
	for <xen-devel@archiver.kernel.org>; Fri,  9 Oct 2026 08:53:19 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1444096.1661114 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xF6Ld-0002Ui-Ti; Fri, 09 Oct 2026 08:53:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1444096.1661114; Fri, 09 Oct 2026 08:53:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xF6Ld-0002TO-NY; Fri, 09 Oct 2026 08:53:01 +0000
Received: by outflank-mailman (input) for mailman id 1444096;
 Fri, 09 Oct 2026 08:53:00 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julieng@xenbits.xen.org>)
 id 1xF6Lc-0002RJ-LR; Fri, 09 Oct 2026 08:53:00 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xF6Lb-0020KT-Ny; Fri, 09 Oct 2026 10:52:59 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <julieng@xenbits.xen.org>)
 id 6ac8ab68-8faa-0a2a0a5109dd-0a2a45078778-18
 for <multiple-recipients>; Fri, 09 Oct 2026 10:52:59 +0200
Received: from [104.130.215.37] (helo=mail.xenproject.org)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <julieng@xenbits.xen.org>)
 id 6ac8ab6a-b4ea-0a2a45070019-6882d725ae08-3
 for <multiple-recipients>; Fri, 09 Oct 2026 10:52:59 +0200
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julieng@xenbits.xen.org>) id 1xF6LU-004j7d-2d;
 Fri, 09 Oct 2026 08:52:52 +0000
Received: from julieng by xenbits.xenproject.org with local (Exim 4.96)
 (envelope-from <julieng@xenbits.xen.org>) id 1xF6LU-001PzP-2R;
 Fri, 09 Oct 2026 08:52:52 +0000
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
Subject: Xen Security Advisory 522 v1 (CVE-2026-98375) - Linux
 xen-netfront: backend can crash guest via malformed RX packets
Message-Id: <E1xF6LU-001PzP-2R@xenbits.xenproject.org>
Date: Fri, 09 Oct 2026 08:52:52 +0000
X-purgate-ID: tlsNG-ef75cf/1791535979-378D1AE4-126C4B0D/0/0
X-purgate-type: clean
X-purgate-size: 5448

--=separator
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

            Xen Security Advisory CVE-2026-98375 / XSA-522

 Linux xen-netfront: backend can crash guest via malformed RX packets

ISSUE DESCRIPTION
=================

If a RX packet sent from the networking backend to the Linux xen-netfront
driver is split into multiple slots and the first slot is shorter than
an Ethernet header, a BUG() will crash the guest. This is a backend induced
Denial of Service (DoS).

IMPACT
======

A malicious network backend can cause a DoS affecting the entire guest it
is serving.

VULNERABLE SYSTEMS
==================

All Linux guests being served by a potentially untrusted network backend
(i.e. a network backend in a driver domain) are affected.

Linux guests with a kernel from 2.6.23 onwards are affected.

MITIGATION
==========

Using a trusted network backend will avoid the issue in the guests.

CREDITS
=======

This issue was discovered by Josef Bacik of Anthropic.

RESOLUTION
==========

Applying the attached patch resolves this issue.

xsa522-linux.patch           Linux

$ sha256sum xsa522*
5bd78edbf9f039b6e12e725c883a44485fd60e7e8e06c493d57bb2ecfeccbb6e  xsa522-linux.patch
$

NOTE REGARDING LACK OF EMBARGO
==============================

This issue was disclosed in public.
-----BEGIN PGP SIGNATURE-----

iQFcBAEBCABGFiEEI+MiLBRfRHX6gGCng/4UyVfoK9kFAmrIqswbFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMCwzDBxwZ3BAeGVuLm9yZwAKCRCD/hTJV+gr2Z0aB/4x
lyvVclfKLPKO7TezBS0Du+ee3t8PbwMfWe7Gw3rMOkaytQs+XbBZrZ/lF9uNgSyu
a+bwaALjNvTuBJiU2Hq6w6qSMjrDb4Kfn1vRe+iw/MXj5K1q8J6NzXP/rZGkIPCl
E1NyC8RPiRzva/X3CgfO59nsHNxmVxy5cFowP4oxGjp/sAqTLR4JMbK9tALa50Hz
5dc+CUC7i9YlbVgcn1KatORknlSBBqvefRM/zF/uLtGi5YCmVWVc7QlHF5BCBgio
Gu5zjEqA+De5/Rg0o5gHH3Jh6xWTtfThoZewROQgu+P9QYUmHZpGKfCkYazTddzi
Ns9Hz1obvGY4JuCanYvF
=QR/D
-----END PGP SIGNATURE-----

--=separator
Content-Type: application/octet-stream; name="xsa522-linux.patch"
Content-Disposition: attachment; filename="xsa522-linux.patch"
Content-Transfer-Encoding: base64

RnJvbSBjODQzZGRhMTg3YmQ0NGExMmQ4YTJiMWI1NmFlYmZjN2Y2NzFiODIw
IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBKb3NlZiBCYWNpayA8
am9zZWZAdG94aWNwYW5kYS5jb20+CkRhdGU6IFdlZCwgNyBPY3QgMjAyNiAx
Nzo1NTo0MCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHhlbi9uZXRmcm9udDog
ZHJvcCBSWCBwYWNrZXRzIHdpdGggYSBzaG9ydCBFdGhlcm5ldCBoZWFkZXIK
CmhhbmRsZV9pbmNvbWluZ19xdWV1ZSgpIHB1bGxzIHB1bGxfdG8gYnl0ZXMg
aW50byB0aGUgaGVhZCBiZWZvcmUKY2FsbGluZyBldGhfdHlwZV90cmFucygp
LiAgcHVsbF90byBpcyB0aGUgbGVuZ3RoIG9mIHRoZSBmaXJzdCBSWCBzbG90
LApjYXBwZWQgYXQgUlhfQ09QWV9USFJFU0hPTEQsIGFuZCB0aGF0IGxlbmd0
aCBjb21lcyBmcm9tIHRoZSBiYWNrZW5kLgpOb3RoaW5nIGNoZWNrcyBpdCBh
Z2FpbnN0IEVUSF9ITEVOLgoKSWYgdGhlIGZpcnN0IHNsb3QgaXMgc2hvcnRl
ciB0aGFuIEVUSF9ITEVOIGFuZCBtb3JlIHNsb3RzIGZvbGxvdywgdGhlCmhl
YWQgZW5kcyB1cCBzaG9ydGVyIHRoYW4gYW4gRXRoZXJuZXQgaGVhZGVyIHdo
aWxlIHNrYi0+bGVuIGlzIGxvbmdlciwKYW5kIGV0aF90eXBlX3RyYW5zKCkg
QlVHKClzIGluIF9fc2tiX3B1bGwoKS4gIElmIHRoZSB3aG9sZSBwYWNrZXQg
aXMKc2hvcnRlciB0aGFuIEVUSF9ITEVOLCBldGhfdHlwZV90cmFucygpIHJl
YWRzIHRoZSBoZWFkZXIgcGFzdCB0aGUgZW5kCm9mIHRoZSBkYXRhIGluc3Rl
YWQuCgpQdWxsIGF0IGxlYXN0IEVUSF9ITEVOLCBhbmQgZHJvcCB0aGUgcGFj
a2V0IGlmIHRoYXQgZmFpbHMsIHdoaWNoIGFsc28KZHJvcHMgcGFja2V0cyB0
b28gc2hvcnQgdG8gaG9sZCBhbiBFdGhlcm5ldCBoZWFkZXIuICBUaGlzIGFs
c28gY2hlY2tzCnRoZSByZXR1cm4gdmFsdWUgb2YgdGhlIHB1bGwsIHdoaWNo
IHdhcyBpZ25vcmVkLgoKVGhpcyBpcyBYU0EtNTIyIC8gQ1ZFLTIwMjYtOTgz
NzUKCkZpeGVzOiAwZDE2MDIxMTk2NWIgKCJ4ZW46IGFkZCB2aXJ0dWFsIG5l
dHdvcmsgZGV2aWNlIGRyaXZlciIpCkNjOiBzdGFibGVAdmdlci5rZXJuZWwu
b3JnCkFzc2lzdGVkLWJ5OiBMTE0KU2lnbmVkLW9mZi1ieTogSm9zZWYgQmFj
aWsgPGpvc2VmQHRveGljcGFuZGEuY29tPgpNZXNzYWdlLUlEOiA8MjAyNjEw
MDctYjQteGVuLW5ldGZyb250LXNob3J0LWhlYWQtdjEtMS0xMmQ3MTEzYTdl
NGVAdG94aWNwYW5kYS5jb20+ClJldmlld2VkLWJ5OiBKdWVyZ2VuIEdyb3Nz
IDxqZ3Jvc3NAc3VzZS5jb20+ClNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jv
c3MgPGpncm9zc0BzdXNlLmNvbT4KLS0tCiBkcml2ZXJzL25ldC94ZW4tbmV0
ZnJvbnQuYyB8IDEyICsrKysrKysrKystLQogMSBmaWxlIGNoYW5nZWQsIDEw
IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9uZXQveGVuLW5ldGZyb250LmMgYi9kcml2ZXJzL25ldC94ZW4t
bmV0ZnJvbnQuYwppbmRleCAyZWQ2NzM2NDljNDguLmQyNjk0NTdlODM5ZSAx
MDA2NDQKLS0tIGEvZHJpdmVycy9uZXQveGVuLW5ldGZyb250LmMKKysrIGIv
ZHJpdmVycy9uZXQveGVuLW5ldGZyb250LmMKQEAgLTEyMzQsOCArMTIzNCwx
NiBAQCBzdGF0aWMgaW50IGhhbmRsZV9pbmNvbWluZ19xdWV1ZShzdHJ1Y3Qg
bmV0ZnJvbnRfcXVldWUgKnF1ZXVlLAogCXdoaWxlICgoc2tiID0gX19za2Jf
ZGVxdWV1ZShyeHEpKSAhPSBOVUxMKSB7CiAJCWludCBwdWxsX3RvID0gTkVU
RlJPTlRfU0tCX0NCKHNrYiktPnB1bGxfdG87CiAKLQkJaWYgKHB1bGxfdG8g
PiBza2JfaGVhZGxlbihza2IpKQotCQkJX19wc2tiX3B1bGxfdGFpbChza2Is
IHB1bGxfdG8gLSBza2JfaGVhZGxlbihza2IpKTsKKwkJLyogcHVsbF90byBj
b21lcyBmcm9tIHRoZSBmaXJzdCBzbG90J3MgbGVuZ3RoLCB3aGljaCB0aGUK
KwkJICogYmFja2VuZCBjb250cm9scy4gIE1ha2Ugc3VyZSB0aGUgaGVhZCBo
b2xkcyBhdCBsZWFzdCBhbgorCQkgKiBFdGhlcm5ldCBoZWFkZXIgZm9yIGV0
aF90eXBlX3RyYW5zKCkuCisJCSAqLworCQlpZiAoIXBza2JfbWF5X3B1bGwo
c2tiLCBtYXgocHVsbF90bywgRVRIX0hMRU4pKSkgeworCQkJa2ZyZWVfc2ti
KHNrYik7CisJCQlwYWNrZXRzX2Ryb3BwZWQrKzsKKwkJCXF1ZXVlLT5pbmZv
LT5uZXRkZXYtPnN0YXRzLnJ4X2Vycm9ycysrOworCQkJY29udGludWU7CisJ
CX0KIAogCQkvKiBFdGhlcm5ldCB3b3JrOiBEZWxheWVkIHRvIGhlcmUgYXMg
aXQgcGVla3MgdGhlIGhlYWRlci4gKi8KIAkJc2tiLT5wcm90b2NvbCA9IGV0
aF90eXBlX3RyYW5zKHNrYiwgcXVldWUtPmluZm8tPm5ldGRldik7Ci0tIAoy
LjU1LjAKCg==

--=separator--

