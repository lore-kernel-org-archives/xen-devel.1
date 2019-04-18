Return-Path: <SRS0=LbOi=SU=lists.xenproject.org=xen-devel-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB532C10F0E
	for <xen-devel@archiver.kernel.org>; Thu, 18 Apr 2019 22:58:15 +0000 (UTC)
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C4FBB20674
	for <xen-devel@archiver.kernel.org>; Thu, 18 Apr 2019 22:58:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C4FBB20674
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xenproject.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hHFyZ-0002Fn-Fe; Thu, 18 Apr 2019 22:57:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=kGH3=SU=xenproject.org=aliasfile-bounces@srs-us1.protection.inumbo.net>)
 id 1hHFyY-0002Fd-O7
 for xen-devel@lists.xenproject.org; Thu, 18 Apr 2019 22:57:50 +0000
X-Inumbo-ID: 5ffb157e-622d-11e9-bbfa-ab2b4c55f975
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5ffb157e-622d-11e9-bbfa-ab2b4c55f975;
 Thu, 18 Apr 2019 22:57:43 +0000 (UTC)
Received: from host146.205.237.98.conversent.net ([205.237.98.146]
 helo=infra.test-lab.xenproject.org)
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <aliasfile-bounces@xenproject.org>)
 id 1hHFyQ-0004ZR-T3; Thu, 18 Apr 2019 22:57:42 +0000
Received: from [172.16.144.3] (helo=osstest.test-lab.xenproject.org)
 by infra.test-lab.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <osstest-admin@xenproject.org>)
 id 1hHFyQ-0001ks-Lr; Thu, 18 Apr 2019 22:57:42 +0000
Received: from osstest by osstest.test-lab.xenproject.org with local (Exim
 4.89) (envelope-from <osstest-admin@xenproject.org>)
 id 1hHFyQ-0004Qu-Kt; Thu, 18 Apr 2019 22:57:42 +0000
To: xen-devel@lists.xenproject.org,
    osstest-admin@xenproject.org
Message-ID: <osstest-134965-mainreport@xen.org>
MIME-Version: 1.0
X-Osstest-Failures: ovmf:build-i386-libvirt:libvirt-build:fail:regression
 ovmf:build-i386-pvops:kernel-build:fail:regression
 ovmf:test-amd64-i386-xl-qemuu-ovmf-amd64:build-check(1):blocked:nonblocking
X-Osstest-Versions-This: ovmf=c2f643479eb3f00d930c461cdec3ba420a36072c
X-Osstest-Versions-That: ovmf=0eccea3fbe2f6d4999d972d9310d4f2717f5100c
From: osstest service owner <osstest-admin@xenproject.org>
Date: Thu, 18 Apr 2019 22:57:42 +0000
Subject: [Xen-devel] [ovmf test] 134965: regressions - FAIL
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
Message-ID: <20190418225742.rcct1tF8J9X9cZnfpfX2bbGb3GdEdaXu4rNDh7J7q7M@z>

