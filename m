Return-Path: <SRS0=kbZc=SS=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC16EC10F13
	for <xen-devel@archiver.kernel.org>; Tue, 16 Apr 2019 18:07:34 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A50732063F
	for <xen-devel@archiver.kernel.org>; Tue, 16 Apr 2019 18:07:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A50732063F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hGSUC-0005LF-SJ; Tue, 16 Apr 2019 18:07:12 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=L/bp=SS=xenproject.org=aliasfile-bounces@srs-us1.protection.inumbo.net>)
 id 1hGSUC-0005L5-96
 for xen-devel@lists.xenproject.org; Tue, 16 Apr 2019 18:07:12 +0000
X-Inumbo-ID: 73fa3b57-6072-11e9-92d7-bc764e045a96
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 73fa3b57-6072-11e9-92d7-bc764e045a96;
 Tue, 16 Apr 2019 18:07:10 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <aliasfile-bounces@xenproject.org>)
 id 1hGSU9-0002tN-IY; Tue, 16 Apr 2019 18:07:09 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1hGSU8-0004vq-A7; Tue, 16 Apr 2019 18:07:08 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1hGSU8-0003cT-9U; Tue, 16 Apr 2019 18:07:08 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-134865-mainreport@xen.org>
MIME-Version: 1.0
X-Osstest-Failures: ovmf:build-i386-libvirt:libvirt-build:fail:regression
X-Osstest-Versions-This: ovmf=0eccea3fbe2f6d4999d972d9310d4f2717f5100c
X-Osstest-Versions-That: ovmf=e0fd9ece26c9b84a1a756a869ff2a4525e23ab33
From: osstest service owner <osstest-admin@xenproject.org>
Date: Tue, 16 Apr 2019 18:07:08 +0000
Subject: [Xen-devel] [ovmf test] 134865: regressions - FAIL
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Message-ID: <20190416180708.D0SBUTalVRJG6rGD3Ax2bm03RZW1kFszjERau5CNAH8@z>