ZmxpZ2h0IDEzNDk2NSBvdm1mIHJlYWwgW3JlYWxdCmh0dHA6Ly9sb2dzLnRlc3QtbGFiLnhlbnBy
b2plY3Qub3JnL29zc3Rlc3QvbG9ncy8xMzQ5NjUvCgpSZWdyZXNzaW9ucyA6LSgKClRlc3RzIHdo
aWNoIGRpZCBub3Qgc3VjY2VlZCBhbmQgYXJlIGJsb2NraW5nLAppbmNsdWRpbmcgdGVzdHMgd2hp
Y2ggY291bGQgbm90IGJlIHJ1bjoKIGJ1aWxkLWkzODYtbGlidmlydCAgICAgICAgICAgIDYgbGli
dmlydC1idWlsZCAgICAgICAgICAgIGZhaWwgUkVHUi4gdnMuIDEzNDg4OQogYnVpbGQtaTM4Ni1w
dm9wcyAgICAgICAgICAgICAgNiBrZXJuZWwtYnVpbGQgICAgICAgICAgICAgZmFpbCBSRUdSLiB2
cy4gMTM0ODg5CgpUZXN0cyB3aGljaCBkaWQgbm90IHN1Y2NlZWQsIGJ1dCBhcmUgbm90IGJsb2Nr
aW5nOgogdGVzdC1hbWQ2NC1pMzg2LXhsLXFlbXV1LW92bWYtYW1kNjQgIDEgYnVpbGQtY2hlY2so
MSkgICAgICAgICAgICAgIGJsb2NrZWQgbi9hCgp2ZXJzaW9uIHRhcmdldGVkIGZvciB0ZXN0aW5n
Ogogb3ZtZiAgICAgICAgICAgICAgICAgYzJmNjQzNDc5ZWIzZjAwZDkzMGM0NjFjZGVjM2JhNDIw
YTM2MDcyYwpiYXNlbGluZSB2ZXJzaW9uOgogb3ZtZiAgICAgICAgICAgICAgICAgMGVjY2VhM2Zi
ZTJmNmQ0OTk5ZDk3MmQ5MzEwZDRmMjcxN2Y1MTAwYwoKTGFzdCB0ZXN0IG9mIGJhc2lzICAgMTM0
ODg5ICAyMDE5LTA0LTE2IDIzOjExOjI0IFogICAgMSBkYXlzCkZhaWxpbmcgc2luY2UgICAgICAg
IDEzNDkzNSAgMjAxOS0wNC0xOCAwMToxMToyMyBaICAgIDAgZGF5cyAgICA0IGF0dGVtcHRzClRl
c3Rpbmcgc2FtZSBzaW5jZSAgIDEzNDk2NSAgMjAxOS0wNC0xOCAxODo0MTozNSBaICAgIDAgZGF5
cyAgICAxIGF0dGVtcHRzCgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0KUGVvcGxlIHdobyB0b3VjaGVkIHJldmlzaW9ucyB1bmRlciB0
ZXN0OgogIEFyZCBCaWVzaGV1dmVsIDxhcmQuYmllc2hldXZlbEBsaW5hcm8ub3JnPgogIEJyZXQg
QmFya2VsZXcgPEJyZXQuQmFya2VsZXdAbWljcm9zb2Z0LmNvbT4KICBGYW4sIFpoaWp1WCA8emhp
anV4LmZhbkBpbnRlbC5jb20+CiAgR2FyeSBMaW4gPGdsaW5Ac3VzZS5jb20+CiAgTGFzemxvIEVy
c2VrIDxsZXJzZWtAcmVkaGF0LmNvbT4KICBaYWlsaWFuZyBTdW4gPHphaWxpYW5nLnN1bkBpbnRl
bC5jb20+CiAgWmhpY2hhbyBHYW8gPHpoaWNoYW8uZ2FvQGludGVsLmNvbT4KICBaaGlqdS5GYW4g
PHpoaWp1eC5mYW5AaW50ZWwuY29tPgoKam9iczoKIGJ1aWxkLWFtZDY0LXhzbSAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYXNzICAgIAogYnVpbGQtaTM4Ni14
c20gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAg
CiBidWlsZC1hbWQ2NCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgcGFzcyAgICAKIGJ1aWxkLWkzODYgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBwYXNzICAgIAogYnVpbGQtYW1kNjQtbGlidmlydCAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHBhc3MgICAgCiBidWlsZC1pMzg2LWxp
YnZpcnQgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZmFpbCAgICAK
IGJ1aWxkLWFtZDY0LXB2b3BzICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBwYXNzICAgIAogYnVpbGQtaTM4Ni1wdm9wcyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIGZhaWwgICAgCiB0ZXN0LWFtZDY0LWFtZDY0LXhsLXFlbXV1LW92
bWYtYW1kNjQgICAgICAgICAgICAgICAgICAgICAgICAgcGFzcyAgICAKIHRlc3QtYW1kNjQtaTM4
Ni14bC1xZW11dS1vdm1mLWFtZDY0ICAgICAgICAgICAgICAgICAgICAgICAgICBibG9ja2VkIAoK
Ci0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLQpzZy1yZXBvcnQtZmxpZ2h0IG9uIG9zc3Rlc3QudGVzdC1sYWIueGVucHJvamVjdC5vcmcK
bG9nczogL2hvbWUvbG9ncy9sb2dzCmltYWdlczogL2hvbWUvbG9ncy9pbWFnZXMKCkxvZ3MsIGNv
bmZpZyBmaWxlcywgZXRjLiBhcmUgYXZhaWxhYmxlIGF0CiAgICBodHRwOi8vbG9ncy50ZXN0LWxh
Yi54ZW5wcm9qZWN0Lm9yZy9vc3N0ZXN0L2xvZ3MKCkV4cGxhbmF0aW9uIG9mIHRoZXNlIHJlcG9y
dHMsIGFuZCBvZiBvc3N0ZXN0IGluIGdlbmVyYWwsIGlzIGF0CiAgICBodHRwOi8veGVuYml0cy54
ZW4ub3JnL2dpdHdlYi8/cD1vc3N0ZXN0LmdpdDthPWJsb2I7Zj1SRUFETUUuZW1haWw7aGI9bWFz
dGVyCiAgICBodHRwOi8veGVuYml0cy54ZW4ub3JnL2dpdHdlYi8/cD1vc3N0ZXN0LmdpdDthPWJs
b2I7Zj1SRUFETUU7aGI9bWFzdGVyCgpUZXN0IGhhcm5lc3MgY29kZSBjYW4gYmUgZm91bmQgYXQK
ICAgIGh0dHA6Ly94ZW5iaXRzLnhlbi5vcmcvZ2l0d2ViP3A9b3NzdGVzdC5naXQ7YT1zdW1tYXJ5
CgoKTm90IHB1c2hpbmcuCgooTm8gcmV2aXNpb24gbG9nOyBpdCB3b3VsZCBiZSA1MDQgbGluZXMg
bG9uZy4pCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