ZmxpZ2h0IDEzNDg2NSBvdm1mIHJlYWwgW3JlYWxdCmh0dHA6Ly9sb2dzLnRlc3QtbGFiLnhlbnBy
b2plY3Qub3JnL29zc3Rlc3QvbG9ncy8xMzQ4NjUvCgpSZWdyZXNzaW9ucyA6LSgKClRlc3RzIHdo
aWNoIGRpZCBub3Qgc3VjY2VlZCBhbmQgYXJlIGJsb2NraW5nLAppbmNsdWRpbmcgdGVzdHMgd2hp
Y2ggY291bGQgbm90IGJlIHJ1bjoKIGJ1aWxkLWkzODYtbGlidmlydCAgICAgICAgICAgIDYgbGli
dmlydC1idWlsZCAgICAgICAgICAgIGZhaWwgUkVHUi4gdnMuIDEzNDY0MAoKdmVyc2lvbiB0YXJn
ZXRlZCBmb3IgdGVzdGluZzoKIG92bWYgICAgICAgICAgICAgICAgIDBlY2NlYTNmYmUyZjZkNDk5
OWQ5NzJkOTMxMGQ0ZjI3MTdmNTEwMGMKYmFzZWxpbmUgdmVyc2lvbjoKIG92bWYgICAgICAgICAg
ICAgICAgIGUwZmQ5ZWNlMjZjOWI4NGExYTc1NmE4NjlmZjJhNDUyNWUyM2FiMzMKCkxhc3QgdGVz
dCBvZiBiYXNpcyAgIDEzNDY0MCAgMjAxOS0wNC0xMSAxMzoxNTo1MSBaICAgIDUgZGF5cwpGYWls
aW5nIHNpbmNlICAgICAgICAxMzQ3MzggIDIwMTktMDQtMTMgMDM6MzM6MjYgWiAgICAzIGRheXMg
ICAgOCBhdHRlbXB0cwpUZXN0aW5nIHNhbWUgc2luY2UgICAxMzQ4NTIgIDIwMTktMDQtMTYgMDY6
NDE6MzUgWiAgICAwIGRheXMgICAgMyBhdHRlbXB0cwoKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tClBlb3BsZSB3aG8gdG91Y2hlZCBy
ZXZpc2lvbnMgdW5kZXIgdGVzdDoKICBBcmQgQmllc2hldXZlbCA8YXJkLmJpZXNoZXV2ZWxAbGlu
YXJvLm9yZz4KICBCcmV0IEJhcmtlbGV3IDxCcmV0LkJhcmtlbGV3QG1pY3Jvc29mdC5jb20+CiAg
Q2hhc2VsIENoaXUgPGNoYXNlbC5jaGl1QGludGVsLmNvbT4KICBDaGFzZWwsIENoaXUgPGNoYXNl
bC5jaGl1QGludGVsLmNvbT4KICBDaHJpc3RpYW4gUm9kcmlndWV6IDxjaHJpc3RpYW4ucm9kcmln
dWV6QGludGVsLmNvbT4KICBEYW5kYW4gQmkgPGRhbmRhbi5iaUBpbnRlbC5jb20+CiAgRG9uZywg
R3VvIDxndW8uZG9uZ0BpbnRlbC5jb20+CiAgRmFuLCBaaGlqdVggPHpoaWp1eC5mYW5AaW50ZWwu
Y29tPgogIEd1byBEb25nIDxndW8uZG9uZ0BpbnRlbC5jb20+CiAgS2lubmV5LCBNaWNoYWVsIEQg
PG1pY2hhZWwuZC5raW5uZXlAaW50ZWwuY29tPgogIExhc3psbyBFcnNlayA8bGVyc2VrQHJlZGhh
dC5jb20+CiAgTWljaGFlbCBEIEtpbm5leSA8bWljaGFlbC5kLmtpbm5leUBpbnRlbC5jb20+CiAg
Um9kcmlndWV6LCBDaHJpc3RpYW4gPGNocmlzdGlhbi5yb2RyaWd1ZXpAaW50ZWwuY29tPgogIFNo
ZW5nbGVpIFpoYW5nIDxzaGVuZ2xlaS56aGFuZ0BpbnRlbC5jb20+CiAgWmhpY2hhbyBHYW8gPHpo
aWNoYW8uZ2FvQGludGVsLmNvbT4KICBaaGlqdS5GYW4gPHpoaWp1eC5mYW5AaW50ZWwuY29tPgoK
am9iczoKIGJ1aWxkLWFtZDY0LXhzbSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBwYXNzICAgIAogYnVpbGQtaTM4Ni14c20gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAgCiBidWlsZC1hbWQ2NCAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcGFzcyAgICAKIGJ1aWxkLWkz
ODYgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYXNz
ICAgIAogYnVpbGQtYW1kNjQtbGlidmlydCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHBhc3MgICAgCiBidWlsZC1pMzg2LWxpYnZpcnQgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgZmFpbCAgICAKIGJ1aWxkLWFtZDY0LXB2b3BzICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAgIAogYnVpbGQtaTM4
Ni1wdm9wcyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhc3Mg
ICAgCiB0ZXN0LWFtZDY0LWFtZDY0LXhsLXFlbXV1LW92bWYtYW1kNjQgICAgICAgICAgICAgICAg
ICAgICAgICAgcGFzcyAgICAKIHRlc3QtYW1kNjQtaTM4Ni14bC1xZW11dS1vdm1mLWFtZDY0ICAg
ICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAgIAoKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQpzZy1yZXBvcnQtZmxpZ2h0IG9u
IG9zc3Rlc3QudGVzdC1sYWIueGVucHJvamVjdC5vcmcKbG9nczogL2hvbWUvbG9ncy9sb2dzCmlt
YWdlczogL2hvbWUvbG9ncy9pbWFnZXMKCkxvZ3MsIGNvbmZpZyBmaWxlcywgZXRjLiBhcmUgYXZh
aWxhYmxlIGF0CiAgICBodHRwOi8vbG9ncy50ZXN0LWxhYi54ZW5wcm9qZWN0Lm9yZy9vc3N0ZXN0
L2xvZ3MKCkV4cGxhbmF0aW9uIG9mIHRoZXNlIHJlcG9ydHMsIGFuZCBvZiBvc3N0ZXN0IGluIGdl
bmVyYWwsIGlzIGF0CiAgICBodHRwOi8veGVuYml0cy54ZW4ub3JnL2dpdHdlYi8/cD1vc3N0ZXN0
LmdpdDthPWJsb2I7Zj1SRUFETUUuZW1haWw7aGI9bWFzdGVyCiAgICBodHRwOi8veGVuYml0cy54
ZW4ub3JnL2dpdHdlYi8/cD1vc3N0ZXN0LmdpdDthPWJsb2I7Zj1SRUFETUU7aGI9bWFzdGVyCgpU
ZXN0IGhhcm5lc3MgY29kZSBjYW4gYmUgZm91bmQgYXQKICAgIGh0dHA6Ly94ZW5iaXRzLnhlbi5v
cmcvZ2l0d2ViP3A9b3NzdGVzdC5naXQ7YT1zdW1tYXJ5CgoKTm90IHB1c2hpbmcuCgooTm8gcmV2
aXNpb24gbG9nOyBpdCB3b3VsZCBiZSA0MTcgbGluZXMgbG9uZy4pCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
